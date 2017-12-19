floragrid <-
function (extent, resolution = "CELL") {
	#	test and set arguments
	if (missing(extent)) {
		stop("please supply exent", call. = FALSE)
	}
	if (inherits(extent, "Extent") | inherits(extent, "Spatial")) {
		e <- extent(extent)
	} else {
		stop("extent must be an Extent or Spatial* object")
	}

	RESOLUTION <- c("GRID", "CELL")
	resolution <- match.arg(resolution, RESOLUTION, several.ok = FALSE)

	if (resolution == "GRID") { xx <- 10; yy <- 6 }
	if (resolution == "CELL") { xx <-  5; yy <- 3 }

	message("use resolution ", resolution, " (", xx, "' x ", yy, "')")
	
	#	build grid using raster
	r <- raster(e, # pretty(e, resolution = resolution),
		res = c(xx / 60, yy / 60), crs = "+init=epsg:4326")
	r <- as(r, "SpatialPolygons")

	#	assign grid ids using center coordinates
	d <- data.frame(t(apply(coordinates(r), 1,
		function (x) lnglat2gridcell(x[ 1 ], x[ 2 ]))),
		stringsAsFactors = FALSE)
	
	r <- SpatialPolygonsDataFrame(r, d)

	return(r)
}
	
floragridlines <-
function (extent, resolution = "CELL", frame = TRUE) {

	#	get nodes from polygon grid
	r <- floragrid(extent = extent, resolution = resolution)
	e <- extent(r)
	xy <- coordinates(as(as(r, "SpatialLines"), "SpatialPoints"))

	#	find edge nodes
	i1 <- xy[, 1] == e[1] | xy[, 1] == e[2] # xmin and xmax
	i2 <- xy[, 2] == e[3] | xy[, 2] == e[4] # ymin and ymax
	xy <- xy[ as.logical(i1 + i2), ]
	
	#	seperate edges and ensure order
	h <- xy[, 1] == e[1] | xy[, 1] == e[2]  # horizontal
	v <- xy[, 2] == e[3] | xy[, 2] == e[4]  # vertical
	h <- unique(xy[ h, ])
	v <- unique(xy[ v, ])
	h <- h[ order(h[, 2], decreasing = TRUE), ]
	v <- v[ order(v[, 1]), ]

	#	build lines
	h <- apply(cbind(seq(1, nrow(h), by = 2), seq(2, nrow(h), by = 2)), 1,
		function (x) { Line(h[ c(x[ 1 ], x[ 2 ]), ]) } )

	v <- apply(cbind(seq(1, nrow(v), by = 2), seq(2, nrow(v), by = 2)), 1,
		function (x) { Line(v[ c(x[ 1 ], x[ 2 ]), ]) } )

	#	drop frame
	if (frame) {
		h <- Lines(h, ID = "h")
		v <- Lines(v, ID = "v")
	} else {
		h <- Lines(h[ 2:(length(h) - 1) ], ID = "h")
		v <- Lines(v[ 2:(length(v) - 1) ], ID = "v")
	}	

	r <- SpatialLines(list(h,v), proj4string = CRS(proj4string(r)))

	return(r)
}

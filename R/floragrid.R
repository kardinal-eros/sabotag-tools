#	polygon grid
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

	if (resolution == "GRID") {
		xx <- 10; yy <- 6
		message("can't calculate propper GRIDCELL at resolution ", resolution)
	}
	if (resolution == "CELL") { xx <-  5; yy <- 3 }

	message("use resolution ", resolution, " (", xx, "' x ", yy, "')")
	
	#	build grid using raster
	r <- raster(e,
		res = c(xx / 60, yy / 60), crs = "+init=epsg:4326")
	r <- as(r, "SpatialPolygons")

	#	assign grid ids using center coordinates
	d <- data.frame(t(apply(coordinates(r), 1,
		function (x) lnglat2gridcell(x[ 1 ], x[ 2 ]))),
		stringsAsFactors = FALSE)
	
	r <- SpatialPolygonsDataFrame(r, d)

	return(r)
}

#	lines grid based on	polygon grid	
floragridlines <-
function (extent, resolution = "CELL", frame = TRUE, coarse = FALSE) {

	#	get nodes from polygon grid
	r <- floragrid(extent = extent, resolution = resolution)
	e <- extent(r)
	#	this step is computational intensive
	xy <- coordinates(as(as(r, "SpatialLines"), "SpatialPoints"))
	
	#	find edge nodes
	i1 <- xy[ ,1 ] == e[1] | xy[ ,1 ] == e[2] # xmin and xmax
	i2 <- xy[ ,2 ] == e[3] | xy[ ,2 ] == e[4] # ymin and ymax
	xy <- xy[ as.logical(i1 + i2), ]
	
	#	seperate edges and ensure order
	h <- xy[ ,1 ] == e[1] | xy[ ,1 ] == e[2]  # horizontal
	v <- xy[ ,2 ] == e[3] | xy[ ,2 ] == e[4]  # vertical
	h <- unique(xy[ h, ])
	v <- unique(xy[ v, ])
	h <- h[ order(h[ ,2 ], decreasing = TRUE), ]
	v <- v[ order(v[ ,1 ]), ]
	
	if (coarse) {
		message("coarse ", coarse)
		#	find integer values (wohle numbers) in coordinates
		#	and subset h and v coordiante pairs
		i <- apply(h, 1, function (x) {
			!length(grep("[^[:digit:]]", format(x[2], scientific = FALSE)))	
		})
		
		h <- h[ i, ]
		
		i <- apply(v, 1, function (x) {
			!length(grep("[^[:digit:]]", format(x[1], scientific = FALSE)))	
		})
		
		v <- v[ i, ]
	}

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

#	tiock marks based on line grid
ticks <- 
function (extent, resolution = "GRID", coarse = FALSE) {
	l <- floragridlines(extent, resolution = resolution, coarse = coarse)
	xy <- coordinates(l)
	h <- do.call("rbind", xy[[ 1 ]])
	v <- do.call("rbind", xy[[ 2 ]])
	
	#	horizontal ticks along y axis
	#	seperate left (l) and right (r)
	hx <- h[ ,1 ]
	hy <- h[ ,2 ]
	hr <- range(hx)
	hl <- hx == hr[ 1 ]
	hr <- hx == hr[ 2 ]

	segments(x0 = hx[ hl ], y0 = hy[ hl ], x1 = hx[ hl ] + 10 / 60, y1 = hy[ hl ])
	segments(x0 = hx[ hr ], y0 = hy[ hr ], x1 = hx[ hr ] - 10 / 60, y1 = hy[ hr ])
	
	#	vertical ticks along x axis
	#	seperate top (t) and bottom (b)
	vx <- v[ ,1 ]
	vy <- v[ ,2 ]
	vr <- range(vy)
	vt <- vy == vr[ 1 ]
	vb <- vy == vr[ 2 ]
	
	segments(x0 = vx[ vt ], y0 = vy [ vt ], x1 = vx[ vt ], y1 = vy[ vt ] + 6 / 60)
	segments(x0 = vx[ vb ], y0 = vy [ vb ], x1 = vx[ vb ], y1 = vy[ vb ] - 6 / 60)
}

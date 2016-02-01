floragrid <-
function (extent, resolution = "CELL") {
		if (missing(extent)) stop("plese supply exent")
					
		if (inherits(extent, "Extent") | inherits(extent, "Spatial")) {
			e <- extent(extent)
		} else {
			stop("extent must be an Extent of Spatial* object")			
		}

		RESOLUTION <- c("GRID", "CELL")
		resolution <- match.arg(resolution, RESOLUTION, several.ok = FALSE)

		if (resolution == "GRID") xx <- 10; yy <- 6
		if (resolution == "CELL") xx <- 5; yy <- 3
				
		r <- raster(pretty(e, resolution = resolution),
			res = c(xx / 60, yy / 60), crs = "+init=epsg:4326")
		r <- as(r, "SpatialPolygons")

		d <- data.frame(t(apply(coordinates(r), 1,
			function (x) lnglat2gridcell(x[ 1 ], x[ 2 ]))),
			stringsAsFactors = FALSE)
	
		r <- SpatialPolygonsDataFrame(r, d)

		return(r)	
	}
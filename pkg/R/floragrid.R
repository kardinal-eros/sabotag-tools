floragrid <-
function (extent) {
		if (missing(extent)) stop("plese supply exent")
					
		if (inherits(extent, "Extent") | inherits(extent, "Spatial")) {
			e <- extent(extent)
		} else {
			stop("extent must be an Extent of Spatial* object")			
		}
	
		#	x resolution: 5 / 60 
		#	y resolution: 3 / 60
		interval <- function (x, y) {
			sort(floor(x) + seq(-1, 1, by = y / 60))
		}	

		min <- function (x, ...) {
			i <- interval(x, ...)
			i [ findInterval(x, i) ]
		}
		max <- function (x, ...) {
			i <- interval(x, ...)
			i [ findInterval(x, i) + 1 ]
		}
	
		e <- extent(c(min(xmin(e), 5), max(xmax(e), 5),
		min(ymin(e), 3), max(ymax(e), 3)) )
	
		r <- raster(extent(e), res = c(5 / 60, 3 / 60), crs = "+init=epsg:4326")
		r <- as(r, "SpatialPolygons")

		d <- data.frame(t(apply(coordinates(r), 1,
		function (x) lnglat2gridcell(x[ 1 ], x[ 2 ]))),
		stringsAsFactors = FALSE)
	
		r <- SpatialPolygonsDataFrame(r, d)

		return(r)	
	}

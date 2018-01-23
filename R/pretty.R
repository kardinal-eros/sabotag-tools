#	internal functions for .isPretty and pretty for compuation of extent
#	for .isPretty and pretty
.interval <-
function (x, ...) {
	sort(floor(x) + seq(-1, 1, by = ... / 60))	
}	

.min <-
function (x, ...) {
	i <- .interval(x, ...)
	i[ findInterval(x, i) ]
}

.max <- 
function (x, ...) {
	i <- .interval(x, ...)
	i[ findInterval(x, i) ]
}

#	for pretty only
#	somehow dirty, increase index at max bound
.max2 <- 
function (x, ...) {
	i <- .interval(x, ...)
	if (any(i == x)) {
		i[ i == x ]
	} else {
		i[ findInterval(x, i) + 1] 	
	}	
}
#	determine if extent is already in shape
.isPretty <- 
function (x, resolution, verbose = FALSE) {
	if (missing(resolution)) {
		resolution <- "GRID"
		if (verbose) message("set CELL (5' x 3') as default resolution ")
	}
		
	if (resolution == "GRID") { xx <- 10; yy <- 6 }	
	if (resolution == "CELL") { xx <-  5; yy <- 3 }	

	test1 <- .min(xmin(x), xx) == xmin(x)
	test2 <- .max(xmax(x), xx) == xmax(x)
	test3 <- .min(ymin(x), yy) == ymin(x)
	test4 <- .max(ymax(x), yy) == ymax(x)
	
	if (all(test1, test2, test3, test3)) {
		r <- TRUE
	} else {
		r <- FALSE
	}
	
	return(r)
} 

if (!isGeneric("pretty")) {
	setGeneric("pretty", function (x, ...) standardGeneric("pretty"))
}

setMethod("pretty",
	signature(x = "Extent"),
	function (x, resolution, add = 0, mar = c(0,0,0,0), verbose = FALSE, ...) {
		if (missing(resolution)) {
			resolution <- "GRID"
			if (verbose) message("set GRID (10' x 6') as default resolution ")
		}
		
		RESOLUTION <- c("GRID", "CELL")
		resolution <- match.arg(resolution, RESOLUTION, several.ok = FALSE)
		
		#	set grid dims (xx,yy) in resolution
		if (resolution == "GRID") { xx <- 10; yy <- 6 }	
		if (resolution == "CELL") { xx <-  5; yy <- 3 }
					
		if (verbose) message("use resolution ", resolution, " (", xx, "' x ", yy, "')")
		
		addx <- addy <- 0
		if (add != 0) {
			addx <- xx / 60 * add
			addy <- yy / 60 * add
		}
		
		if (any(mar > 0)) {
			mar <- mar * c(yy, xx, yy, xx) / 60 # bottom, left, top, right
		}
		
		test <- .isPretty(x, resolution = resolution)
		
		#	if TRUE just use add and mar
		if (test) {
			if (verbose) message("extent already in shape for resolution ", resolution)
		r <- raster::extent(c(
			xmin(x) - addx - mar[ 2 ], xmax(x) + addx + mar[ 4 ],
			ymin(x) - addy - mar[ 1 ], ymax(x) + addy + mar[ 3 ]))			
		} else {
		#	if FALSE find interval and use add and mar
			if (verbose) message("find pretty extent for resolution ", resolution)
		r <- raster::extent(c(
			.min(xmin(x), xx) - addx - mar[ 2 ], .max2(xmax(x), xx) + addx + mar[ 4 ],
			.min(ymin(x), yy) - addy - mar[ 1 ], .max2(ymax(x), yy) + addy + mar[ 3 ]))
		}
		return(r)		
		}	
)

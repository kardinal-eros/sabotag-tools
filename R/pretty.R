#	determine if already in shape
.isPretty <- 
function (x) {
	
} 

#	internal functions for pretty to get calculate of extent
.interval <-
function (x, ...) {
	sort(floor(x) + seq(-1, 1, by = ... / 60))	
}	

.min <-
function (x, ...) {
	i <- .interval(x, ...)
	i [ findInterval(x, i) ]
}

.max <- 
function (x, ...) {
	i <- .interval(x, ...)
	i [ findInterval(x, i) + 1]
}

if (!isGeneric("pretty")) {
	setGeneric("pretty", function (x, ...) standardGeneric("pretty"))
}

setMethod("pretty",
	signature(x = "Extent"),
	function (x, resolution, add = 0, mar = c(0,0,0,0), ...) {
		if (missing(resolution)) {
			resolution <- "CELL"
			message("set \"CELL\" (5' x 3') as default resolution ")
		}
		
		RESOLUTION <- c("GRID", "CELL")
		resolution <- match.arg(resolution, RESOLUTION, several.ok = FALSE)
		
		if (resolution == "GRID") { xx <- 10; yy <- 6 }	
		if (resolution == "CELL") { xx <-  5; yy <- 3 }
		
		message("use resolution ", resolution, " (", xx, "' x ", yy, "')")		
		
		addx <- addy <- 0
		if (add > 0) {
			addx <- xx / 60 * add
			addy <- yy / 60 * add
		}
		
		if (any(mar > 0)) {
			mar <- c(mar - 1) * c(yy, xx, yy, xx) / 60 # bottom, left, top, right
		}
		
		r <- extent(c(
		.min(xmin(x), xx) - addx - mar[ 2 ], .max(xmax(x), xx) + addx + mar[ 4 ],
		.min(ymin(x), yy) - addy - mar[ 1 ], .max(ymax(x), yy) + addy + mar[ 3 ]))
		
		return(r)		
		}	
)

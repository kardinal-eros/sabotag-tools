#	internal functions for pretty to get calculate of extent
.interval <-
function (x, ...) {
	sort(floor(x) + seq(-1, 1, by = ... / 60))	
}	

.max <- .min <-
function (x, ...) {
	i <- .interval(x, ...)
	i [ findInterval(x, i) ]
}

if (!isGeneric("pretty")) {
	setGeneric("pretty", function (x, ...) standardGeneric("pretty"))
}

setMethod("pretty",
	signature(x = "Extent"),
	function (x, resolution, ...) {
		if (missing(resolution)) {
			resolution <- "CELL"
			message("set \"CELL\" (5' x 3') as default resolution ")
			#	message("set \"GRID\" (10' x 6') as default resolution ")
		}
		
		RESOLUTION <- c("GRID", "CELL")
		resolution <- match.arg(resolution, RESOLUTION, several.ok = FALSE)
		
		if (resolution == "GRID") { xx <- 10; yy <- 6 }	
		if (resolution == "CELL") { xx <-  5; yy <- 3 }
		
		message("use resolution ", resolution, " (", xx, "' x ", yy, "')")		
		
		r <- extent(c(
		.min(xmin(x), xx), .max(xmax(x), xx),
		.min(ymin(x), yy), .max(ymax(x), yy)) )
		
		return(r)		
		}	
)

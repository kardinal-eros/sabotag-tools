.margin <- 
function (object, resolution, ...) {
	if (missing(resolution)) {
		resolution <- "GRID"
	}
	#	input extent
	e0 <- extent(object)
	#	input extent minus 1 grid unit
	e1 <- pretty(e0, resolution = resolution, add = -1)
	#	grids for extents
	g0 <- floragrid(e0, resolution)
	g1 <- floragrid(e1, resolution)
	#	not covered by minus extent
	r <- g0[ -match(g1$GRIDCELL, g0$GRIDCELL), ]
	
	return(r)
}

if (!isGeneric("margin")) {
	setGeneric("margin",
	function (object, ...) {
		standardGeneric("margin")
	})
}

setMethod("margin",
	signature(object = "Background"),
	function (object, ...) {
		.margin(object)
	}
)

if (!isGeneric("labelmargin")) {
	setGeneric("labelmargin",
	function (object, ...) {
		standardGeneric("labelmargin")
	})
}

.labelmargin <- 
function (object, ...) {
	x <- .labelpoints(object)
	i <- match(.corners(object)$GRID, x$GRID)
	x <- x[ -i,]
	text(x, labels = x$LABEL, ...)
}

setMethod("labelmargin",
	signature(object = "Background"),
	function (object, ...) {
		.labelmargin(object)
	}
)
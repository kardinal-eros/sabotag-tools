background <- 
function (extent, waters = TRUE, reliefmap = TRUE, gridlines = TRUE, pretty = FALSE, add = 0, tol = 0.005, strahler = 4, score = 3) {
	requireNamespace("sabotagdata")
	requireNamespace("rgeos")	
	
	#	for safty
	extent <- extent(extent)
	stopifnot(inherits(extent, "Extent"))
	
	#	matches data
	#waters <- gOverlaps(
	#		extent2polygon(extent),
	#		extent2polygon(extent(sabotagdata::rivers)))
	#reliefmap <- gOverlaps(
	#		extent2polygon(extent),
	#		extent2polygon(extent(sabotagdata::relief)))
				
	if (pretty) {
		e <- pretty(extent, resolution = "GRID") # calculated extent
	} else {
		e <- extent
	}
	g <- floragrid(e, resolution = "GRID")       # grid fitting extent
	f <- extent2polygon(e)                       # frame polygon
	
	if (waters) {
		#data("rivers", package = "sabotagdata")
		#data("lakes", package = "sabotagdata")
		rivers <- sabotagdata::rivers
		lakes <- sabotagdata::lakes		
		w1 <- crop(rivers[rivers$STRAHLER > strahler, ], e) # rivers
		w2 <- crop(lakes[lakes$SCORE > score, ], e)      # lakes
		#	simplify geometry
		if (tol > 0) {
			w1x <- w1$STRAHLER # save variable
			w2x <- w2$SCORE    # save variable			
			w1 <- rgeos::gSimplify(w1, tol = tol, topologyPreserve = TRUE)
			w2 <- rgeos::gSimplify(w2, tol = tol, topologyPreserve = TRUE)
			w1 <- SpatialLinesDataFrame(w1, data.frame(STRAHLER = w1x), match.ID = FALSE)
			w2 <- SpatialPolygonsDataFrame(w2, data.frame(SCORE = w2x), match.ID = FALSE)			
		}		
	} else {
		w1 <- NULL
		w2 <- NULL
	}
	
	if (reliefmap) {
		#data("relief", package = "sabotagdata")
		r <- crop(sabotagdata::relief, e) 
	} else {
		r <- NULL
	}
	
	if (gridlines) {
		l <- floragridlines(extent(g), "GRID", frame = FALSE)
	} else {
		l <- NULL
	}
	
	r <- list(extent = extent(g), rivers = w1, lakes = w2,
		relief = r,	grid = g, gridlines = l)
	r <- new("Background", layers = r, symbology = list())
	
	return(r)
}

#	show and summary methods
setMethod("show",
	signature(object = "Background"),
	function (object) {
	cat(paste("class       :", class(object)), "\n")
	#	cat("elements of slot 'layers'\n")
	for (i in seq_along(object@layers)) {
		cat(format(names(object@layers)[ i ], width = 12) )
		cat(": ")
		cat(class(object@layers[[ i ]]))
		cat("\n")
	}
	cat(format("symbology", width = 12))
	cat(": ")
	cat(class(object@symbology))
	}
)
	
#summary.background <-
#function (object, ...) {
#	stopifnot(inherits(object, "background"))
#	cat(paste("Object of class", class(object)), "\n")
#	print(!sapply(object, is.null))
#}

.plotBackground <-
function (x, mar = rep(0,4), plain = FALSE, frame = TRUE, col,  ...) {
	#stopifnot(inherits(x, "background"))
	if (missing(col)) {
		col <- rgb(31, 120, 180, 255, maxColorValue = 255)
	}
	
	#	set plotting region
	opar <- par(mar = mar)
	on.exit(par(opar))
	
	if (plain) {
		#	no margins
		plot(extent2polygon(x@layers$extent), axes = FALSE, xaxs = "i", yaxs = "i", lty = 0)
	} else {
		plot(extent2polygon(x@layers$extent), axes = FALSE, xaxs = "i", yaxs = "i", lty = 0)
		#	plot layers	
		if (!is.null(x@layers$relief)) {
			plotRGB(x@layers$relief, add = TRUE, ...)
		}
		if (!is.null(x@layers$rivers)) {			
			lines(x@layers$rivers, col = col, lwd = .normalize(x@layers$rivers$STRAHLER) + 1, ...)
		}
		if (!is.null(x@layers$lakes)) {						
			plot(x@layers$lakes, add = TRUE, col = col, border = NA, ...)
		}
		if (!is.null(x@layers$gridlines)) {
			lines(x@layers$gridlines, lwd = 1/.75 * 0.2, ...)
		}
		if (frame) {
			plot(extent2polygon(x@layers$extent), add = TRUE)
		}
	}
}

#	plot method
setMethod("plot",
	signature(x = "Background", y = "missing"),
	.plotBackground
)
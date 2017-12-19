background <- 
function (extent, waters = TRUE, reliefmap = TRUE, gridlines = TRUE, tol = 0.005, strahler = 4, score = 3) {
	requireNamespace("sabotagdata")
	requireNamespace("rgeos")	
	
	#	for safty
	extent <- extent(extent)
	stopifnot(inherits(extent, "Extent"))
	
	e <- pretty(extent, resolution = "GRID", add = 2) # calculated extent
	g <- floragrid(e, resolution = "GRID")            # grid fitting extent
	f <- extent2polygon(e)                            # frame polygon
	
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

	class(r) <- "background"
	
	return(r)
}

print.background <-
function (x, ...) {
	stopifnot(inherits(x, "background"))
	cat(paste("Object of class", class(x)), "with elements \n\n")
	for (i in seq_along(x)) {
		cat(names(x)[ i ])
		cat(": ")
		cat(class(x[[ i ]]))
		cat("\n")
	}
}
	
#summary.background <-
#function (object, ...) {
#	stopifnot(inherits(object, "background"))
#	cat(paste("Object of class", class(object)), "\n")
#	print(!sapply(object, is.null))
#}

plot.background <-
function (x, mar = rep(0,4), plain = FALSE, col,  ...) {
	stopifnot(inherits(x, "background"))
	if (missing(col)) {
		col <- rgb(31, 120, 180, 255, maxColorValue = 255)
	}
	
	#	set plotting region
	par(mar)
	
	if (plain) {
		plot(extent2polygon(x$extent), axes = FALSE, xaxs = "i", yaxs = "i", lty = 0)
	} else {
		#	plot layers	
		plotRGB(x$relief, ...)
		lines(x$rivers, col = col, lwd = .normalize(x$rivers$STRAHLER) + 1, ...)
		plot(x$lakes, add = TRUE, col = col, border = NA, ...)
		lines(x$gridlines, lwd = 1/.75 * 0.2, ...)
	}
}

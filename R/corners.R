.corners <-
function (object) {
	stopifnot(inherits(object, "Background"))
	
	d <- dimGridcell(object)
	
	bl <- paste0(d[ 3 ], d[ 1 ])			
	br <- paste0(d[ 3 ], d[ 2 ])		
	tl <- paste0(d[ 4 ], d[ 1 ])
	tr <- paste0(d[ 4 ], d[ 2 ])	
	
	i <- c(bl, br, tl, tr)
	j <- deparseGridcell(margin(object)$GRIDCELL)
	
	r <- margin(object)
	r$CORNER <- FALSE
	r$CORNER[ match(i, r$GRID) ] <- TRUE
	r$ROW <- j[, 4]
	r$COLUMNS <- j[, 5]	
	r <- r[ r$CORNER, ]
	return(r)
}

.labelpoints <- 
function (object) {
	x <- margin(object)
	
	#	turn into SpatialPoints
	x <- data.frame(deparseGridcell(x$GRIDCELL))
	coordinates(x) <- xy <- coordinates(margin(object))
	proj4string(x) <- CRS("+init=epsg:4326")
	
	#	get labels for positions
	#	left
	r1 <- x[ round(xy[ ,1 ], 6) == round(xmin(x), 6), ]
	r1$LABEL <- r1$ROW
	#	top
	r2 <- x[ round(xy[ ,2 ], 6) == round(ymax(x), 6), ]
	r2$LABEL <- r2$COLUMN
	#	right
	r3 <- x[ round(xy[ ,1 ], 6) == round(xmax(x), 6), ]
	r3$LABEL <- r3$ROW
	#	bottom
	r4 <- x[ round(xy[ ,2 ], 6) == round(ymin(x), 6), ]
	r4$LABEL <- r4$COLUMN
	
	#	bind and remove duplicates, they occur at corners
	r <- do.call("rbind", list(r1, r2, r3, r4))
	r <- r[ !duplicated(r$GRID), ]
		
	return(r)
}
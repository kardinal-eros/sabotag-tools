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
	r1 <- x[ xy[ ,1 ] == xmin(x), ]
	r1$LABEL <- r1$ROW
	#	top
	r2 <- x[ xy[ ,2] == ymax(x), ]
	r2$LABEL <- r2$COLUMN
	#	right
	r3 <- x[ xy[ ,1 ] == xmax(x), ]
	r3$LABEL <- r3$ROW
	#	bottom
	r4 <- x[ xy[ ,2] == ymin(x), ]
	r4$LABEL <- r4$COLUMN
	
	#	bind and remove duplicates, they occur at corners
	r <- do.call("rbind", list(r1, r2, r3, r4))
	r <- r[ !duplicated(r$GRID), ]
		
	return(r)
}
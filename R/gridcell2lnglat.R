gridcell2lnglat <-
function (x) {
	
	x <- as.character(x)
	x <- deparseGridcell(x)
	ROW <- as.numeric(x[, colnames(x) == "ROW"])
	COLUMN <- as.numeric(x[, colnames(x) == "COLUMN"])	
	CELL <- as.numeric(x[, colnames(x) == "CELL"])	

	#	calculate coordinates of upper left corner of grid unit
	GRIDx <- -((-COLUMN - 34) / 6)
	GRIDy <- (-ROW + 560)  / 10
	#	get shift values for cell from upper left corner
	#	a grid cell measures 5 x 3 degrees (longitude x latitude)
	CELLxy <- t(sapply(CELL, .cellshift))
	
	r <- cbind(GRIDx, GRIDy, deparse.level = 0) + CELLxy

	return(r)
}
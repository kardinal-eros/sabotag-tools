formatGridcell <-
function (x, sep = NULL) {
	x <- as.character(x)
	n <- nchar(x)
	#	no seperator, CELL is the last digit
	if (is.null(sep)) {
		GRID <- substr(x, 1, n - 1)
		CELL <- substr(x, n, n)
	}
	#	use seperator
	if (!is.null(sep)) {
		x <- strsplit(x, sep, fixed = TRUE)
		GRID <- sapply(x, "[[", 1)
		CELL <- sapply(x, "[[", 2)
	}

	r <- paste(GRID, CELL, sep = "-")
	
	return(r)
}


deparseGridcell <- 
function (x, sep = "-", row.width = 2, col.width = 2) {
	x <- as.character(x)
	r <- strsplit(x, sep, fixed = TRUE)
	GRID <- sapply(r, "[[", 1)
	CELL <- sapply(r, "[[", 2)
	GRIDCELL <- x
	ROW <- substring(GRID, 1, row.width)
	COLUMN <- substring(GRID, row.width + 1, row.width + col.width)

	r <- cbind(GRIDCELL, GRID, CELL, ROW, COLUMN)

	return(r)	
}



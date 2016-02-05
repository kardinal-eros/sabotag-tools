zobodat <- function (x) {
	stopifnot(file.exists(x))
	#	decimal in coordiantes is dot but column sperator is semicolon as used throughout german speaking countries
	x <- read.csv(x, fileEncoding = "ISO_8859-1", stringsAsFactors = FALSE,
		dec = ".", sep = ";")
	#	substitue non-ASCII characters
	names(x) <- gsub("\u00E4", "ae", names(x))
	names(x) <- gsub("\u00F6", "oe", names(x))
	#	discards observation withj missing coordiantes
	if ( any(is.na(x$Laenge)) | any(is.na(x$Breite)) ) {
		i <- !is.na(x$Laenge) & !is.na(x$Breite)
		x <- x[ i, ]
	}
	#	for safty
	i <- x$Laenge != "" & x$Breite != ""
	x <- x[ i, ]
	
	#	if matrix is empty
	if (nrow(x) == 0) {
		warning("no observations with coordinates", call. = FALSE)
		return(NULL)		
	}	
		
	#	add sign to coordinates
	i <- x$E.W == "W"
	x$Laenge[ i ] <- x$Laenge[ i ] * -1
	
	i <- x$N.S == "S"
	x$Breite[ i ] <- x$Breite[ i ] * -1
	
	coordinates(x) <- ~ Laenge + Breite
	proj4string(x) <- CRS("+init=epsg:4326")
	
}
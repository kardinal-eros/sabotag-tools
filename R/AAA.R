#	internal functions
#	convert JASON tp SptaialPointsDataFrame
.jason2sp <- function (x, multi = TRUE) {
	stopifnot(is.list(x))
	r <- x$data
	
	if (multi) {
		r$GeoLaenge <- as.numeric(r$GeoLaenge)
		r$GeoBreite <- as.numeric(r$GeoBreite)
		coordinates(r) <- ~GeoLaenge+GeoBreite
	} else {
		xy <- matrix(unlist(x$coordinate), ncol = 2, nrow = nrow(x$data), byrow = TRUE)[ , c(2,1) ]
		coordinates(r) <- xy
	} 
	
	proj4string(r) <- CRS("+init=epsg:4326")
	
	return(r)
}

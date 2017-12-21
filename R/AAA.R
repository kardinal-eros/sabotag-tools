#.onLoad <- function(libname, pkgname) {
#  data("model1", "mydata", package=pkgname, envir=parent.env(environment()))
#}

### internal functions
#	process jason from Bergfex (API)
.jason2sp.bergfex <-
function (x, multi = TRUE) {
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

#	process jason from Open-Elevation API
.jason2sp.elevation <- function (x) {
	stopifnot(is.list(x))
	r <- x$results	
	coordinates(r) <- ~ longitude+latitude
	proj4string(r) <- CRS("+init=epsg:4326")
	
	return(r)
}

#	normalize to 0 and 1
.normalize <- 
function (x) {
	r <- (x - min(x)) / (max(x) - min(x))
	
	return(r)
}

#	coordiante deviation of grid cell from upper left corner of grid unit
.cellshift <- 
function (x) {
	if (x == 1) {
		rx <- 2.5 / 60
		ry <- -(1.5) / 60
	}
	if (x == 2) {
		rx <- (5 + 2.5)  / 60
		ry <- -(1.5) / 60
	}
	if (x == 3) {
		rx <- 2.5 / 60
		ry <- -(3 + 1.5) / 60
	}
	if (x == 4) {
		rx <- (5 + 2.5)  / 60
		ry <- -(3 + 1.5) / 60
	}
	
	r <- c(rx, ry)

	return(r)	
}

#	determine extenrt ratio for plotting
.extent.ratio <- 
function (x) {
	xlim <- bbox(x)[ 1, ]
	ylim <- bbox(x)[ 2, ]
	# aspect as in plot.Spatial for unprojected data
	a <- 1 / cos((mean(ylim) * pi) / 180) 
	r <- c(diff(xlim), diff(ylim), a)
	r[ 4 ] <- r[ 1 ] / (r[ 2 ] * r[ 3 ])

	names(r) <- c("xlim", "ylim", "yasp", "ratio")

	return(r)	
}

### S4 classes and methods
#	class occurrences
setClass("Occurrences",
	representation(
	taxa = "character",
	symbology = "list"),
	validity = function (object) {
		any(names(object) == "gridcell")
		#any(names(object) == "date")		
	},
	contains = c("SpatialPointsDataFrame")
)

showClass("Occurrences")

#	class occurrences
setClass("Background",
	representation(
	layers = "list",
	symbology = "list"),
	validity = function (object) {	
	}
)

showClass("Background")

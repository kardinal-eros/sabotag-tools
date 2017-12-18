geocode.austria <-
function (x, p = 100, sp = FALSE, bergfex = FALSE, ...) {
	data(aut)

	#	dropped geonames dependency
	#if (is.null(options()$geonamesUsername))
	#	stop("set geonames user name, see ?geonames")
	
	#	test arguments
	if (!inherits(x, "SpatialPointsDataFrame")) {
		stop("please supply an object of class SpatialPointsDataFrame")
	}
	
	if (is.na(proj4string(x))) {
		stop("check proj4string of object")
	} else {
		if (!identical(x, aut)) {
			x <- spTransform(x, proj4string(aut))
		}
	}

	#	test if we have columns named a 'accuracy' or 'precision'
	p <- sapply(c("accuracy", "precision"),
		function (y) agrep(y, names(x)))
		
	l <- sapply(p, length) > 0
	if (any(l)) {
		p <- unlist(p[ which(l) ])
	} else {
		message("variables accuracy or precision not found")
	}
	if (length(p) == 1) {
		p <- slot(x, "data")[, p]
		if (!is.numeric(p)) {
			p <- as.numeric(p)
			if (any(is.na(p))) {
				na <- 20
				p[ is.na(p) ] <- na
				message("replace NA with ", na)
			}
		}
	} else {
		message("multiple matches for variables accuracy or precision")
		p <- rep(NA, nrow(x))
	}

	#	query polygons, fast
	message("query administrative boundaries for Austria")
	locality <- over(x, aut)
	locality <- locality[c("ST", "BL", "PB", "PG")]
	locality <- as.data.frame(as.matrix(locality), stringsAsFactors = FALSE)
	
	#	outside of polygon coverage
	i <- is.na(locality[, 1])
	
	locality$PB[ !i ] <- paste("Bezirk", locality$PB)[ !i ]
	locality <- apply(locality, 1, paste, collapse = ", ")
	locality[ i ] <- NA

	#	query bergfex server
	if (bergfex) {
		message("query bergfex for toponyms, be patient")
		toponym <- bergfex2(x)@data
		type <- toponym$Typ
		toponym <- toponym$Name
		locality <- paste(locality, toponym, sep = ", ")
	}
		
	#	query elevation
	message("query elevations")
	masl <- elevation(x = x)$elevation
	
	#	format accuracy string
	p <- paste0("\u00B1", p, "m")
	#	format coordiante string
	ew <- paste(format(abs(coordinates(x)[, 1]), nsmall = 6),
		ifelse(coordinates(x)[, 1] < 0, "W", "E"), sep = "")
	ns <- paste(format(abs(coordinates(x)[, 2]), nsmall = 6),
		ifelse(coordinates(x)[, 2] < 0, "S", "N"), sep = "")
	#	groome and format elevation strings		
	al <- paste(ifelse(masl == -32768, "N/A", c(round(masl/10) * 10)), "masl")
	
	#	paste into a single string
	coordinates <- paste(al, ", ", ns, ", ", ew, ", ", p, sep = "") 
	
	#	results object
	r <- data.frame(coordinates, locality, austria = !i, stringsAsFactors = FALSE)
	
	#	for those points outside polygon coverage, use OpenStreetMap query instead
	i <- !r$austria
	if (any(i)) {
		message("(some) coordinates outside Austria, now quering openstreetmap, be patient")
		ri <- nominatim2(x[ i, ])@data
		r$locality[ i ] <- apply(as.matrix(ri), 1, paste, collapse = ", ")
	}
	
	#	clean up remove column
	r <- r[ , -grep("austria", names(r))]
	
	if (sp) {
		coordinates(r) <- coordinates(x)
		proj4string(r) <- CRS("+init=epsg:4326")
	}
	
	return(r)
}

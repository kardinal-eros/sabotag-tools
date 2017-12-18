#	hidden function to query coordiantes for toponyms
#	single coordinate pair interface 
.bergfex1 <-
function (q, sp, first) {
	requireNamespace("jsonlite")
	
	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url,q)

	r <- jsonlite::fromJSON(url)
	
	if (sp) {
		r <- .jason2sp.bergfex(r, multi = TRUE)
		if (first) r <- r[1, ]
	} else {
		if (first) r$data <- r$data[1, ]
	}
	
	return(r)
}

#	hidden function to query toponyms for coordinates
#	single coordinate pair interface
.bergfex2 <-
function (lng, lat, sp, first, multi = TRUE) {
	requireNamespace("jsonlite")
	x <- lng
	y <- lat
	lng <- paste0(lng, ifelse(lng >= 0, "E", "W"))
	lat <- paste0(lat, ifelse(lat >= 0, "N", "S"))

	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url, lat, ",", lng)
	
	r <- jsonlite::fromJSON(url)
	
	#	bergfex might not return an answer
	if (length(r$data) == 0) {
		message("bergfex retunred no answer for ", url)	
		r <- list(
			data = data.frame(
				"ID" = NA, "Name" = NA, "Staat" = NA, "Region" = NA, "Hoehe" = NA,
				"GeoBreite" = 0, "GeoLaenge" = 0,
				"ID_GeoPunkteTypen" = NA, "Typ" = NA, "Level" = 0, "Link" = NA),
			coordinate = list(lat = x, lng = y))
		if (sp) {
			r[[1]]$GeoLaenge = x
			r[[1]]$GeoBreite = y
		}	
	}
	
	if (sp) {
		r <- .jason2sp.bergfex(r, multi = multi)
		if (first) {
			r <- r[ !is.na(r$Level), ]	
			r <- r[1, ]
		}	
	} else {
		if (first) {
			r$data <- r$data[1, ]
		}	
	}
	
	return(r)
}

#	interface to query coordinate ('lng', 'lat') pairs or toponym (argument 'q')
bergfex <-
function (lng, lat, q, sp = FALSE, first = FALSE) {
	requireNamespace("jsonlite")
	if (missing(lng) | missing(lat)) {
		if (missing(q)) {
			stop("please provide geographic coordinates (both 'lng', 'lat') or a query string ('q')")
		} else {
			r <- .bergfex1(q, sp = sp, first = first)
		}
	} else {
		r <- .bergfex2(lng = lng, lat = lat, sp = sp, first = first)
	}
	
	return(r)
}

#	query toponyms for coordinates
#	SpatialPointsDataFrame interface
bergfex2 <-
function (x, first = TRUE) {
	r <- apply(coordinates(x), 1, function (x) {
			ri <- .bergfex2(lng = x[ 1 ], lat = x[ 2 ], sp = TRUE, first = first)
		} )
	r <- do.call("rbind", r)	
	
	return(r)
}
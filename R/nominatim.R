.nominatim <- function (lng, lat, sp) {
	requireNamespace("jsonlite")

	url <- "http://nominatim.openstreetmap.org/reverse?format=jsonv2&"
	url <- paste0(url, "lat=", lat, "&lon=", lng)
	
	q <- jsonlite::fromJSON(url)
	
	q <- q$address
	
	#	fits Germany
	if (any(names(q) == "state_district")) {
	r <- data.frame(ST = q$country, BL = q$state, PB = q$state_district, PG = NA,
		stringsAsFactors = FALSE)
		#	groome abbreviated state names
		if (r$PB == "Obb" & r$BL == "Bayern" ) {
			r$PB <- "Landkreis Oberbayern"
		}
		if (r$PB == "OPf" & r$BL == "Bayern") {
			r$PB <- "Landkreis Oberpfalz"
		}
		if (r$PB == "NB" & r$BL == "Bayern") {
			r$PB <- "Landkreis Niederbayern"
		}
	} else {
	#	fits Austria		
	r <- data.frame(ST = q$country, BL = q$state, PB = q$county, PG = NA,
		stringsAsFactors = FALSE)
	}
	
	#	either town or village should be returned
	if (any(names(q) == "town")) {
		r$PG <- q$town
	} else {
		r$PG <- q$village
	}
	
	if (sp) {
		coordinates(r) <- cbind(lng, lat)
		proj4string(r) <- CRS("+init=epsg:4326")
	}
	
	return(r)
}	

nominatim <-
function (lng, lat, sp = FALSE) {
		r <- .nominatim(lng = lng, lat = lat, sp = sp)
	
	return(r)
}

nominatim2 <-
function (x) {
	r <- apply(coordinates(x), 1, function (x) {
			ri <- .nominatim(lng = x[ 1 ], lat = x[ 2 ], sp = TRUE)
		} )
	r <- do.call("rbind", r)	
	
	return(r)
}

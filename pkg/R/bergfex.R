.bergfex1 <- function (q, sp) {
	requireNamespace("jsonlite")
	
	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url,q)

	r <- jsonlite::fromJSON(url)
	
	if (sp) r <- .jason2sp(r, multi = TRUE)
	
	return(r)
}

.bergfex2 <- function (lng, lat, sp) {
	requireNamespace("jsonlite")
	
	lng <- paste0(lng, ifelse(lng >= 0, "E", "W"))
	lat <- paste0(lat, ifelse(lat >= 0, "N", "S"))

	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url,lat,",", lng)

	
	r <- jsonlite::fromJSON(url)
	
	if (sp) r <- .jason2sp(r, multi = TRUE)
	
	return(r)
}

bergfex <-
function (lng, lat, q, sp = TRUE) {
	requireNamespace("jsonlite")
	if (missing(lng) | missing(lat)) {
		if (missing(q)) {
			stop("please provide geographic coordinates (both 'lng', 'lat') or a query string ('q')")	
		} else {
			r <- .bergfex1(q, sp = sp)	
		}
	} else {
		r <- .bergfex2(lng = lng, lat = lat, sp = sp)
	}
		
	return(r)
}
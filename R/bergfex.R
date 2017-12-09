.bergfex1 <- function (q, sp, first) {
	requireNamespace("jsonlite")
	
	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url,q)

	r <- jsonlite::fromJSON(url)
	
	if (sp) {
		r <- .jason2sp(r, multi = TRUE)
		if (first) r <- r[1, ]
	} else {
		if (first) r$data <- r$data[1, ]
	}
	
	return(r)
}

.bergfex2 <- function (lng, lat, sp, first) {
	requireNamespace("jsonlite")
	
	lng <- paste0(lng, ifelse(lng >= 0, "E", "W"))
	lat <- paste0(lat, ifelse(lat >= 0, "N", "S"))

	url <- "http://www.bergfex.at/ajax/gmap/names/?q="
	url <- paste0(url,lat,",", lng)

	
	r <- jsonlite::fromJSON(url)
	
	if (sp) {
		r <- .jason2sp(r, multi = TRUE)
		if (first) r <- r[1, ]
	} else {
		if (first) r$data <- r$data[1, ]
	}
	
	return(r)
}

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

bergfex2 <-
function (x) {
	r <- apply(coordinates(x), 1, function (x) {
			.bergfex2(lng = x[ 1 ], lat = x[ 2 ], sp = TRUE, first = TRUE)
		} )
	r <- do.call("rbind", r)	
	
	return(r)
}
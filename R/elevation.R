#	query Open-Elevation API
.elevation <- function (lng, lat, sp, nsmall = 6) {
	requireNamespace("jsonlite")

	#	url template		
	url <- "https://api.open-elevation.com/api/v1/lookup?locations="
	#	coordinate pair template
	url2 <- "dd.dddddd,dd.dddddd"
	#	test mode of arguments, if appropiate, format digits
	if (!is.numeric(lng) | !is.numeric(lat)) {
		stop("please supply numeric vales for 'lng' and 'lat'", .call = FALSE)
	} else {
		lng <- format(lng, nsmall = nsmall)
		lat <- format(lat, nsmall = nsmall)
	}
	#	test length of arguments, if appropiate, get number of points
	if (length(lng) != length(lat)) {
		stop("'lng' and 'lat' need to be of the same lengths")
	} else {
		n <- length(lng)
	}
	
	if (n > 1) {
	#	avoid URL requests longer than 2048 chararcters
		if ((nchar(url) + n * nchar(url2)) > 2048) {
			#	split vector into 'i' chunks
			i <- ceiling(nchar(url2) * n / 2048)
			lng <- split(lng, cut(seq_along(lng), i, labels = FALSE))
			lat <- split(lat, cut(seq_along(lat), i, labels = FALSE))			
		
			urli <- vector("list", length = i)			
			
			for (i in 1:i) {
				urli[[ i ]] <- paste0(url, paste(lat[[ i ]], lng[[ i ]], sep = ",", collapse = "|"))
			}
						
		} else {
			i <- 0
			url <- paste0(url, paste(apply(cbind(lat, lng), 1, paste, collapse = ","), collapse = "|"))
		}
	} else {
		i <- 0
		url <- paste0(url, lat, ",", lng)
	}
	
	if (i > 1) { # need to process chunks
		message("request exceeds limit (resulting URL longer than 2048 chararcters)")
		
		ri <- c()
		
		for (i in 1:i) {
			ri <- rbind(ri, jsonlite::fromJSON(urli[[ i ]])$results)
		}
		
		r <- list(results = ri)
	} else {
		r <- jsonlite::fromJSON(url)
	}	
	if (sp) {
		r <- .jason2sp.elevation(r)
	} else {
		r <- r$results # we return a data.frame
	}
	
	return(r)
}

#	interface to query coordinate ('lng', 'lat') pairs and vectors of lactions
elevation <-
function (lng, lat, x, sp = FALSE) {
	if (missing(lng) & missing(lat)) {
		if (missing(x)) {
			stop("at least 'lng', 'lat' or 'x' should be supplied")
		} else {
			lng <- coordinates(x)[, 1]
			lat <- coordinates(x)[, 2]	
		}
	}

	r <- .elevation(lng, lat, sp = sp)

	return(r)
}


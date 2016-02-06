safapi <-
function (lng, lat, layers, format = "txt", service = "geoapi", server = "46.252.27.126", key = "574nd0r754n4ly53", sp = FALSE) {
	requireNamespace("jsonlite")
	
	#	server <- "quercus"
	#layers = c("bundesland", "gebirge")
	#format = "txt"

	stopifnot(is.numeric(lng))
	stopifnot(is.numeric(lat))
		
	LAYERS <- c("bundesland","bezirk","gemeinde","gebirge","quadrant","corine","gzert")
	FORMAT <- c("txt", "csv", "json")
	
	if (missing(layers)) layers <- LAYERS
	
	layers <- match.arg(layers, LAYERS, several.ok = TRUE)
	format <- match.arg(format, FORMAT, several.ok = FALSE)

	url <- paste0(
		"http://", server,
		"/api/api.php?service=", service,
		"&apikey=", 	key,
		"&lat=", lng, # lat,
		"&long=", lat, # lng, # maybe rename in API to lng,
		"&layers=",	paste0(layers, collapse = ","),
		"&format=", format)

	if (sp) {
		r <- rgdal::readOGR(url, 'OGRGeoJSON')
	} else {		
		r  <- switch(format,
			txt =  { r <- readLines(url) },
			csv =  { r <- read.csv(url) },
			json = { r <- jsonlite::fromJSON(url) })
	}
	return(r)
}

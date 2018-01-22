safapi <-
function (lng, lat, layers, format = "txt", service = "geoapi", server = "api.standortsanalyse.net", key = "574nd0r754n4ly53", sp = FALSE) {
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
	
	if (sp) {
		format <- "json"
	}
	url <- paste0(
		"https://", server,
		"/api.php?service=", service,
		"&apikey=", 	key,
		"&lat=", lng, # lat,
		"&long=", lat, # lng, # maybe rename in API to lng,
		"&layers=",	paste0(layers, collapse = ","),
		"&format=", format)

	if (sp) {
		#	stop("at the moment using package rgdal is not suppoerted")
		r <- rgdal::readOGR(url, 'OGRGeoJSON')
	} else {		
		r  <- switch(format,
			txt =  { r <- readLines(url) },
			csv =  { r <- read.csv2(url) },
			json = { r <- jsonlite::fromJSON(url) })
	}
	return(r)
}

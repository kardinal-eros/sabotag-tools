occurrences <- 
function (x, schema = c("taxon", "gridcell")) {
	#	determine class of x
	if (inherits(x, "Spatial")) {
		type = "coordinates"
	} else {
		type ="gridcell"
	}

	#	we are not case sensitif for schema collumns
	names(x) <- tolower(names(x))
	
	r <- switch(type,
		coordinates = {	
			x <- as(x, "SpatialPointsDataFrame")
			x$gridcell <- apply(coordinates(x), 1,
				function (x) { lnglat2gridcell(x[1], x[2]) })[ 1, ]
		r <- new("Occurrences", x, taxa = unique(as.character(x$taxon)), symbology = list())
		},
		gridcell = {
		#	for safety
		r <- as.data.frame(as.matrix(x), stringsAsFactors = FALSE, make.names = FALSE)
		n <- names(r)
		
		#	test schema
		test <- sapply(schema, function (y) any(y == n))

		if (!all(test)) {
			stop("did not find column(s): ",
				paste(schema[!test], collapse = " + "), ", maybe erroneously spelled")
		}	
	
		coordinates(r) <- gridcell2lnglat(r$gridcell)
		proj4string(r) <- CRS("+init=epsg:4326")
		
		r <- new("Occurrences", r, taxa = unique(r$taxon), symbology = list())
	})

	return(r)
}


.plotOccurrences <-
function (x, type, ...) {
	
	if (missing(type)) {
		type = "ASIS"
	}
	TYPE <- c("ASIS","GRIDCELL")	
	type <- match.arg(type, TYPE, several.ok = TRUE)
			
	
	if (type == "GRIDCELL") {
		x <- x[ !duplicated(x$gridcell), ]@data
		coordinates(x) <- gridcell2lnglat(x$gridcell)
		proj4string(x) <- CRS("+init=epsg:4326")
	}

	points(x, ...)
}

#	plot method
setMethod("plot",
	signature(x = "Occurrences", y = "missing"),
	.plotOccurrences
)
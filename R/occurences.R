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
		r <- new("Occurences", x, taxa = unique(as.character(x$taxon)), symbology = list())
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
		
		r <- new("Occurences", r, taxa = unique(r$taxon), symbology = list())
	})

	return(r)
}



#	get bordering frame as SpatialPolygons
.extent2polygon <- 
function (object, p4s) {
		if (missing(p4s)) {
			p4s <- "+init=epsg:4326"
		}	
		r <- as(object, "SpatialPolygons") 
		proj4string(r) <- CRS(p4s)
		
		return(r)
}

if (!isGeneric("extent2polygon")) {
	setGeneric("extent2polygon",
	function (object, ...) {
		standardGeneric("extent2polygon")
	})
}

setMethod("extent2polygon",
	signature(object = "Extent"),
	function (object, ...) {
		.extent2polygon(object)
	}
)

setMethod("extent2polygon",
	signature(object = "SpatRaster"),
	function (object, ...) {
		.extent2polygon(extent(object),
			p4s = proj4string(object))
	}
)

setMethod("extent2polygon",
	signature(object = "Background"),
	function (object, ...) {
		.extent2polygon(layers(object)$extent)
	}
)

if (!isGeneric("extent")) {
	setGeneric("extent", function (x, ...) standardGeneric("extent"))
}

setMethod("extent",
	signature(x = "Background"),
	function (x) {
		layers(x)$extent
	}
)
#	get bordering frame as SpatialPolygons

extent2polygon <- 
function (extent, p4s = "+init=epsg:4326") {
		stopifnot(inherits(extent, "Extent"))
	
		r <- as(extent, "SpatialPolygons") 
		proj4string(r) <- CRS(p4s)
		
		return(r)
}
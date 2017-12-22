#object <- x

.outer <- 
function (object) {
	e0 <- extent(object)
	e1 <- pretty(e0, resolution = "GRID", add = -1)
}
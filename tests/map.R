library(sabotag)

#	set extent! somewhere in Salzburg
e0 <- extent(12.5,14,47,48)
e <- pretty(e0, resolution = "GRID")
be <- pretty(e, resolution = "GRID", add = 1, mar = c(1,2,3,4))
#	set background for extent
b <- background(be, reliefmap = TRUE, tol = 1)

#	two species dummy data in extent
#	by sampling gird cells
g <- floragrid(e)
x1 <- data.frame(taxon = "Genus species",
	gridcell = sample(g$GRIDCELL, 10))
x2 <- data.frame(taxon = "Genus species spp. subspecies",
	gridcell = sample(g$GRIDCELL, 10))
x <- rbind(x1, x2)
#	make object Spatial*
coordinates(x) <- gridcell2lnglat(x$gridcell)

o <- occurrences(x)
o <- occurrences(as.data.frame(x))

#	draw plot
if (TRUE) {
plot(b)
points(o[o$taxon == "Genus species", ], pch = 16, cex = 1.5)
plot(extent2polygon(e), add = TRUE)
plot(extent2polygon(b), add = TRUE, lwd = 3)
plot(margin(b), add = T, col = "white")

ticks(pretty(extent(b), add = -1), "CELL", col = "white")
ticks(pretty(extent(b), add = -1), coarse = TRUE)

labelmargin(b)

}

if (FALSE) {
plot(b$gridlines, col = 2)
plot(extent2polygon(e), add = TRUE)
plot(extent2polygon(b$extent), add = TRUE, border = 3)
}
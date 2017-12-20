library(sabotag)

#	set extent! somewhere in Salz	burg
e <- pretty(extent(12,13,47,48), resolution = "GRID")

#	set background for extent
b <- background(pretty(e, resolution = "GRID", add = 1))

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
points(o[o$taxon == "Genus species", ])
plot(extent2polygon(e), add = TRUE)
plot(extent2polygon(b$extent), add = TRUE, lwd = 3)
}

if (FALSE) {
plot(b$gridlines, col = 2)
plot(extent2polygon(e), add = TRUE)
plot(extent2polygon(b$extent), add = TRUE, border = 3)
}


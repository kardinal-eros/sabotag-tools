library(sabotag)

#	test if gridcell2lnglat and lnglat2gridcell return the same values
r1 <- gridcell2lnglat("8144-3")

r2 <- lnglat2gridcell(r1[1], r1[2])

g <- floragrid(extent(12,14,47,48), resolution = "CELL")

#	precision with 12 digits
sum(round(c(coordinates(g[ g$GRIDCELL == "8144-3", ])) - r1, 12)) == 0
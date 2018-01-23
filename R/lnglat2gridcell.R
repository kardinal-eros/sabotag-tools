lnglat2gridcell <-
function (x, y) {
	#	FORTRAN alogrithm from http://www.oeaw.ac.at/isr/raumalp/raumalp/rasterraum.html

	#	input:  longitude [XCOORD], latitude [YCOORD]
	#	output: gridcell [RASTERF] as HHRRQ (Long Integer)

	#  RASTERF = Int(10 * (56 - [ YCOORD ])) * 1000 + Int(6 * ([ XCOORD ] - 6) + 2 ) * 10
	#	+ IIf(((([ XCOORD ] - Int([ XCOORD ])) * 60) Mod 10) <=5,0,1)
	#	+ IIf(((([ YCOORD ] - Int([ YCOORD ])) * 60) Mod 6)  =0,1,
	#	  IIf(((([ YCOORD ] - Int([ YCOORD ])) * 60) Mod 6)  <=3,3,1))
	
	stopifnot(is.numeric(x)); stopifnot(is.numeric(y))	
	
	#	add jitter
	x <- x + 0.000001
	y <- y + 0.000001
	
	#	grid cell where cell is zero (length 5)
	GRID  <- ( (floor(10 * (56 - y) ) * 1000) ) + ( floor(6 * (x - 6) + 2) * 10 )
	#	find cell
	test1 <- ( (x - floor(x) ) * 60 ) %% 10
	test2 <- ( (y - floor(y) ) * 60 ) %% 6

	CELL <- 0
	if (test1 <= 5) CELL <- 0 else CELL <- 1
		if (test2 == 0) CELL <- CELL + 1
			if (test2 <= 3) CELL <- CELL + 3 else CELL <- CELL + 1
	
	r <- c(
		GRIDCELL = paste(sprintf("%04d", GRID / 10), CELL, sep = "-"),
		GRID = sprintf("%04d", GRID / 10),
		CELL = CELL
		)		

		return(r)
	}

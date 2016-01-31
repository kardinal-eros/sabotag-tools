lnglat2gridcell <-
function (x, y) {
	#	Niklfeld, H. (1978): Grundfeldschlüssel für die Kartierung der Flora Mitteleuropas, (Zentralstelle für Florenkartierung, Inst. Bot. Univ. Wien). Wien.
	#	alogrithm from http://www.oeaw.ac.at/isr/raumalp/raumalp/rasterraum.html

	#	input:  longitude [XCOORD], latitude [YCOORD]
	#	output: gridcell [RASTERF] as HHRRQ (Long Integer)

	#  RASTERF = Int(10 * (56 - [ YCOORD ])) * 1000 + Int(6 * ([ XCOORD ] - 6) + 2 ) * 10
	#	+ IIf(((([ XCOORD ] - Int([ XCOORD ])) * 60) Mod 10) <=5,0,1)
	#	+ IIf(((([ YCOORD ] - Int([ YCOORD ])) * 60) Mod 6)  =0,1,
	#	  IIf(((([ YCOORD ] - Int([ YCOORD ])) * 60) Mod 6)  <=3,3,1))
	
	stopifnot(is.numeric(x)); stopifnot(is.numeric(y))	

	grid  <- ( (floor(10 * (56 - y)) * 1000)) + (floor(6 * (x - 6) + 2) * 10 )
	test1 <- ( (x - floor(x)) * 60 ) %% 10
	test2 <- ( (y - floor(y)) * 60 ) %% 6

	cell <- 0	
	if (test1 <= 5) cell <- 0 else cell <- 1
		if (test2 == 0) cell <- cell + 1
			if (test2 <= 3) cell <- cell + 3 else cell <- cell + 1
	
	r <- c(
		GRIDCELL = paste(sprintf("%04d", grid / 10), cell, sep = "-"),
		GRID = sprintf("%04d", grid / 10),
		CELL = cell
		)		

		return(r)
	}

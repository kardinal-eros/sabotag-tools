if (!isGeneric("pdf")) {
	setGeneric("pdf", function (object, ...) standardGeneric("pdf"))
}

setMethod("pdf",
	signature(object = "Background"),
	function (object, file, width, height, dingbats = FALSE, ...) {
	requireNamespace("grDevices")

	a <- .extent.ratio(object@layers$extent)
	if (missing(width) || missing(height)) {
		height <- width <- 7 # the defaults of grDevices::pdf
	}
	if (which.max(a[ 1:2 ]) == 1) {
		#	message("wider than high")
		height <- height / a[ 4 ]
	} else {
		#	message("higher than wide")
		width <- width / a[ 4 ]
	}	

	#	do plot
	grDevices::pdf(file = "background.pdf", width = width, height = height)
	plot(object)
	dev.off()	
	}	
)

setMethod("pdf",
	signature(object = "Occurrences"),
	function (object, background, file, width, height, dingbats = FALSE, ...) {
	requireNamespace("grDevices")

	a <- .extent.ratio(extent(background@layers$extent))
	if (missing(width) || missing(height)) {
		height <- width <- 7 # the defaults of grDevices::pdf
	}
	if (which.max(a[ 1:2 ]) == 1) {
		#	message("wider than high")
		height <- height / a[ 4 ]
	} else {
		#	message("higher than wide")
		width <- width / a[ 4 ]
	}	

	#	do plot
	grDevices::pdf(file = "occurences.pdf", width = width, height = height)
	
	plot(background, plain = TRUE)
	plot(extent2polygon(slot(background, "layers")$extent), add = TRUE)
	points(object)
	dev.off()	
	}	
)


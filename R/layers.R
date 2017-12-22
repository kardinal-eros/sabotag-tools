if (!isGeneric("layers")) {
	setGeneric("layers", function (object, ...) standardGeneric("layers"))
}

setMethod("layers",
	signature(object = "Background"),
	function (object, ...) {
		slot(object, "layers")
	}
)

#' @import assertthat
gigvis <- function(data = NULL, mapping = NULL, ...) {
  structure(
    node(data = data, mapping = mapping, fill_defaults = TRUE, ...),
    class = c("gigvis", "gigvis_node")
  )
}

node <- function(..., data = NULL, mapping = NULL, transform = NULL,
                 scales = NULL, split = NULL, fill_defaults = FALSE) {
  # data is a string
  # mapping is a named character vector, permissible names are properties
  #   that vega understands
  # transform is a transform object
  # scales is a list of scale objects
  # split is a spitter object

  # assert_that(is.character(mapping), !is.null(names(mapping)))

  if (fill_defaults) {

    if (is.null(scales))  scales <- list()

    # For each mapping, add a scale if necessary
    for (name in names(mapping)) {
      if (is.null(scales[[name]])) {
        scales[[name]] <- scale(name)
      }
    }
  }

  children <- list(...)

  structure(
    list(
      data = data,
      mapping = mapping,
      transform = transform,
      scales = scales,
      split = split,
      children = children
    ),
    class = "gigvis_node"
  )
}

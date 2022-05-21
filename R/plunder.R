
#' Plunder Points From A Plot
#'
#' Extract interactively the x and y coordinates from a plot provided as a PNG.
#'
#' @param path Character. The local path to a plot..
#' @param labels Logical. Get prompted to add labels to each point you extract?
#'
#' @return A data.frame with two columns (x and y) and a row for each point the
#'     user clicked. Three columns (x, y, labels) if labels is TRUE.
#' @export
#'
#' @examples \dontrun{plunder("example.png")}
plunder <- function(path, labels) {

  img <- .read_img(path)
  .plot_img(img)
  .select_points(labels)

}

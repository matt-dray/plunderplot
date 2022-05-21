
# Read A PNG Image From Local
.read_img <- function(path) {

    if (!file.exists(path)) {
      stop("File doesn't exist. Check the path.")
    }

  png::readPNG(path)

}

# Plot An Image As Raster
.plot_img <- function(img) {

  opar <- graphics::par(mar = rep(0, 4))
  on.exit(graphics::par(opar))

  graphics::plot.new()
  grid::grid.raster(img, x = 0.5, y = 0.5)

}

# Prompt To Locate The Axes
.ask_axis_location <- function(
    axis = c("x", "y"),
    min_or_max = c("min", "max")
) {

  message("Click ", axis, " axis ", min_or_max)
  graphics::locator(n = 1)

}

# Prompt To Provide The Axes Limits
.ask_for_value <- function(axis = c("x", "y"), min_or_max = c("min", "max")) {

  ask <- TRUE

  while (ask) {

    value <- readline(
      paste0(
        "Type value at ", axis , " axis ", min_or_max, ": "
      )
    )

    value <- suppressWarnings(as.numeric(value))

    if (is.na(value)) {
      message("Must be a number. Please try again.")
      ask <- TRUE
    } else {
      ask <- FALSE
    }

  }

  return(value)

}

# Prompt To Select Axes Limits And Data Points
.select_points <- function(labels = FALSE) {

  x_coord_min <- .ask_axis_location("x", "min")
  x_coord_max <- .ask_axis_location("x", "max")
  y_coord_min <- .ask_axis_location("y", "min")
  y_coord_max <- .ask_axis_location("y", "max")

  x_value_min <- .ask_for_value("x", "min")
  x_value_max <- .ask_for_value("x", "max")
  y_value_min <- .ask_for_value("y", "min")
  y_value_max <- .ask_for_value("y", "max")

  x_coord_diff <- x_coord_max$x - x_coord_min$x
  x_diff_val   <- x_value_max - x_value_min
  x_multiplier <- x_diff_val / x_coord_diff

  y_coord_diff <- y_coord_max$y - y_coord_min$y
  y_diff_val   <- y_value_max - y_value_min
  y_multiplier <- y_diff_val / y_coord_diff

  message("Click points on the chart, press ESC when finished")
  p_coords <- graphics::locator()

  if (is.null(p_coords)) {
    stop("You didn't select any points. Please start again.")
  }

  if (labels) {

    p_labels <- vector(mode = "character", length = length(p_coords$x))

    for (p_num in seq(length(p_coords$x))) {
      p_label <- readline(paste0("Type a label for point ", p_num, ": "))
      p_labels[p_num] <- p_label
    }

  }

  p_values_x <- lapply(
    p_coords$x,
    function(x) ((x - x_coord_min$x) * x_multiplier) + x_value_min
  )

  p_values_y <- lapply(
    p_coords$y,
    function(y) ((y - y_coord_min$y) * y_multiplier) + y_value_min
  )

  p_df <- data.frame(x = unlist(p_values_x), y = unlist(p_values_y))

  if (labels) {
    p_df <- cbind(p_df, data.frame(labels = p_labels))
  }

  message("Done")

  return(p_df)

}

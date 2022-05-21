
# plunderplot

<!-- badges: start -->
<!-- badges: end -->

You have a local PNG image of a chart. The underlying data isn't available. The `plunder()` function loads the image and prompts you to click on and enter the values for the axes limits, then to click the points you want to extract coordinates from. You're returned the x and y values for each point, which you can label optionally.

Install from GitHub:

``` r
install.packages("remotes")  # if not already installed
remotes::install_github("matt-dray/plunderplot")
```

This is just for fun. For stable functionality, try [the {digitize} package from CRAN](https://cran.r-project.org/package=digitize) instead.

## Exarrrmple

Avast! Do ye 'ave a treasure map but 'avin trouble getting the coordinates of that there treasure?

Why not `plunder()` the coordinates, matey?

``` r
library(plunderplot)
treasure <- plunder("image.png")
```

<div class="figure">
<img src="man/figures/plot.png" alt="Chart titled 'Treasure locations on Rectangle Island'. It's a plot with x limits of 0 to 100 and y limits of 0 to 50. There are concentric rectangles that look like an island in the sea. There are three red crosses on the island." width="75%"/>
</div>

```
Click x axis min
Click x axis max
Click y axis min
Click y axis max
Type value at x axis min: 0
Type value at x axis max: 100
Type value at y axis min: 0
Type value at y axis max: 50
Select points on the chart, press ESC when finished
Add a label for point 1: west
Add a label for point 2: centre
Add a label for point 3: east
Done
```

Arrr, get that booty, lad!

``` r
treasure
```
```
         x        y labels
1 35.97651 32.19178   west
2 55.94714 23.15068 centre
3 61.96769 26.16438   east
```

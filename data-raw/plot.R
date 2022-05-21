png(
  filename = "./man/figures/plot.png",
  width = 960,
  height = 640
)

par(cex = 1.5)

plot(
  x = NULL, y = NULL,
  xlim = c(0, 100),
  ylim = c(0, 50),
  main = "Treasure locations on Rectangle Island",
  xlab = "East to West (arbitrary units)",
  ylab = "North to South (arbitrary units)",
  xaxs = "i",
  yaxs = "i",
  las = 1
)

rect(0, 0, 100, 50, col = "steelblue1", border = NA, density = 60)
rect(10, 10, 90, 40, col = "khaki1", border = NA)
rect(15, 15, 85, 35, col = "springgreen1", border = NA)

set.seed(500)

points(
  x = sample(10:90, 3),
  y = sample(15:35, 3),
  pch = 4,
  cex = 2,
  col = "red",
  lwd = 5
)

dev.off()

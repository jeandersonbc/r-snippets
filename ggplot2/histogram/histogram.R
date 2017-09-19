library("ggplot2")
library("grDevices")

data <- read.csv("sample.csv")

# Consider using cairo_pdf instead of pdf because it automatically
# handles embedded fonts
cairo_pdf("histogram.pdf", height = 3)

ggplot(data, aes(value)) +
  geom_histogram(
    # breaks is useful to aggregate values by intervals
    breaks = seq(0, max(data$value), by = 5),
    color = "black",
    fill = "white")

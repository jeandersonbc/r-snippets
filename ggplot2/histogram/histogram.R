library("ggplot2")
library("grDevices")

data <- read.csv("sample.csv")

# This is a good way to break a range of values into intervals
data$intervals <- cut(data$value, breaks = seq(0, max(data$value), by = 5))

# Consider using cairo_pdf instead of pdf because it automatically
# handles embedded fonts
cairo_pdf("histogram.pdf", height = 1.7, width = 5)

ggplot(data, aes(intervals)) +
  # Because we are dealing with quantitative values (intervals), we use count
  # ...What's the difference of geom_bar and geom_histogram? ;)
  geom_bar(stat = "count", fill = "white", colour = "black", width = 1) +
  labs(x = "Value Interval", y = "Frequency") +

  # IMHO, it's better to put the values stacked in the plot
  # instead of refering to the y-axis
  geom_text(
    size = 2.8,
    stat = "count",
    aes(label = ..count..),
    position = position_stack(vjust = 0.5)) +
  theme_bw() +
  theme(
    axis.text = element_text(size = 6, hjust = 1, angle = 90),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.line.x = element_line(colour = "black")
  )

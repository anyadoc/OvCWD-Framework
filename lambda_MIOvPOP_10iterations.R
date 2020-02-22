library(ggplot2)
library (tibble)
library (tidyverse)
windowsFonts("Arial" = windowsFont("Arial"))
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/saMontcalmCountyMI_10ite1Feb20.csv"
data <- read_csv(data_github)
#data <- read.csv("data/saMontcalmCountyMI_10ite1Feb20.csv", header = TRUE)
data_0 <- add_column(data, Year = rep(c(1:25), params$iterations))  # number of years per iteration 26, model iterations 1 #tibble
data_1 <- add_column(data_0, Iteration = rep(c(1:params$iterations), each = 25))
p1 <- ggplot(data_1, aes(x = Year, y = lambda, col = factor(Iteration))) + geom_smooth() + scale_y_continuous(breaks=seq(0.80, 1.2, 0.1), limits=c(0.80, 1.2))
p2 <- p1 + scale_x_continuous(limits = c(2,26), breaks = c(5,15,25)) + theme_bw() + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+ theme(axis.text.x = element_text(size=14),axis.title.x = element_text(size= 16)) + theme(axis.text.y = element_text(size = 14),axis.title.y = element_text(size= 16))
p3 <- p2 + geom_vline(xintercept = 15, color="black", linetype = 3, size = .1)
p4 <- p3 + theme(plot.title = element_text(size=12,face="bold")) + theme(text=element_text(family="Arial", face="bold", size=12)) + theme(legend.position = "none")
p4

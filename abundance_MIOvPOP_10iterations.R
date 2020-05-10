library (tidyr)
library (tidyverse)
library (dplyr)
library (cowplot)
library (tibble)
library (ggplot2)
library (kableExtra)

data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/saMontcalmCountyMI_10ite1Feb20.csv"
model_data <- read_csv(data_github)
#model_data <- read.csv("data/saMontcalmCountyMI_10ite1Feb20.csv", header = TRUE)
as_tibble(model_data)
new_data <- add_column(model_data, year = rep(c(1:25), 10))  # number of years per iteration 26, model iterations 10 #tibble
new_data1 <- add_column(new_data, iteration = rep(c(1:10), each = 25))
new_data2 <- subset(new_data1, year == 25)
MIDNR_est <- rnorm(10,51800,2500)   #deer abundance data generated based on MIDNR's estimate post-harvest estimate for Montcalm County (51800 +- 5%SD#2590)
MIOvPOP <- new_data2$`pre-harvest_total`#model population data; pre.harvest_total for local file
iteration <- c(1:10)
mydata3 <- cbind(MIDNR_est,MIOvPOP,iteration)
mydata_df <- as.data.frame(mydata3)
mydata3_long <- gather(mydata_df, data_source, deer_abundance, MIDNR_est:MIOvPOP, factor_key=TRUE)
comp_N_MontcalmMI <- ggplot(mydata3_long, aes(x=iteration, y=deer_abundance, color=data_source)) + scale_y_continuous(limits=c(30000, 65000))+ geom_point(size=2, alpha=0.5, position = "jitter") + stat_ellipse(geom = "polygon", alpha = 0.1, type = "norm", aes(fill = data_source)) + scale_x_continuous(breaks=c(10)) + xlab("iterations") + ylab("deer abundance\n") + theme(text=element_text(family="Arial", face="bold", size=12)) + theme_cowplot(12)
comp_N_MontcalmMI

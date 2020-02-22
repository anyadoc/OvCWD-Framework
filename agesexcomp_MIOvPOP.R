library (dplyr)
library (ggplot2)
library (tidyverse)
library (tidyr)
library (tibble)
library (data.table)
#library (kableExtra)
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/deerpopdyMontcalmCountyMI_10ite1Feb20.csv"
data <- read_csv(data_github)
#data <- read.csv("data/deerpopdyMontcalmCountyMI_10ite1Feb20.csv", header = TRUE)
data = data[-1,]                  # deletes the very 1st row, which is the user provided information for setup
new_data <- add_column(data, iteration = rep(1:params$iterations, each = 25))  # number of model iterations 10, number of years per iteration - 26 #tibble
new_data1 <- add_column(new_data, year = rep(c(1:25), params$iterations))     # 26 years per iteration
#AgeSexComposition using one iteration
agesexdata_1 <- subset(new_data1, iteration == 1)              # choose which iteration
agesexdata_1$mfp <- agesexdata_1$posth_mf / agesexdata_1$posth_total
agesexdata_1$ffp <- agesexdata_1$posth_ff / agesexdata_1$posth_total
agesexdata_1$myp <- agesexdata_1$posth_my / agesexdata_1$posth_total
agesexdata_1$fyp <- agesexdata_1$posth_fy / agesexdata_1$posth_total
agesexdata_1$map <- agesexdata_1$posth_ma / agesexdata_1$posth_total
agesexdata_1$fap <- agesexdata_1$posth_fa / agesexdata_1$posth_total
agesex_data <- subset(agesexdata_1, select = year: fap)
data_long <- gather(agesex_data, age_sex, prop, mfp:fap, factor_key=TRUE)
data_long <- data_long[order(data_long$year, data_long$age_sex), ]
p1 <- ggplot(data=data_long,aes(x = year, y = prop, fill = age_sex))
p2 <- p1 + geom_area(color="black", size=.2, alpha=.8) + theme(legend.title=element_blank())
p3 <- p2 + scale_fill_discrete(name = "Age-sex class",labels = c(" Fawn males"," Fawn females"," Yearling males"," Yearling females"," Adult males"," Adult females"))
p4 <- p3 + ylab("Proportion\n")  + xlab("Year") + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) + theme(axis.title.y = element_text(size = 12),axis.text.y = element_text(size = 12))+ theme(axis.title.x = element_text(size = 12),axis.text.x = element_text(size = 12))
p4
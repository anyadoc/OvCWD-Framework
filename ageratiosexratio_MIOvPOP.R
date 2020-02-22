library (tidyr,tidyverse)
library (dplyr)
library (tibble)
library (kableExtra)
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/saMontcalmCountyMI_10ite1Feb20.csv"
model_data <- read_csv(data_github)
new_data <- add_column(model_data, year = rep(c(1:25), params$iterations))  # number of years per iteration 26, model iterations 10 #tibble
new_data1 <- add_column(new_data, iteration = rep(c(1:params$iterations), each = 25))
new_data2 <- subset(new_data1, year == 25)
asc_modelasc <- data.table(x = c("Fawn proportion","Yearling proportion","Adult proportion","Female: male ratio"),y = c(0.32,0.25,0.43,1.48), z = c(round (mean(new_data2[["fawn_prop"]]), digits=2), round (mean(new_data2[["yearling_prop"]]), digits=2), round(mean(new_data2[["adult_prop"]]), digits=2), round(mean(new_data2[["f:m_ratio"]]), digits=2))) 
colnames(asc_modelasc) <- c("Population\n parameters","MIDNR estimates","MIOvPOP ")
kable(asc_modelasc) %>%
  kable_styling(full_width = F) %>%
  column_spec(2, background = "yellow") %>%
  column_spec(3, background = "orange")

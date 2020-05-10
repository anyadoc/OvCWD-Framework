library(tidyverse)
library (dplyr)
library(patchwork)
#-------------------------
#Set parameters
#-------------------------
Pref_tp <- 0.0128
Palt_tp <- 0.01344
Pref_pip <- 6
Palt_pip <- 7
Pref_pcp <- 21
Palt_pcp <- 22
#--------------------------------------------
#Analyze baseline scenario model outputs
#--------------------------------------------
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/cwdinfdyMontcalmCountyMI_seedinf_1dispmy_100ite_sabl.csv"
data <- read_csv(data_github)
as_tibble(data)
new_data <- add_column(data, iteration = rep(1:100, each = 10))  #number of model iterations 100, number of years per iteration 10 #tibble
new_data1 <- new_data %>% select(iteration, everything()) #dplyr
new_data1$outbp <- ifelse(new_data1$TotalCWD == 0, 0, 1)
out1 <- new_data1[new_data1$Year == 10, ] # select rows for year = 10
OutbreakSize1 <- out1$TotalCWD   # 
OutbreakPers <- out1$outbp      # outbreak probability in year 10
new_data2 <- add_column(new_data1, outbpers = rep(OutbreakPers, each = 10))

#mean number of transmissions by year 5
new_data5 <- subset(new_data2, Year == 5)
Yref_ct <- mean(new_data5[["cum-trans"]])
varref_ct <- var(new_data5[["cum-trans"]])
#max dist spark year 5
Yref_mds <- mean(new_data5[["MaxDistSpark"]])
varref_mds <- var(new_data5[["MaxDistSpark"]])
#outbreak size 5
Yref_os <- mean(new_data5[["TotalCWD"]])
varref_os <- var(new_data5[["TotalCWD"]])
#---------------------------------------------------------------------------
#Analyze scenario 2 (5% increase in transmission probability) model outputs
#---------------------------------------------------------------------------
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/cwdinfdyMontcalmCountyMI_seedinf_1dispmy_100ite_sa2.csv"
data <- read_csv(data_github)
as_tibble(data)
new_data <- add_column(data, iteration = rep(1:100, each = 10))  #number of model iterations 100, number of years per iteration 10 #tibble
new_data1 <- new_data %>% select(iteration, everything()) #dplyr
new_data1$outbp <- ifelse(new_data1$TotalCWD == 0, 0, 1)
out1 <- new_data1[new_data1$Year == 10, ] #select rows for year = 10
OutbreakSize1 <- out1$TotalCWD 
OutbreakPers <- out1$outbp      #outbreak probability in year 10
new_data2 <- add_column(new_data1, outbpers = rep(OutbreakPers, each = 10))

#mean number of transmissions by year 5
new_data_sa2_5 <- subset(new_data2, Year == 5)
Yalt_tp_ct <- mean(new_data_sa2_5[["cum-trans"]])
varalt_tp_ct <- var(new_data_sa2_5[["cum-trans"]])
#max dist spark year 5
Yalt_tp_mds <- mean(new_data_sa2_5[["MaxDistSpark"]])
varalt_tp_mds <- var(new_data_sa2_5[["MaxDistSpark"]])
#outbreak size 5
Yalt_tp_os <- mean(new_data_sa2_5[["TotalCWD"]])
varalt_tp_os <- var(new_data_sa2_5[["TotalCWD"]])
#---------------------------------------------------------------------------
#Analyze scenario 4 (17% increase in pre-infectious period) model outputs
#---------------------------------------------------------------------------
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/cwdinfdyMontcalmCountyMI_seedinf_1dispmy_100ite_sa4.csv"
data <- read_csv(data_github)
as_tibble(data)
new_data <- add_column(data, iteration = rep(1:100, each = 10))  #number of model iterations 100, number of years per iteration 10 #tibble
new_data1 <- new_data %>% select(iteration, everything())#dplyr
new_data1$outbp <- ifelse(new_data1$TotalCWD == 0, 0, 1)
out1 <- new_data1[new_data1$Year == 10, ] #select rows for year = 10
OutbreakSize1 <- out1$TotalCWD   
OutbreakPers <- out1$outbp      #outbreak probability in year 10
new_data2 <- add_column(new_data1, outbpers = rep(OutbreakPers, each = 10))

#mean number of transmissions by year 5
new_data_sa4_5 <- subset(new_data2, Year == 5)
Yalt_pip_ct <- mean(new_data_sa4_5[["cum-trans"]])
varalt_pip_ct <- var(new_data_sa4_5[["cum-trans"]])
#max dist spark year 5
Yalt_pip_mds <- mean(new_data_sa4_5[["MaxDistSpark"]])
varalt_pip_mds <- var(new_data_sa4_5[["MaxDistSpark"]])
#outbreak size 5
Yalt_pip_os <- mean(new_data_sa4_5[["TotalCWD"]])
varalt_pip_os <- var(new_data_sa4_5[["TotalCWD"]])
#---------------------------------------------------------------------------
#Analyze scenario 6 (5% increase in pre-infectious period) model outputs
#---------------------------------------------------------------------------
data_github <- "https://raw.githubusercontent.com/anyadoc/OvCWD-Framework/master/cwdinfdyMontcalmCountyMI_seedinf_1dispmy_100ite_sa6.csv"
data <- read_csv(data_github)
as_tibble(data)
new_data <- add_column(data, iteration = rep(1:100, each = 10))  #number of model iterations 100, number of years per iteration 10 #tibble
new_data1 <- new_data %>% select(iteration, everything())#dplyr
new_data1$outbp <- ifelse(new_data1$TotalCWD == 0, 0, 1)
out1 <- new_data1[new_data1$Year == 10, ] # select rows for year = 10
OutbreakSize1 <- out1$TotalCWD 
OutbreakPers <- out1$outbp      #outbreak probability in year 10
new_data2 <- add_column(new_data1, outbpers = rep(OutbreakPers, each = 10))

#mean number of transmissions by year 5
new_data_sa6_5 <- subset(new_data2, Year == 5)
Yalt_pcp_ct <- mean(new_data_sa6_5[["cum-trans"]])
varalt_pcp_ct <- var(new_data_sa6_5[["cum-trans"]])
#max dist spark year 5
Yalt_pcp_mds <- mean(new_data_sa6_5[["MaxDistSpark"]])
varalt_pcp_mds <- var(new_data_sa6_5[["MaxDistSpark"]])
#outbreak size 5
Yalt_pcp_os <- mean(new_data_sa6_5[["TotalCWD"]])
varalt_pcp_os <- var(new_data_sa6_5[["TotalCWD"]])
#-------------------------------------------------------------------------------
#St = ((|Yalt - Y ref|) / (Palt - Pref) * ((varalt + varref) / 100)^1/2)) * Pref
#-------------------------------------------------------------------------------
#St transmission probability - deer-to-deer-transmission
Pref = Pref_tp
Palt = Palt_tp
Yref = Yref_ct
varref = varref_ct
Yalt = Yalt_tp_ct
varalt = varalt_tp_ct
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_tpct <- St
#-------------------------------------------------------------------------------
#St pre-infectious period - deer-to-deer-transmission
Pref = Pref_pip
Palt = Palt_pip
Yref = Yref_ct
varref = varref_ct
Yalt = Yalt_pip_ct
varalt = varalt_pip_ct
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pipct <- St
#-------------------------------------------------------------------------------
#St pre-clinical period - deer-to-deer-transmission
Pref = Pref_pcp
Palt = Palt_pcp
Yref = Yref_ct
varref = varref_ct
Yalt = Yalt_pcp_ct
varalt = varalt_pcp_ct
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pcpct <- St
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#St transmission probability - spatial spread
Pref = Pref_tp
Palt = Palt_tp
Yref = Yref_mds
varref = varref_mds
Yalt = Yalt_tp_mds
varalt = varalt_tp_mds
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_tpss <- St
#-------------------------------------------------------------------------------
#St pre-infectious period - spatial spread
Pref = Pref_pip
Palt = Palt_pip
Yref = Yref_mds
varref = varref_mds
Yalt = Yalt_pip_mds
varalt = varalt_pip_mds
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pipss <- St
#-------------------------------------------------------------------------------
#St pre-clinical period - spatial spread
Pref = Pref_pcp
Palt = Palt_pcp
Yref = Yref_mds
varref = varref_mds
Yalt = Yalt_pcp_mds
varalt = varalt_pcp_mds
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pcpss <- St
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#St transmission probability - outbreak size
Pref = Pref_tp
Palt = Palt_tp
Yref = Yref_os
varref = varref_os
Yalt = Yalt_tp_os
varalt = varalt_tp_os
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_tpos <- St
#-------------------------------------------------------------------------------
#St pre-infectious period - outbreak size
Pref = Pref_pip
Palt = Palt_pip
Yref = Yref_os
varref = varref_os
Yalt = Yalt_pip_os
varalt = varalt_pip_os
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pipos <- St
#-------------------------------------------------------------------------------
#St pre-clinical period - outbreak size
Pref = Pref_pcp
Palt = Palt_pcp
Yref = Yref_os
varref = varref_os
Yalt = Yalt_pcp_os
varalt = varalt_pcp_os
Numerator = abs(Yalt - Yref)
Denom1 = Palt - Pref
Denom2 = sqrt ((varalt + varref) / 100)
Denom = Denom1 * Denom2
St = (Numerator / Denom) * Pref
St_pcpos <- St
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
St_table <- data.frame(output_parameter=c(rep("deer-to-deer transmission", 3), rep("spatial spread", 3), rep("outbreak size", 3)), parameter=c(rep(c("transmission probability","pre-infectious period","pre-clinical period"),3)),St=c(St_tpct, St_pipct, St_pcpct, St_tpss, St_pipss, St_pcpss, St_tpos, St_pipos, St_pcpos))
print(St_table)
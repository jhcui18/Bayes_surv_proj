library(survival)

ovarian
lung <- lung

install.packages("SurvSet")
library(SurvSet)
heart <- heart

install.packages("joineR")
library(joineR)
dt <- heart.valve
length(unique(dt$num))
?heart.valve

library(haven)

path = file.path("/Users/jinghancui/Downloads/Data - Survival.sav")
dataset = read_sav(path)

path = file.path("dataverse_files/MFPS_PNAS_MAIN_ITT_DATA.dta")
dataset <- read_dta(path)

path = file.path("dataverse_files/MFPS_PNAS_SURVIVAL_DATA.dta")
dataset2 <- read_dta(path)


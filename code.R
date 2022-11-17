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

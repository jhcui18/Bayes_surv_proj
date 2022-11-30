###MALAWI FAMILY PLANNING STUDY
###R-SCRIPT 5: SURVIVAL PLOT FILE

###MAHESH KARRA
###MAY 10, 2022

###STEP 0: SETTING WORKING DIRECTORY
###To use the correct file directory, replace "C:/Users/mvkarra/Documents/Harvard 2015-2016/POP CENTER/MALAWI FP INTERVENTION/Publications/YEAR 1 ITT ON CONTRACEPTIVE USE/SUBMISSIONS/PNAS/HARVARD DATAVERSE SUBMISSION" with the appropriate file path under which your data is stored.
###Make sure that the Results subfolder is created to store the results from this analysis.
###SET WORKING DIRECTORY
setwd("C:/Users/mvkarra/Documents/Harvard 2015-2016/POP CENTER/MALAWI FP INTERVENTION/Publications/YEAR 1 ITT ON CONTRACEPTIVE USE/SUBMISSIONS/PNAS/HARVARD DATAVERSE SUBMISSION")

install.packages(c("ggplot2","haven","survminer","survival"))
library(ggplot2)
library(haven)
library("survminer")
require("survival")

MFPS_PNAS_SURVIVAL_DATA <- read_dta("dataverse_files/MFPS_PNAS_SURVIVAL_DATA.dta")
View(MFPS_PNAS_SURVIVAL_DATA)

fit <- survfit(Surv(month_next_preg,event_next_preg_24) ~ treatment, data = MFPS_PNAS_SURVIVAL_DATA)
ggsurvplot(fit, data = MFPS_PNAS_SURVIVAL_DATA, pval = TRUE)


###K-M PLOT
ggsurvplot(
  fit, 
  data = MFPS_PNAS_SURVIVAL_DATA, 
  censor=FALSE,
  conf.int = TRUE,
  risk.table = "nrisk_cumevents",
  risk.table.col = "strata",# Risk table color by groups
  risk.table.height = 0.3, # Useful to change when you have multiple groups
  break.time.by = 4,   
  ylim = c(0.85, 1),
  xlab = "Months since index birthdate",
  ylab = "Probability",
  legend.labs = 
    c("Control", "Treated"),
  pval = TRUE
)

###OUTPUT FIGURE INTO RESULTS
dev.print(pdf, 'Results/FIGURE2.pdf')

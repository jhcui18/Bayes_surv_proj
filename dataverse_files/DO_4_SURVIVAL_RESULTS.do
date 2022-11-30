***MALAWI FAMILY PLANNING STUDY
***DO FILE 4: SURVIVAL ANALYSIS FILE

***MAHESH KARRA
***MAY 10, 2022

***STEP 0: SETTING WORKING DIRECTORY
***To use the correct file directory, replace "C:\Users\mvkarra\Documents\Harvard 2015-2016\POP CENTER" with the appropriate file path under which your data is stored.
***Make sure that the Results subfolder is created to store the results from this analysis.

global maindir "C:\Users\mvkarra\Documents\Harvard 2015-2016\POP CENTER"
cd "$maindir\RESULTS"

set excelxlsxlargefile on

version 13

use "$maindir\MFPS_PNAS_SURVIVAL_DATA.dta", clear

*************************************************
**TABLE 3: MAIN SURVIVAL RESULTS
*************************************************

global covariates "i.area_bl i.age_group_bl sex_age_bl total_alive_bl ever_use_bl edu_primary_bl work_bl religion_r_bl ethnicity_r_bl preg_bl"

***TIME TO NEXT PREGNANCY
stset month_next_preg, failure(event_next_preg_24==1)

eststo m1: stcox treatment, robust
eststo m2: stcox treatment $covariates, robust  

esttab m1 m2 using "TABLE3.rtf", ///
replace ci scalar(N) eform nobaselevels

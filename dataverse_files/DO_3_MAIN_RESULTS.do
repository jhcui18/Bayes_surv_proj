***MALAWI FAMILY PLANNING STUDY
***DO FILE 3: MAIN ITT ANALYSIS FILE

***MAHESH KARRA
***MAY 10, 2022

***STEP 0: SETTING WORKING DIRECTORY
***To use the correct file directory, replace "C:\Users\mvkarra\Documents\Harvard 2015-2016\POP CENTER" with the appropriate file path under which your data is stored.
***Make sure that the Results subfolder is created to store the results from this analysis.

global maindir "C:\Users\mvkarra\Documents\Harvard 2015-2016\POP CENTER"
cd "$maindir\RESULTS"

set excelxlsxlargefile on

version 13

use "$maindir\MFPS_PNAS_MAIN_ITT_DATA.dta", clear

***SET PANEL VARIABLES
xtset caseid_n year

*************************************
***TABLE 2, TOP PANEL: MAIN ITT, FP
*************************************

reg curr_use_inj_adj treatment if year == 2018, robust
estimates store ca1
reg more_eff_method treatment if year == 2018, robust
estimates store me1
reg injectable_adj treatment if year == 2018, robust
estimates store ia1
reg implant treatment if year == 2018 , robust
estimates store im1

global covariates "i.area_bl i.age_group_bl sex_age_bl total_alive_bl ever_use_bl edu_primary_bl work_bl religion_r_bl ethnicity_r_bl"

reg curr_use_inj_adj curr_use_inj_adj_bl treatment $covariates if year == 2018, robust
estimates store ca2
reg more_eff_method treatment more_eff_method_bl $covariates if year == 2018, robust
estimates store me2
reg injectable_adj treatment injectable_adj_bl $covariates if year == 2018, robust
estimates store ia2
reg implant treatment implant_bl $covariates if year == 2018, robust
estimates store im2

esttab ca1 ca2 me1 me2 ia1 ia2 im1 im2 using "TABLE2_1.rtf", ///
replace ci level(90) coeflabels(treatment "Treatment") scalar(N r2 F)  ///
mlabels("Curr Use" "Curr Use" "Long-Acting Method" "Long-Acting Method" "Injectable" "Injectable" "Implant" "Implant") collabels(none)   ///
                  compress keep(treatment _cons curr_use_inj_adj_bl ///
				  implant_bl injectable_adj_bl more_eff_method_bl ///
				  1.age_group_bl 2.age_group_bl 3.age_group_bl edu_primary_bl total_alive_bl sex_age_bl ever_use_bl work_bl religion_r_bl ethnicity_r_bl ) ///
				  order(treatment) 	
	

*************************************
***TABLE 2, BOTTOM PANEL: MAIN ITT, PREGNANCY
*************************************

reg next_preg_2018 treatment if year == 2018 & termflag==0, robust
estimates store preg1

reg next_preg_2018 treatment exposure preg_bl $covariates if year == 2018 & termflag==0, robust
estimates store preg2

esttab preg1 preg2 using "TABLE2_2.rtf", ///
replace ci coeflabels(treatment "Treatment" )  ///
scalar(N r2 F) mlabels("Pregnancy" "Pregnancy") collabels(none) ///
                  compress keep(treatment _cons exposure preg_bl edu_primary_bl total_alive_bl sex_age_bl ever_use_bl 1.age_group_bl 2.age_group_bl 3.age_group_bl work_bl religion_r_bl ethnicity_r_bl) ///
				  order(treatment)

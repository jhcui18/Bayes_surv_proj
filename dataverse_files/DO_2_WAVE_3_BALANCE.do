***MALAWI FAMILY PLANNING STUDY
***DO FILE 2: DESCRIPTIVE BALANCE TABLE, WAVE 3

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

***SET PANEL
tsset caseid_n year
sort caseid_n year

***************************************
***TABLE 1, BOTTOM PANEL: BALANCE AT WAVE 3
***************************************

local yvar_final curr_use_inj_adj more_eff_method injectable_adj implant next_preg_2018 next_birth_2018 ///
 

***BALANCE TABLE
estpost ttest `yvar_final' if year==2018, by(treatment)
esttab using "TABLE1_PANEL2_BAL.rtf", replace ///
cells("mu_2(fmt(3) label(Mean)) mu_1(fmt(3) label(Mean)) b(star fmt(3)) se(fmt(4) label(SE)) p(label(p)) N_2(fmt(0) label(N)) N_1(fmt(0) label(N))") ///
starlevels( * 0.10 ** 0.05 *** 0.010)  ///
				 coeflabels(curr_use_inj_adj  "Currently using contraceptives"    ///
				 more_eff_method "Long Acting Cont." ///
				 injectable_adj  "Injectable"    ///
				 implant  "Implant"    ///
				 next_preg_2018 "Pregnant since BL" ///
				 next_birth_2018 "Birth since BL")

***OVERALL MEAN
estpost sum `yvar_final' if year==2018
esttab using "TABLE1_PANEL2_MEAN.rtf", replace ///
cells("mean(fmt(3))") ///
                 coeflabels(curr_use_inj_adj  "Currently using contraceptives"    ///
				 more_eff_method "Long Acting Cont." ///
				 injectable_adj  "Injectable"    ///
				 implant  "Implant"    ///
				 next_preg_2018 "Pregnant since BL" ///
				 next_birth_2018 "Birth since BL")

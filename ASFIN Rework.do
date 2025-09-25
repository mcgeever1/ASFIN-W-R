* DATA IMPORT AND RESHAPING: 2022 Annual Survey of State Government Finances

*** set working directory
 cd "C:\Users\mcgeever.e\Desktop\ASFIN Revisit"
 
 ** bring in census data (must be via range to ensure everything imports)
 import excel "2022 ASFIN State Totals.xlsx", cellrange(A1:AZ91) clear
 
 * drop source citation and metadata
 drop in 1/4
 
 * Extract relevant data
 * Generate row identifier for variable selection
gen row_num = _n
 rename A var_label
 list var_label row_num
 
 keep if row_num == 1 | row_num == 7 | row_num == 31 | row_num == 32 | row_num == 46 | row_num == 63 | row_num == 62 | row_num == 66 | row_num == 69 
 
 list var_label row_num in 1/9
 
 drop var_label row_num
 
 * Export to CSV and reimport with first row as variable names
export delimited using "temp.csv", replace novarnames
import delimited using "temp.csv", varnames(1) clear

* Replace X with missing values for all problematic states
foreach var of varlist alaska florida nevada southdakota texas washington wyoming {
    replace `var' = "" if `var' == "X"
    destring `var', replace
}

* Removes USA Total
drop unitedstates

* Check the data structure
describe
list in 1/5

* SECTION 5: Transpose to analysis format (fixing state names issue)
xpose, clear varname

* The state names are now in _varname
rename _varname State
 order State

* Rename the value variables
rename v1 TotalTaxes
rename v2 IndividualIncomeTaxes
rename v3 CorporationIncomeTaxes
rename v4 TotalExpenditure
rename v5 PublicWelfare
rename v6 Education
rename v7 Highways
rename v8 Correction

* Format all financial variables to display with commas, not scientific notation
format TotalTaxes IndividualIncomeTaxes CorporationIncomeTaxes TotalExpenditure PublicWelfare Education Highways Correction %15.0fc

* Check formatting
list State TotalTaxes PublicWelfare in 1/5


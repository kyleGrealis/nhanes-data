source('R/_libraries.R')
source('R/custom_table_functions.R')
source('R/custom_functions.R')

load('data/study_data.rda')


# https://stats.oarc.ucla.edu/r/seminars/survey-data-analysis-with-r/
# corresponding code: https://stats.oarc.ucla.edu/wp-content/uploads/2020/08/code_for_webpage.r
# Create a baic survey design object based on reference above.

nh <- svydesign(
  ids = ~sdmvpsu,           # Primary sampling units
  strata = ~sdmvstra,       # Strata
  weights = ~wtmec2yr,      # MEC exam weights (use this for physical measurements)
  nest = TRUE,
  data = the_data
)

# Obtain mean age from design obejct:
svymean(~ridageyr, nh, na.rm = TRUE)
#          mean   SE
# ridageyr 50.6 0.17

#----------- Contrast design versus raw -----------#

# See the counts applied properly vs raw data:
svytable(~use_category, nh)
# versus
tabyl(the_data, use_category)


# Create table of the mean age by sex
svyby(~ridageyr, ~riagendr, nh, svymean, na.rm = TRUE)
#        riagendr ridageyr     se
# Female   Female    50.95 0.1682
# Male       Male    50.23 0.2070

# Create the same table and include ever_use_marijuana (use x + y syntax)
svyby(~ridageyr, ~riagendr + ever_use_marijuana, nh, svymean, na.rm.all = TRUE)
#                riagendr ever_use_marijuana ridageyr     se
# Male.Yes           Male                Yes    44.94 0.2163
# Male.No            Male                 No    44.09 0.2185
# Male.Unknown       Male            Unknown    61.81 0.3033
# Female.Yes       Female                Yes    45.18 0.2310
# Female.No        Female                 No    45.14 0.2001
# Female.Unknown   Female            Unknown    60.80 0.2459

the_data |> 
  summarize(
    mean_age = mean(ridageyr, na.rm = TRUE),
    .by = c(riagendr, ever_use_marijuana)
  )
#   riagendr ever_use_marijuana mean_age --- reordered to make easy comparison above
#   <chr>    <chr>                 <dbl>
# 1 Male     Yes                    44.2
# 6 Male     No                     44.3
# 5 Male     Unknown                61.6
# 3 Female   Yes                    44.4
# 4 Female   No                     44.9
# 2 Female   Unknown                60.0


conflicted::conflicts_prefer(stats::chisq.test)

nh |> 
  tbl_svysummary(
    by = ever_use_marijuana,
    include = c(ridageyr:lncrp, crp_cat),
    type = all_continuous() ~ "continuous2",
    statistic = list(all_continuous() ~ c('{mean} ({sd})', '{median} ({p25}, {p75})')),
    missing = 'no'
  ) |> 
  add_auto_labels() |> 
  extras(pval = FALSE)

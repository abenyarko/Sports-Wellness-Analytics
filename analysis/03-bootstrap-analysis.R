######=================================================================#######

# 3. BOOTSTRAPPING USING THE SURVEY PACKAGE

#Set seed for reproducibility
set.seed(8784)

#Create a bootstrap replicate design 
boot_survey_design <- as.svrepdesign(final_survey_design, type = "bootstrap", replicates = 1000)

######=================================================================#######


# 4. STRATIFIED VARIANCE ESTIMATION WITH BOOTSTRAPPING

# Compute weighted means (with bootstrap-based standard errors) for selected variables by position
stratified_means <- svyby(~Overall_Stress_Num + Physical_Fatigue_Num + Soreness_Num +
                            Sleep_Quality_Num + `Wellbeing Score`,
                          ~Mlax_Position, boot_survey_design, svymean, ci = TRUE, na.rm = TRUE)
print(stratified_means)

ci_strat <- confint(stratified_means)

print(ci_strat)

ci_strat_df <- as.data.frame(ci_strat)
str(ci_strat_df)
print(ci_strat_df)

######=================================================================#######

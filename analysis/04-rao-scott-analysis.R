######=================================================================#######


#Chi-square test of all wellness indicators by Mlax_Position

final_survey_design$variables$Overall_Stress_ <- factor(final_survey_design$variables$`Overall Stress`,
                                                        levels = c("Very High", "High", "Average", "Low", "Very Low"),
                                                        labels = c("High", "High", "Average", "Low", "Very Low"))

with(final_survey_design$variables, table(Mlax_Position, Overall_Stress_))

chi_overall_stress <- svychisq(~Mlax_Position + Overall_Stress_, design = final_survey_design)
chi_physical_fatigue <- svychisq(~Mlax_Position + `Physical Fatigue`, design = final_survey_design)

with(final_survey_design$variables, table(Mlax_Position, Soreness))
final_survey_design$variables$Soreness_recode <- factor(final_survey_design$variables$Soreness,
                                                        levels = c("Painful to Move", "Very Sore", "Moderate", "Minimal", "No Soreness"),
                                                        labels = c("Very Sore", "Very Sore", "Moderate", "Minimal", "No Soreness"))


chi_soreness <- svychisq(~Mlax_Position + Soreness_recode, design = final_survey_design)
with(final_survey_design$variables, table(Mlax_Position, `Sleep Quality`))
chi_sleep <- svychisq(~Mlax_Position + `Sleep Quality`, design = final_survey_design)

with(final_survey_design$variables, table(Mlax_Position, Motivation))
final_survey_design$variables$Motivation_binary <- factor(final_survey_design$variables$Motivation,
                                                          levels = c("Very Low", "Low", "Average", "High", "Very High"),
                                                          labels = c("Low", "Low", "Average", "High", "Very High"))

with(final_survey_design$variables, table(Mlax_Position, Motivation_binary))
chi_motivation <- svychisq(~Mlax_Position + Motivation_binary, design = final_survey_design)
with(final_survey_design$variables, table(Mlax_Position, Wellbeing_cat))
chi_Overall_Wellness <- svychisq(~Mlax_Position + Wellbeing_cat, design = final_survey_design)

with(final_survey_design$variables, table(Mlax_Position, `Physical Fatigue`))

print(chi_overall_stress)
Chi_Stress_p <- as.numeric(chi_overall_stress$p.value)
print(Chi_Stress_p)


#create a data frame of the p-values
chi_stress_pvalue <- data.frame(
  Indicator = c("Overall Stress"),
  P_Value = c(Chi_Stress_p),
  row.names = NULL
)

print(chi_stress_pvalue)
str(chi_stress_pvalue)

print(chi_physical_fatigue)
print(chi_soreness)
print(chi_sleep)
print(chi_motivation)
print(chi_Overall_Wellness)

#Chi-square test of all wellness indicators by Wellness score

Chi_Wellness_stress <- svychisq(~Wellbeing_cat + Overall_Stress_, design = final_survey_design)

Chi_Wellness_physical_fatigue <- svychisq(~Wellbeing_cat + `Physical Fatigue`, design = final_survey_design)
Chi_Wellness_soreness <- svychisq(~Wellbeing_cat + Soreness_recode, design = final_survey_design)
Chi_Wellness_sleep <- svychisq(~Wellbeing_cat + `Sleep Quality`, design = final_survey_design)
Chi_Wellness_motivation <- svychisq(~Wellbeing_cat + Motivation_binary, design = final_survey_design)

print(Chi_Wellness_stress)
print(Chi_Wellness_physical_fatigue)
print(Chi_Wellness_soreness)
print(Chi_Wellness_sleep)
print(Chi_Wellness_motivation)

######=================================================================#######

# 9. INTERACTION MODEL: POSITION-SPECIFIC EFFECTS

# Add interaction between predictors and Mlax_Position
survey_model_interaction <- svyglm(`Wellbeing Score` ~ Overall_Stress_Num * Mlax_Position +
                                     Physical_Fatigue_Num * Mlax_Position +
                                     Soreness_Num * Mlax_Position +
                                     Sleep_Quality_Num * Mlax_Position +
                                     Motivation_Num * Mlax_Position,
                                   design = boot_survey_design, family = gaussian())
# Display summary of interaction model
summary(survey_model_interaction)

# Extract coefficient estimates and confidence intervals for interaction model

model_coefficients_interaction <- coef(summary(survey_model_interaction))
conf_intervals_interaction <- confint(survey_model_interaction)

print("Survey-Weighted Interaction Model Coefficients:")
print(model_coefficients_interaction)

print("Bootstrapped 95% Confidence Intervals for Interaction Model:")

print(conf_intervals_interaction)

write_csv(FS2025_LastName_Lookup, "Last Name Lookup.csv")

######=================================================================#######
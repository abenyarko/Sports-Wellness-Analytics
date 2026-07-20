# Install Required Packages

install.packages(c(
  "dplyr",
  "tidyverse",
  "haven",
  "readr",
  "broom",
  "survey",
  "sampling",
  "ggplot2",
  "cluster",
  "factoextra",
  "boot",
  "rmarkdown",
  "knitr",
  "tinytex",
  "stargazer",
  "kableExtra"
))


invisible(lapply(c("dplyr","tidyverse","haven","readr","broom","survey","sampling",
                   "ggplot2","cluster","factoextra","boot","rmarkdown","knitr",
                   "scales","tinytex","stargazer","kableExtra"),
                 library, character.only = TRUE))

######=================================================================#######

# 8. REGRESSION MODEL: PREDICTING WELLBEING SCORE (OVERALL) with each factor

# Fit a survey-weighted regression model for the full dataset
survey_model <- svyglm(`Wellbeing Score` ~ Overall_Stress_Num + Physical_Fatigue_Num + 
                         Soreness_Num + Sleep_Quality_Num + Motivation_Num,
                       design = boot_survey_design, family = gaussian())
# Display model summary
summary(survey_model)

# Extract coefficient estimates and confidence intervals
model_coefficients <- coef(summary(survey_model))
conf_intervals <- confint(survey_model)

print("Survey-Weighted Regression Coefficients:")
print(model_coefficients)

print("Bootstrapped 95% Confidence Intervals:")
print(conf_intervals)

######=================================================================#######
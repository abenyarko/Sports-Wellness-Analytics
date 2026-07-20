######=================================================================#######

# 7. VISUALIZATION OF BOOTSTRAPPED RESULTS

#Make days of the week a factor
complex_survey_data2025$Day_of_Week <- factor(complex_survey_data2025$Day_of_Week, 
                                              levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
#Total number of responses - From 1/20/25 - 3/6/25
nrow(complex_survey_data2025)

#Response Rate by Day of the Week
summary(complex_survey_data2025$Day_of_Week)

#percentage of responses by day of the week
day_of_week_percentages <- prop.table(table(complex_survey_data2025$Day_of_Week)) * 100
print(day_of_week_percentages)

#Average Wellbeing Score by Day of the Week
day_of_week_means <- svyby(~`Wellbeing Score`, ~Day_of_Week, boot_survey_design, svymean, na.rm = TRUE)
print(day_of_week_means)


# Boxplot comparing Wellbeing Score by Day_of_Week (ensure Day_of_Week exists in df)
ggplot(complex_survey_data2025, aes(x = Day_of_Week, y = `Wellbeing Score`, fill = Day_of_Week)) +
  geom_boxplot(alpha = 0.7) +
  theme_minimal() +
  labs(title = "Comparison of Wellbeing Score by Day of Week",
       x = "Day of Week", y = "Wellbeing Score")

# Confidence Interval Plot for Bootstrapped Mean Wellbeing Score by Day_of_Week
wellbeing_ci <- svyby(~`Wellbeing Score`, ~Day_of_Week, boot_survey_design, svymean, ci = TRUE, na.rm = TRUE)

names(wellbeing_ci)[names(wellbeing_ci) == "`Wellbeing Score`"] <- "Wellbeing_Score"

ggplot(wellbeing_ci, aes(x = Day_of_Week, y = Wellbeing_Score)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymin = Wellbeing_Score - 1.96 * se, ymax = Wellbeing_Score + 1.96 * se), width = 0.2) +
  theme_minimal() +
  labs(title = "Bootstrapped Mean Wellbeing Score with 95% CI",
       x = "Day of Week", y = "Mean Wellbeing Score")

######=================================================================#######
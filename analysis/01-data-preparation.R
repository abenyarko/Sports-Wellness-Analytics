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

# Load the data
full_season_mlax_2025 <- read_csv("Data Projects/full season mlax 2025 1764344858999.csv")

view(full_season_mlax_2025)

######=================================================================#######

#Remove column 12 and 13
full_season_mlax_2025 <- full_season_mlax_2025[,-c(11,12)]


str(full_season_mlax_2025)

######=================================================================#######

#Check for missing values
sum(is.na(full_season_mlax_2025))

str(full_season_mlax_2025$Date)

######=================================================================#######

#Convert Date to Date format
full_season_mlax_2025$Date <- as.Date(full_season_mlax_2025$Date, format = "%d-%m-%Y")

######=================================================================#######

#REFINE THE SLEEP QUALITY VARIABLE

#Convert Sleep Quality to a factor
full_season_mlax_2025$'Sleep Quality' <- as.factor(full_season_mlax_2025$`Sleep Quality`)

str(full_season_mlax_2025$`Sleep Quality`)

#Show me that totals for each column
summary(full_season_mlax_2025)
summary(full_season_mlax_2025$`Sleep Quality`)

#Show me which number is associated with each level of the Sleep Quality variable
levels(full_season_mlax_2025$`Sleep Quality`)

full_season_mlax_2025$`Sleep Quality` <- factor(full_season_mlax_2025$`Sleep Quality`, 
                                                levels = c("Unable to Sleep", 
                                                           "Restless, Woke Up 2x +", 
                                                           "Average", 
                                                           "Good, Feel Refreshed", 
                                                           "Excellent, Feel Very Refreshed"),
                                                ordered = TRUE)  # Add ordered = TRUE if needed

levels(full_season_mlax_2025$`Sleep Quality`)

#Make an ordered factor for the Sleep Quality variable
full_season_mlax_2025$`Sleep Quality`<- as.ordered(full_season_mlax_2025$`Sleep Quality`)

str(full_season_mlax_2025$`Sleep Quality`)

######=================================================================#######

#REFINE THE OVERALL STRESS VARIABLE

#convert Overall Stress to a factor
full_season_mlax_2025$`Overall Stress` <- as.factor(full_season_mlax_2025$`Overall Stress`)

levels(full_season_mlax_2025$`Overall Stress`)
full_season_mlax_2025$`Overall Stress` <- factor(full_season_mlax_2025$`Overall Stress`, 
                                                 levels = c("Very High", 
                                                            "High", 
                                                            "Average", 
                                                            "Low", 
                                                            "Very Low"),
                                                 ordered = TRUE)  # Add ordered = TRUE if needed

levels(full_season_mlax_2025$`Overall Stress`)
summary(full_season_mlax_2025$`Overall Stress`)
str(full_season_mlax_2025$`Overall Stress`)

######=================================================================#######

#REFINE THE PHYSICAL FATIGUE VARIABLE

full_season_mlax_2025$`Physical Fatigue` <- as.factor(full_season_mlax_2025$`Physical Fatigue`)
levels(full_season_mlax_2025$`Physical Fatigue`)
full_season_mlax_2025$`Physical Fatigue` <- factor(full_season_mlax_2025$`Physical Fatigue`, 
                                                   levels = c("Very High", 
                                                              "High", 
                                                              "Average", 
                                                              "Low", 
                                                              "Very Low"),
                                                   ordered = TRUE)  # Add ordered = TRUE if needed

levels(full_season_mlax_2025$`Physical Fatigue`)
summary(full_season_mlax_2025$`Physical Fatigue`)
str(full_season_mlax_2025$`Physical Fatigue`)

######=================================================================#######

#REFINE THE MOTIVATION VARIABLE

full_season_mlax_2025$Motivation <- as.factor(full_season_mlax_2025$Motivation)
levels(full_season_mlax_2025$Motivation)
full_season_mlax_2025$Motivation <- factor(full_season_mlax_2025$Motivation, 
                                           levels = c("Very Low", 
                                                      "Low", 
                                                      "Average", 
                                                      "High", 
                                                      "Very High"),
                                           ordered = TRUE)  # Add ordered = TRUE if needed

levels(full_season_mlax_2025$Motivation)
summary(full_season_mlax_2025$Motivation)

######=================================================================#######

summary(full_season_mlax_2025)

#Create a column for day of the week based on the Date column
full_season_mlax_2025$Day_of_Week <- weekdays(full_season_mlax_2025$Date)

str(full_season_mlax_2025$Day_of_Week)
full_season_mlax_2025

######=================================================================#######

#REFINE THE SORENESS VARIABLE

full_season_mlax_2025$'Soreness' <- as.factor(full_season_mlax_2025$'Soreness')
levels(full_season_mlax_2025$Soreness)
full_season_mlax_2025$Soreness <- factor(full_season_mlax_2025$Soreness, 
                                         levels = c("Painful to Move",
                                                    "Very Sore", 
                                                    "Moderate", 
                                                    "Minimal", 
                                                    "No Soreness"),
                                         ordered = TRUE)  # Add ordered = TRUE if needed

levels(full_season_mlax_2025$Soreness)
summary(full_season_mlax_2025$Soreness)

######=================================================================#######

#ANONYMIZE THE DATA

#Anonymize Last name

set.seed(123)  # Ensures reproducibility

# Add a unique ID column4
full_season_mlax_2025 <- full_season_mlax_2025 %>%
  mutate(Player_ID = row_number())  # Assigns a unique number to each row

#Give each last name the same Player_ID
full_season_mlax_2025 <- full_season_mlax_2025 %>%
  group_by(Last_Name) %>%
  mutate(Player_ID = first(Player_ID)) %>%
  ungroup()

# Create a lookup table
FS2025_LastName_Lookup <- full_season_mlax_2025 %>%
  select(Original_Last_Name = Last_Name, Player_ID)  # Store original last names with their IDs

view(FS2025_LastName_Lookup)

# Anonymize the last names
full_season_mlax_2025 <- full_season_mlax_2025 %>%
  mutate(Last_Name = paste0("Player_", Player_ID)) %>%  # Assign unique Player_X names
  select(-Player_ID)  # Remove temporary ID if not needed

# View the lookup table
print(FS2025_LastName_Lookup)

view(FS2025_LastName_Lookup)

#View the anonymized data
view(full_season_mlax_2025)

######=================================================================#######

#Save mlax_team as a csv file
write_csv(full_season_mlax_2025, "Full Season 2025 Data.csv")

######=================================================================#######

#REFINE THE MLAX POSITION VARIABLE

summary(full_season_mlax_2025$`Mlax Position`)
levels(full_season_mlax_2025$`Mlax Position`)
str(full_season_mlax_2025$`Mlax Position`)
full_season_mlax_2025$`Mlax Position` <- as.factor(full_season_mlax_2025$`Mlax Position`)
levels(full_season_mlax_2025$`Mlax Position`)
summary(full_season_mlax_2025$`Mlax Position`)

######=================================================================#######

#Load CSV into new dataframe

raw_survey_data2025 <- read_csv("C:/Users/abeny/Documents/Data Projects/Full Season 2025 Data.csv")

view(raw_survey_data2025)

str(raw_survey_data2025)

######=================================================================#######

#Rename Last_Name column to Player_ID

raw_survey_data2025 <- raw_survey_data2025 %>%
  rename(Player_ID = Last_Name)

#Convert categorical Wellbeing indicators into numeric variables
complex_survey_data2025 <- raw_survey_data2025 %>%
  mutate(
    Overall_Stress_Num = as.numeric(factor(`Overall Stress`, 
                                           levels = c("Very High", 
                                                      "High", 
                                                      "Average", 
                                                      "Low", 
                                                      "Very Low", ordered = TRUE))), 
    Physical_Fatigue_Num = as.numeric(factor(`Physical Fatigue`, 
                                             levels = c("Very High", 
                                                        "High", 
                                                        "Average", 
                                                        "Low", 
                                                        "Very Low", ordered = TRUE))), 
    Soreness_Num = as.numeric(factor(Soreness, 
                                     levels = c("Painful to Move",
                                                "Very Sore", 
                                                "Moderate", 
                                                "Minimal", 
                                                "No Soreness", ordered = TRUE))), 
    Sleep_Quality_Num = as.numeric(factor(`Sleep Quality`, 
                                          levels = c("Unable to Sleep", 
                                                     "Restless, Woke Up 2x +", 
                                                     "Average", 
                                                     "Good, Feel Refreshed", 
                                                     "Excellent, Feel Very Refreshed", ordered = TRUE))), 
    Motivation_Num = as.numeric(factor(Motivation, 
                                       levels = c("Very Low", 
                                                  "Low", 
                                                  "Average", 
                                                  "High", 
                                                  "Very High", ordered = TRUE)))
  )

str(complex_survey_data2025)

######=================================================================#######

#Make a categorical variable for Wellbeing Score

complex_survey_data2025 <- complex_survey_data2025 %>%
  mutate(
    Wellbeing_cat = cut(`Wellbeing Score`,
                        breaks = quantile(`Wellbeing Score`, probs = seq(0, 1, length.out = 4), na.rm = TRUE),
                        include.lowest = TRUE,
                        labels = c("Low", "Medium", "High"))
    
  )

######=================================================================#######

#Convert the character variables to factors with the correct levels
complex_survey_data2025$`Sleep Quality` <- factor(complex_survey_data2025$`Sleep Quality`, 
                                                  levels = c("Unable to Sleep", 
                                                             "Restless, Woke Up 2x +", 
                                                             "Average", 
                                                             "Good, Feel Refreshed", 
                                                             "Excellent, Feel Very Refreshed"),
                                                  ordered = TRUE)  # Add ordered = TRUE if needed

complex_survey_data2025$`Overall Stress` <- factor(complex_survey_data2025$`Overall Stress`, 
                                                   levels = c("Very High", 
                                                              "High", 
                                                              "Average", 
                                                              "Low", 
                                                              "Very Low"),
                                                   ordered = TRUE)

complex_survey_data2025$Soreness <- factor(complex_survey_data2025$Soreness, 
                                           levels = c("Painful to Move",
                                                      "Very Sore", 
                                                      "Moderate", 
                                                      "Minimal", 
                                                      "No Soreness"),
                                           ordered = TRUE)

complex_survey_data2025$Motivation <- factor(complex_survey_data2025$Motivation, 
                                             levels = c("Very Low", 
                                                        "Low", 
                                                        "Average", 
                                                        "High", 
                                                        "Very High"),
                                             ordered = TRUE)

complex_survey_data2025$`Physical Fatigue` <- factor(complex_survey_data2025$`Physical Fatigue`, 
                                                     levels = c("Very High", 
                                                                "High", 
                                                                "Average", 
                                                                "Low", 
                                                                "Very Low"),
                                                     ordered = TRUE)

summary(complex_survey_data2025)

######=================================================================#######

#Rename Mlax Position column

complex_survey_data2025 <- complex_survey_data2025 %>%
  rename(Mlax_Position = `Mlax Position`)

#Create table of Wellbeing Score by Mlax Position
table(complex_survey_data2025$Wellbeing_cat, complex_survey_data2025$Mlax_Position)


#Make Mlax_Position is a factor with the correct levels
complex_survey_data2025$Mlax_Position <- factor(complex_survey_data2025$Mlax_Position,
                                                levels = c("A", "OM", "DM", "D", "GK", "FO"))

view(complex_survey_data2025) 

######=================================================================#######

#Make a column for the month based on the Date column
complex_survey_data2025$Month <- format(complex_survey_data2025$Date
                                        , "%B")

str(complex_survey_data2025$Month)
view(complex_survey_data2025)

######=================================================================#######

#Start Machine Learning here

######=================================================================#######
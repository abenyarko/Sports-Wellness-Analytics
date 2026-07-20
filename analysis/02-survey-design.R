######=================================================================#######

# Define the population totals as a data frame
pop_df <- data.frame(Mlax_Position = c("A", "OM", "DM", "D", "GK", "FO"),
                     Freq = c(8, 13, 14, 7, 4, 4))

######=================================================================#######

#Create Intial weights
complex_survey_data2025$Initial_Weight <- 1

#Create your initial survey design 
wellness_design <- svydesign(ids = ~1, 
                             strata = ~Mlax_Position, 
                             data = complex_survey_data2025, 
                             weights = ~Initial_Weight, 
                             nest = TRUE)

# Perform raking using the population margins in a data frame
raked_wellness_design <- rake(wellness_design, 
                              sample.margins = list(~Mlax_Position), 
                              population.margins = list(Mlax_Position = pop_df))

######=================================================================#######


# 2. DEFINE POPULATION DISTRIBUTION & INITIAL DESIGN

# Known counts for each position 
population_totals <- c(A = 8, OM = 13, DM = 14, D = 7, GK = 4, FO = 4)
pop_df <- data.frame(Mlax_Position = c("A", "OM", "DM", "D", "GK", "FO"),
                     Freq = c(8, 13, 14, 7, 4, 4))
total_population <- sum(population_totals)  
print(total_population)

# Define an initial design with equal weights and stratify by Mlax_Position
complex_survey_data2025$Initial_Weight <- 1  

wellness_design <- svydesign(ids = ~1, 
                             strata = ~Mlax_Position, 
                             data = complex_survey_data2025, 
                             weights = ~Initial_Weight, 
                             nest = TRUE)

raked_wellness_design <- rake(wellness_design, 
                              sample.margins = list(~Mlax_Position), 
                              population.margins = list(Mlax_Position = pop_df))

complex_survey_data2025$Raked_Weight <- weights(raked_wellness_design)

complex_survey_data2025$Raked_Weight 

######=================================================================#######

# Define the final survey design using the raked weights

final_survey_design <- svydesign(ids = ~1, 
                                 strata = ~Mlax_Position, 
                                 data = complex_survey_data2025, 
                                 weights = ~Raked_Weight, 
                                 nest = TRUE)

######=================================================================#######


#Make complex_survey_data2025 a csv file

write_csv(complex_survey_data2025, "Complex Survey Data 2025.csv")

######=================================================================#######
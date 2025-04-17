library(tidyverse)
library(glm2)
library(synthpop)
library(nlme)

set.seed(123)
n <- 1000
df <- data.frame(
  id = 1:n,
  age = sample(c(20:80),n, replace = TRUE),
  gender = sample(c("Male","Female"), n, replace = TRUE),
  drug = sample(c("Drug A","Drug B","Placebo"), n, replace = TRUE),
  dose = sample(c("10 mg","20 mg","50 mg"), n, replace = TRUE),
  comorbidity = sample(c("Diabetes","Hypertension","None"), n, replace = TRUE),
  adverse_event = sample(c("Mild","Moderate","Severe"),n,replace = TRUE, prob = c(0.5,0.3,0.2))
)
df$serious_ae <- ifelse(df$adverse_event == "Severe", 1,0)
syn_df <- syn(df)
sdf <- syn_df$syn
head(sdf)
write.csv(sdf,"synthetic_pharmacovigilance_data.csv", row.names = FALSE)

# This code will reshape the table to have state as one of the columns

library(dplyr)
library(stringr)
library(tidyverse)
library(tidyr)

data <- read.csv("merged_datasets/dataset_education_2018-2023.csv", sep = ",", header = T, check.names = F, comment.char = "", stringsAsFactors = F)
data$Year <- as.factor(data$Year)
data.2 <- reshape2::melt(data, value.name = "Number_Individuals", variable.name = "State")
write.csv(data.2, "merged_datasets/dataset_education_2018-2023_melt-2.csv", row.names=FALSE)

data.3 <- read.csv("merged_datasets/dataset_income_2018-2023.csv", sep = ",", header = T, check.names = F, comment.char = "", stringsAsFactors = F)
data.3$Year <- as.factor(data.3$Year)
data.4 <- reshape2::melt(data.3, value.name = "Value", variable.name = "State")
write.csv(data.4, "merged_datasets/dataset_income_2018-2023_melt.csv", row.names=FALSE)

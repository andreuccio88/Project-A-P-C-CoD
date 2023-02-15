rm(list=ls())

library(tidyverse)
library(data.table)
library(HMDHFDplus)
library(data.table)



load("TOT.RData")
head(TOT)

# Dati italiani da WHO
# Year: anno; Age: eta; 
# Ex: esposti da usare come offset
# deaths: numero di decessi, se gli zeri risultano problematici si possono imputare a 1; in alternativa
# si possono raggruppare le eta in classi di 5 (per decessi e per esposti)
# Cause: 3 principali cause di morte
# Cohort: effetto coorte Year-Age


# Year
TOT  %>%  ggplot(aes(x =Age, y = deaths))+geom_line(aes(group = interaction(Cause, Year), colour = Year))+
  facet_wrap(~Cause,scales = "free")

# Cohort
TOT  %>%  ggplot(aes(x =Age, y = deaths))+geom_line(aes(group = interaction(Cause, Cohort), colour = Cohort))+
  facet_wrap(~Cause,scales = "free")

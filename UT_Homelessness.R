library(siverse)
library(tidyverse)
library(tidycensus)

slc <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Salt_Lake_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv") %>% clean_names()
carbon_emory <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Carbon_And_Emery_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()
davis <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Davis_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()
grand <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Grand_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()
sanjuan <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/San_Juan_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()
tooele <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Tooele_County_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()
weber_morgan <- read.csv("G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/Homelessness/Weber___Morgan_Counties_Homeless_Counts_By_Household_And_Individual_2011-2014.csv")%>% clean_names()


slc <- slc %>% 
  mutate(county = "Salt Lake")
carbon_emory <- carbon_emory %>% 
  mutate(county = "Carbon & Emory")
davis <- davis %>% 
  mutate(county = "Davis") %>% 
  mutate(x2013 = as.integer(x2013),
         x2014 = as.integer(x2014))
grand <- grand %>% 
  mutate(county = "Grand")%>% 
  mutate(x2013 = as.integer(x2013),
         x2014 = as.integer(x2014))
sanjuan <- sanjuan %>% 
  mutate(county = "San Juan")%>% 
  mutate(x2013 = as.integer(x2013),
         x2014 = as.integer(x2014))
tooele <- tooele %>% 
  mutate(county = "Tooele")
weber_morgan <- weber_morgan %>% 
  mutate(county = "Weber & Morgan")

ut_homelessness <- bind_rows(slc,carbon_emory,davis,sanjuan,tooele,weber_morgan)

write.csv(ut_homelessness, "G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/ut_homelessness.csv")

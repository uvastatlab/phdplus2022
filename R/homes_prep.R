# homes prep
library(tidyverse)
homes <- readRDS("data/homes.Rds")

homes <- homes %>% 
  select(-tmp, -yearremodeled, -usecode, -condition, 
         -lastsaledate1, -landuse, -totalrooms, 
         -landvalue, -improvementsvalue, 
         -lastsaleprice, -lastsaledate) %>% 
  rename(condition = condition2) %>% 
  filter(hsdistrict != "Unassigned") %>% 
  filter(condition != "None") %>% 
  mutate(hsdistrict = fct_drop(hsdistrict),
         condition = fct_drop(condition)) %>% 
  filter()

homes <- homes %>% 
  filter(!is.na(yearbuilt))

saveRDS(homes, "data/homes.Rds")

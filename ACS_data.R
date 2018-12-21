ut <- counties(state = "UT", class = "sf")

map_pov <- acs_pov %>% 
  filter(year == "2017") %>% 
  filter(county_id!="0", county_id!="49000") %>% 
  rename(GEOID = county_id) %>% 
  mutate(GEOID = as.character(GEOID))

map <- left_join(map_pov,ut)

write_rds(map, "G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/map.rds")

emp_tot <- map_df(2012:2017, function(x){
  get_acs(geography = "county",
          variables = c(tot_civilian = "B23025_003"),
          state = "UT",
          survey = "acs1",
          year = x) %>%
    mutate(year = x) %>%
    rename(tot_estimate = estimate,
           tot_moe = moe) %>%
    select(-variable)
})

unemp<- map_df(2012:2017, function(x){
  get_acs(geography = "county",
          variables = c(unemp = "B23025_007"),
          state = "UT",
          survey = "acs1",
          year = x) %>%
    mutate(year = x) %>%
    rename(unemp_estimate = estimate,
           unemp_moe = moe) %>%
    select(-variable)
})


emp <- left_join(emp_tot,unemp)

write_rds(emp, "G:/My Drive/SI/Current Projects/CRA Needs Assessment/WS 2_Analysis of Publicly Available Data/Data/emp.rds")

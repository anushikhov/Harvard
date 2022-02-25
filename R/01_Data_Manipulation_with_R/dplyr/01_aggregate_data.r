# Use count to find the number of counties in each region, sort in descending order
counties_selected %>% 
	count(region, sort = TRUE)

# Find number of counties per state, weighted by citizens, sorted in descending order
counties_selected <- counties %>% 
	select(county, region, state, population, citizens)
counties_selected %>%
	count(state, wt = citizens, sort = TRUE)

# What are the US states where the most people walk to work?
counties_selected <- counties %>% 
	select(county, region, state, population, walk)
counties_selected %>% 
	mutate(population_walk = population * walk / 100) %>%
	count(state, wt = population_walk, sort = TRUE)

# While California had the largest total population, 
# New York state has the largest number of people who walk to work.


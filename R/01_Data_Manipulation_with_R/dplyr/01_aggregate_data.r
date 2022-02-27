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

# Summarize to find minimum population, maximum unemployment, and average income  
counties_selected <- counties %>%
	select(county, population, income, unemployment)
counties_selected %>%
	summarize(min_population = min(population), max_unemployment = max(unemployment), average_income = mean(income))

# Group by state, find the total area and population
counties_selected <- counties %>%
	select(state, county, population, land_area)
counties_selected %>%
	group_by(state) %>%
	summarize(total_area = sum(land_area), total_population = sum(population)) %>%
# Add a density column with the people per square mile, then arrange in descending order.
	mutate(density = total_population / total_area) %>%
	arrange(desc(density))

# New Jersey and Rhode Island are the "most crowded" of the US states,
# with more than a thousand people per square mile.

# Group and summarize to find the total population in each combination of region and state

counties_selected <- counties %>%
	select(region, state, county, population)
counties_selected %>%
	group_by(region, state) %>%
	summarize(total_pop = sum(population)) %>%
# Calculate the average state population in each region and the median state population in each region.
	summarize(average_pop = mean(total_pop), median_pop = median(total_pop))

# Find the county in each region with the highest percentage of citizens who walk to work.
counties_selected <- counties %>%
	select(region, state, county, metro, population, walk)
counties_selected %>%
	group_by(region) %>%
	top_n(1, walk)

# Calculate the average income of counties within each region and state.
# Find the highest-income state in each region.
counties_selected <- counties %>%
	select(region, state, county, population, income)
counties_selected %>%
	group_by(region, state) %>%
	summarize(average_income = mean(income)) %>%
	top_n(1, average_income)

# In how many states do more people live in metro areas than non-metro areas?
counties_selected <- counties %>%
	select(state, metro, population)
# For each combination of state and metro, find the total population.
counties_selected %>%
	group_by(state, metro) %>%
	summarize(total_pop = sum(population)) %>%
# Extract the most populated row from each state.
	top_n(1, total_pop) %>%
# Ungroup, then count how often Metro or Nonmetro appears  
# to see how many states have more people living in those areas.
	ungroup() %>%
	count(metro)

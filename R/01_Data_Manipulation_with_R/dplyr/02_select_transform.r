# Find which counties have the highest rates of working in the service industry.
glimpse(counties)
counties %>%
	select(state, county, population, professional:production) %>%
	arrange(desc(service))

# Filter for the counties where at least 50% of the population is engaged in public work.
counties %>%
	select(state, county, population, ends_with("work")) %>%
	filter(public_work >= 50)

# Rename the n column count() to something more descriptive.
counties %>% 
	count(state) %>%
	rename(num_counties = n)

# Select and rename in the same step.
counties %>%
	select(state, county, poverty_rate = poverty)

# Keep state, county, population, add density that contains the population per land_area.
counties %>%
	select(state, county, population, density = population / land_area) %>% 
# Filter for counties with a population greater than one million.
	filter(population > 1000000) %>%
# Sort the table in ascending order of density.
	arrange(density)

# San Bernardino is the lowest density county with a population about one million.

# Choosing among the four verbs
# Change the name of the unemployment column.
counties %>%
	rename(unemployment_rate = unemployment)
# Keep the state and county columns, and the columns containing poverty.
counties %>%
	select(state, county, contains("poverty"))
# Calculate the fraction_women column without dropping the other columns.
counties %>%
	mutate(fraction_women = women / population)
# Keep only the state, county, and employment_rate columns.
counies %>%
	transmute(state, county, employment_rate = employed / population)

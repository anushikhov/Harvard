# Find which counties have the highest rates of working in the service industry.
glimpse(counties)
counties %>%
	select(state, county, population, professional:production) %>%
	arrange(desc(service))

# Filter for the counties where at least 50% of the population is engaged in public work.
counties %>%
	select(state, county, population, ends_with("work")) %>%
	filter(public_work >= 50)

# Basic dplyr verbs: select, mutate, filter, arrange

counties_selected <- counties %>%
select(state, county, population, private_work, public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>%
	arrange(desc(public_work))

# Filter the counties with population above 1000000  
counties_selected %>% 
	filter(population > 1000000)

# Find only the counties in the state of California that also have a population above one million
counties_selected %>%
	filter(state == "California", population > 1000000)

# Filter for Texas and more than 10000 people; sort in descending order or private_work
counties_selected %>%
	filter(state == "Texas", population > 10000) %>%
	arrange(desc(private_work))

# Add a new column public_workers with the number of people employed in public work
counties_selected %>%
	mutate(public_workers = population * public_work / 100)

# Add a new variable proportion_women with the fraction of the county's population made up of women
counties_selected %>%
	mutate(proportion_women = women / population)

# Sussex County in Virginia is more than two thirds male: this is because of two men's prisons in the county
counties %>%
	select(state, county, population, men, women) %>%
	mutate(proportion_men = men / population) %>%
	filter(population > 10000) %>%
	arrange(desc(proportion_men))

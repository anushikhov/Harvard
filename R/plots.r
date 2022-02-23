library(dslabs)
data(murders)

# Storing the population in millions
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)

# Many states have populations below 5 million and are bunched up in the plot.
# We may gain further insights from making this plot in the log scale.
# Transform the variables using the log base 10 transformation.

log10_population <- log10(murders$population)
log10_total_gun_murders <- log10(murders$total)
plot(log10_population, log10_total_gun_murders)

murders <- mutate(murders, rate = total/population * 100000)
hist(murders$rate)

murders$state[which.max(murders$rate)]

# Boxplots are useful when we want a summary of several variables or several strata of the same variable
boxplot(rate~region, data = murders)

# Stratify the state population by region, generate boxplots for the strata
boxplot(population~region, data = murders)

# Strata - a group into which members of a population are divided in stratified sampling.
# "allocation of sample units of strata"

# A stratified random sampling involves dividing the entire population into homogeneous groups called strata.
# (plural for stratum)

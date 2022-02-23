library(dplyr)
library(dslabs)

# For changing the data table by adding a new column or change an existing one, use mutate
# To filter the data by subsetting rows, use filter
# To subset the data by selecting specific columns, use select

# %/% the pipe operator

murders <- mutate(murders,rate=total/population*100000)

head(murders)

filter(murders, rate <= 0.71)

new_table <- select(murders, state, region, rate)

filter(new_table, rate <= 0.71)

murders %>% select(state, region, rate) %>% filter(rate <= 0.71)

library(dslabs)
data(murders)
sort(murders$total)

# Function order takes a vector and returns the indices that sort the vector parameter
order(x)

index <- order(x)

x[index]

index <- order(murders$total)

order(murders$state[index])

murders$state[index]

max(murders$total)

i_max <- which.max(murders$total)

murders$state[i_max]

min(murders$total)

i_min <- which.min(murders$total)

murders$state[i_min]

# For a given list, rank returns the rank of its entries

x <- c(31, 4, 15, 92, 65)

rank(x)
# 3, 1, 2, 5, 4

#####################
# original          #
# 31, 4, 15, 92, 65 #
#                   #
# sort              #
# 4, 15, 31, 65, 92 #
#                   #
# order             #
# 2, 3, 1, 5, 4     #
#                   #
# rank              #
# 3, 1, 2, 5, 4     #  
#####################

# sort(x) and x[order(x)] give the same result, this can be useful for finding row numbers with certain properties



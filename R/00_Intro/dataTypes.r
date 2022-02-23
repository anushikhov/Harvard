# To determinte the type of on object
class(ls)

class(2)

library(dslabs)
# To load a dataset
data("murders")

class(murders)

# To see the structure of an object
str(murders)

# To see the first six lines on the object
head(murders)

# the last six
tail(murders)

# To access different variables, use the accessor $
murders$population

# To get the names of the columns (besides the str functions)
names(murders)

pop <- murders$population
# To see the length of the vector
length(pop)

# Logical vectors

z <- 3 ==2

class(z)

# Factors are useful for storing categorical data
levels(murders$region)

# Saving categorical data this way is more memory efficient.
# Levels are stored as integers, integers are smaller memorywise than characters.


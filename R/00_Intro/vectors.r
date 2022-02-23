# To create vectors
codes <- c(380, 124, 818)

country <- c("italy", "spain", "france")

codes <- c(italy=380, canada=124, egypt=818)
codes <- c("italy"=380, "canada"=124, "egypt"=818)

names(codes) <- country

codes

# To create a vector (generates sequences)
seq(1,10)

seq(1,10,2)

1:10

codes[2]

codes[c(1,3)]

codes[1:2]

codes["canada"]

codes[c("egypt","italy")]

# Vector coercion

x <- c(1, "canada", 3)

x

class(x)
# "character"

# Conversion
x <- 1:5

y <- as.character(x)

y

# To turn them back
as.numeric(y)

# NA - not available - a missing value 

x <- c("1", "b", "3")

as.numeric(x)
# 1 NA 3


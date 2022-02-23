library(dslabs)

murder_rate <- murders$total/murders$population*100000

index <- murder_rate < 0.71
index <- murder_rate <= 0.71

index

murders$state[index]

# The logical vector gets coarsed to numeric, i.e. TRUE->1, FALSE->0. 
# When we sum them, we are couting the cases that are TRUE.
sum(index)

TRUE & TRUE

west <- murders$region == "West"
safe <- murder_rate <= 1

index <- safe & west

murders$state[index]

####

x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)
# 2, 4, 5

index <- which(murders$state == "Massachusetts")

index

murder_rate[index]

##

index <- match(c("New York", "Florida", "Texas"), murders$state)

murder_state[index]

murder_rate[index]

##

x <- c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")

y %in% x
# TRUE, TRUE, FALSE

c("Boston", "Dakota", "Washington") %in% murders$state
# FALSE, FALSE, TRUE



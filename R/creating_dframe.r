grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"),
		     exam_1 = c(95, 80, 90, 85),
		     exam_2 = c(90, 85, 85, 90))

grades

# By default, data.frame turns characters into factors
class(grades$names)
# factor

# To avoid this

grades <- data.frame(names = c("John", "Juan", "Jean", "Yao"),
		     exam_1 = c(95, 80, 90, 85),
		     exam_2 = c(90, 85, 85 90),
		      stringsAsFactors = FALSE)

class(grades$names)
# character

# Find out the most common names in the year 1990.
babynames %>%
	filter(year == 1990) %>%
	ararnge(desc(number))

# The most common names for babies in the US in 1990 were Michael, Christopher, and Jessica.  

# Find the most common name for US babies in each year.
babynames %>%
	group_by(year) %>%
	top_n(1, number)

# John was the most common name in 1880, and Mary was the most common name for a  while after that.

# Visualize the names Steven, Thomas, and Matthew as a line plot over time, 
# with each name represented by a different color.

selected_names <- babynames %>%
	filter(name %in% c("Steven", "Thomas", "Matthew"))
ggplot(selected_names, aes(x = year, y = number, color = name)) + geom_line()

# Names Steven and Thomas were common in the 1950s, but Matthew became common more recently.



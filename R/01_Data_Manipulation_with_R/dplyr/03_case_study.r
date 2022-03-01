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

# Find the year each name is most common.  
babynames %>%
	group_by(year) %>%
	mutate(year_total = sum(number)) %>%
	ungroup() %>%
	mutate(fraction = number / year_total) %>%
	group_by(name) %>%
	top_n(1, fraction)

# Normalize by a different metric.
# Divide each name by the maximum for that name. Every name will peak at 1.
babynames %>%
	group_by(name) %>%
	mutate(name_total = sum(number), name_max = max(number)) %>%
	ungroup() %>%
	mutate(fraction_max = number / name_max)

# Visualize the normalized popularity of each name.

names_normalized <- babynames %>%
	group_by(name) %>%
	mutate(name_total = sum(number), name_max = max(number)) %>%
	ungroup() %>%
	mutate(fraction_max = number / name_max)
names_filtered <- names_normalized %>%
	filter(name  %in% c("Steven", "Thomas", "Matthew"))
	ggplot(names_filtered, aes(x = year, y = fraction_max, color = name)) + geom_line()

sets <- read.table("/home/an/data/sets.csv", header=T, sep=";")
themes <- read.table("/home/an/data/themes.csv", header=T, sep=",")

# Def use read.csv() instead!!!!
# read.table() messes up the view

install.packages("dplyr")
library("dplyr")

sets %>%
	inner_join(themes, by = c("theme_id" = "id"))

# To append to the shared columns:
sets %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

# To find the most common themes:
sets %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme")) %>%
	count(name_theme, sort = TRUE)

# Join a list of LEGO parts, available as parts, with these parts' corresponding categories, 
# available as part_categories.
parts %>%
	inner_join(parts_categories, by = c("part_cat_id" = "id"), suffix = c("_part", "_category"))

# parts is a list of all LEGO parts, and a new table, inventory_parts, 
# has some additional information about those parts, 
# such as the color_id of each part you would find in a specific LEGO kit.

# Join the two tables to observe how joining increases the size of the table
# because of the one-to-many relationship that exists between these two tables.
parts %>%
	inner_join(inventory_parts, by = c("part_num"))

# Reverse the order of tables.  
inventory_parts %>%
	inner_join(parts, by = c("part_num"))

# The order of the tables is reversed but the result is the same.
# For an inner_join, either direction will yield a table that contains the same information.
# The columns will appear in a different order depending on which table comes first.



# Discover what children the theme "Harry Potter" has.
themes %>%
	inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
	filter(name_parent == "Harry Potter")

# Some themes have grandchildren: their children's children.
# We can inner join themes to a filtered version of itself again
# to establish a connection between the last join's children and their children.

# Join themes to itself again to find the grandchild relationships.
themes %>%
	inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
	inner_join(themes, by = c("id_child" = "parent_id"), suffix = c("_parent", "_grandchild"))

# There are 158 grandparent-grandchild relationships of LEGO themes.

# Left join the themes table to its own children.
# Filter the result of the join to find themes that have no children.
themes %>%
	left_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
filter(is.na(name_child))

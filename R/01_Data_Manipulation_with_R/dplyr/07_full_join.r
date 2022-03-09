# Differences between Batman and Star Wars
inventory_parts_joined <- inventories %>%
	inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
	arrange(desc(quantity)) %>%
	select(-id, -version)

inventory_parts_joined %>%
	inner_join(sets, by = "set_num") %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

# Aggregating each theme
inventory_sets_themes <- inventory_parts_joined %>%
	inner_join(sets, by = "set_num") %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman <- inventory_sets_themes %>%
	filter(name_theme == "Batman")

star_wars <- inventory_sets_themes %>%
	filter(name_theme == "Star Wars")

# Count the part number and color id for the parts in Batman and Star Wars, weighted by quantity.
batman %>%
	count(part_num, color_id, wt = quantity)
star_wars %>%
	count(part_num, color_id, wt = quantity)

# Combine the tables to see any similarities or differences between the two themes.
parts_joined <- batman_parts %>%
		full_join(star_wars_parts, by = c("part_num", "color_id"), suffix = c("_batman", "_star_wars")) %>%
		replace_na(list(n_batman = 0, n_star_wars = 0))

# Sort the number of star wars pieces in descending order.
parts_joined %>%
	arrange(desc(n_star_wars)) %>%
# Join the colors table to the parts_joined table.
parts_joined %>%
	inner_join(colors, by = c("color_id" = "id")) %>%
# Join the parts table to the previous join.
	inner_join(parts, by = "part_num", suffix = c("_color", "_part"))

# The most common Star Wars piece is Black and has the part number 2780.
# There are 392 pieces of this part in the Star Wars theme and 104 pieces in the Batman theme.

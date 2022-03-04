inventory_parts_joined <- inventories %>%
	inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
	select(-id, -version) %>%
	arrange(desc(quantity))

inventory_parts_joined

batmobile <- inventory_parts_joined %>%
	filter(set_num == "7784-1") %>%
	select(-set_num)

batwing <- inventory_parts_joined %>%
	filter(set_num == "70916-1") %>%
	select(-set_num)

batmobile %>%
	inner_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing"))

batmobile %>%
	left_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing"))

# Left join the star_destroyer and millenium_falcon tables
# on the part_num and color_id columns with the suffixes _falcon and _star_destroyer.
millenium_falcon <- inventory_parts %>%
	filter(set_num == "7965-1")
star_destroyer <- inventory_parts_joined %>%
	filter(set_num == "75190-1")
millenium_falcon %>%
	left_join(star_destroyer, by = c("part_num", "color_id"), suffix = c("_falcon", "_star_destroyer"))

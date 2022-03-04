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

# Left join the star_destroyer and millennium_falcon tables
# on the part_num and color_id columns with the suffixes _falcon and _star_destroyer.
millennium_falcon <- inventory_parts %>%
	filter(set_num == "7965-1")
star_destroyer <- inventory_parts_joined %>%
	filter(set_num == "75190-1")
millennium_falcon %>%
	left_join(star_destroyer, by = c("part_num", "color_id"), suffix = c("_falcon", "_star_destroyer"))

# Sum the quantity column by color_id in the Millennium Falcon dataset.
millennium_falcon <- inventory_parts_joined %>%
	filter(set_num == "7965-1")
star_destroyer <- inventory_parts_joined %>%
	filter(set_num == "75190-1")
# Aggregate Millennium Falcon for the total quantity in each part.
millennium_falcon_colors <- millennium_falcon %>%
	group_by(color_id) %>%
	summarize(total_quantity = sum(quantity))
# Aggregate Star Destroyer for the total quantity in each part.
star_destroyer_colors <- star_destroyer %>%
	group_by(color_id) %>%
	summarize(total_quantity = sum(quantity))
# Left join the Millennium Falcon colors to the Star Destroyer colors.
millennium_falcon_colors %>%
	left_join(star_destroyer_colors, by = "color_id", suffix=c("_falcon", "_star_destroyer"))

# Finding an abservation that doesn't have a match
# The inventories table has a version column, for when a LEGO kit gets some kind of change or upgrade.
# Test the assumption that all sets have at least a version 1.
inventory_version_1 <- inventories %>%
	filter(version == 1)
sets %>%
	left_join(inventory_version_1, by = "set_num") %>%
	filter(is.na(version)

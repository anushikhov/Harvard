sets <- read.table("/home/an/data/sets.csv", header=T, sep=";")
themes <- read.table("/home/an/data/themes.csv", header=T, sep=",")

# Def use read.csv() instead!!!!

install.packages("dplyr")
library("dplyr")

sets %>%
	inner_join(themes, by = c("theme_id", "id"))

# To append to the shared columns:
sets %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

# To find the most common themes:
sets %>%
	inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme")) %>%
	count(name_theme, sort = TRUE)



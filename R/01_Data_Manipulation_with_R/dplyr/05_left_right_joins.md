### The left join  

Returns all records from the left table(first), and the matching records from the right(second) table.  

You keep all the observations in the first or left of the two tables whether or not it occurs in the second or right table.  

Left joins are really great for testing your assumptions about a data set and ensuring your data has integrity. 

Left join is also known as left outer join. 

### The right join  

Returns all the rows of the table on the right side of the join and matching rows for the table on the left side of join. The rows for which there is no matching row on left side, the result-set will contain null.  

Right join is also known as right outer join.

Left and right joins are mirror images of each other.

### Replace NAs  

To replace NAs with zeros.  

&emsp;&emsp;&emsp;&emsp;` library(tidyr) `  

&emsp;&emsp;&emsp;&emsp;` sets %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` count(theme_id, sort = TRUE) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` right_join(themes, by = c("theme_id" = "id")) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` replace_na(list(n = 0)) `  

### Mutating joins  

inner - you want to keep only observations that match perfectly between tables
left - you want to keep all observations in the first table, including matching observations in the second table
right - you want to keep all observations in the second table, including matching observations in the first table



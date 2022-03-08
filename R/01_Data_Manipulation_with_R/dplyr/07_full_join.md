### The full join  

The full outer join returns all records when there is a match in left or right table records. 

Left join: keep all batmobile
&emsp;&emsp;&emsp;&emsp;` batmobile %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` left_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing")) `  

Right join: keep all batwing
&emsp;&emsp;&emsp;&emsp;` batmobile %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` right_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing")) `  

Full join: keep all from both
&emsp;&emsp;&emsp;&emsp;` batmobile %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;`full_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing")) `  

Replace NAs for multiple variables

Full join: keep all from both
&emsp;&emsp;&emsp;&emsp;` batmobile %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;`full_join(batwing, by = c("part_num", "color_id"), suffix = c("_batmobile", "_batwing")) %>% `  
&emsp;&emsp;&emsp;&emsp;` replace_na(list(quantity_batmobile = 0, quantity_batwing = 0)) `  



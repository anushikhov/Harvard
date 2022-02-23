Basic dplyr verbs to explore and transform a dataset:

&emsp;&emsp;&emsp;&emsp;` select() `  
&emsp;&emsp;&emsp;&emsp;` filter() `  
&emsp;&emsp;&emsp;&emsp;` arrange() `  
&emsp;&emsp;&emsp;&emsp;` mutate() `  

To see only a few values from all the columns:

&emsp;&emsp;&emsp;&emsp;` glimpse(counties) `  


To collect only a few variables:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, population, unemployment) `  

Use assignment to create a new table:  

` counties_selected <- counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, population, unemployment) `  

The arrange verb sorts data based on one or more variables:  

&emsp;&emsp;&emsp;&emsp; ` counties_selected %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(population) `  

To sort by counties with the highest population - descending order: 

&emsp;&emsp;&emsp;&emsp; ` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(population)) `  

Use the filter verb to extract only particular observations from a dataset based on a condition:  

&emsp;&emsp;&emsp;&emsp; ` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(population)) %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(state == "New York") `  

Filter based on logical operations:

&emsp;&emsp;&emsp;&emsp; ` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(population)) %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(unemployment < 6) `  

Combine multiple conditions together in a filter:  

&emsp;&emsp;&emsp;&emsp; ` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(population)) %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(state == "New York", `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` unemployment < 6) `  



Select and transform columns  

Select a set of columns:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, population, unemployment) `  

Select a range of columns:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, drive:work_at_home) `  

&emsp;&emsp;&emsp;&emsp;` counties %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, drive:work_at_home) `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(drive) `  

Select helpers - functions that specify criteria for choosing columns.  

Contains:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, contains("work")) `  

Starts with:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, starts_with("income")) `  

Other helpers:  

` contains() `  
` starts_with() `  
` ends_with() ` - columns ending in a string    
` last_col() ` - grabs the last column  

For more:  

` ?select_helpers `  

Select can also be used to remove variables from a table by adding a '-' in front of the column name:  

&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(-census_id) `  


Aggregating data to make it more interpretable

Take many observations and summarize them into one. 

### Count

The simplest way to aggregate data is to count it - to find out the number of observations.
&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` count() `  

The real value of the verb is when you give it a specific variable to count:
&emsp;&emsp;&emsp;&emsp;` # To count the number of counties in each state `  
&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` count(state) `  

Sort the data to find the most common observations:
&emsp;&emsp;&emsp;&emsp;` To sort from the most common observations to the least: `  
&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` count(state, sort = TRUE) `  

Supply wt to perform weighted counts, switching the summary from n = n() to n = sum(wt)
&emsp;&emsp;&emsp;&emsp;` To weight differently: `  
&emsp;&emsp;&emsp;&emsp;` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` count(state, wt = population, sort = TRUE) `  

### Group by and summarize

The **summarize** verb takes many observations and turns them into one observation.

# To know the total populaton of the US
&emsp;&emsp;&emsp;&emsp; ` counties %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_population = sum(population)) `  

Multiple variables can be defined in a summarize and each can be aggregated in different ways.

&emsp;&emsp;&emsp;&emsp; ` counties %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_population = sum(population), ` 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` average_unemployment = mean(unemployment) ` 


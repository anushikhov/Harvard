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

&emsp;&emsp;&emsp;&emsp; ` # To know the total populaton of the US  `  
&emsp;&emsp;&emsp;&emsp; ` counties %>% `     
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_population = sum(population)) `  

Multiple variables can be defined in a summarize and each can be aggregated in different ways.  

&emsp;&emsp;&emsp;&emsp; ` counties %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_population = sum(population), `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` average_unemployment = mean(unemployment) `   
**Summary functions**  

` sum() `  
` mean() `  
` median() `  
` min() `  
` max() `  
` n() `  - for the size of the group  

Summarizing the entire table is useful, but ideally we want to aggregate within groups:

&emsp;&emsp;&emsp;&emsp; ` # Find the total population within each state `  
&emsp;&emsp;&emsp;&emsp; ` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` group_by(state) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_pop = sum(population), `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` average_unemployment = mean(unemployment)) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(average_unemployment)) `  

You can group by multiple columns at the same time:

&emsp;&emsp;&emsp;&emsp; ` counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` select(state, metro, county, population) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` group_by(state, metro) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` summarize(total_pop = sum(population)) `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` # Not to keep state as group `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ` ungroup() `  

Use **top_n** to keep the most extreme observations from each group. Like summarize, it operates on a grouped table. The function takes two arguments - the number of observations you want from each group and the column you want to weight by.

&emsp;&emsp;&emsp;&emsp;` counties_selected <- counties %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` select(state, county, population, unemployment, income) `  

&emsp;&emsp;&emsp;&emsp;` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` group_by(state) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` top_n(1, population) `  

&emsp;&emsp;&emsp;&emsp;` counties_selected %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` group_by(state) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` top_n(3, unemployment) `  

**top_n** is often used when creating graphs, we're interested in pulling the extreme examples to include in the visualization.



### The babynames dataset  

Work with a new dataset that represents the names of babies born in the US each year.  
Learn how to use grouped mutates and window function to ask and answer more complex questions about your data.  
Use a combination of dplyr and ggplot2 to make interesting graphs to further explore your data.  

1880 - Aaron - 102  

Frequency of a name  

To find the frequence of the name "Amy" in each year:  

&emsp;&emsp;&emsp;&emsp;` babynames %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(name == "Amy") `  

The dplyr package is very useful for exploring data, but it's especially useful when combined with other tidyverse packages like ggplot2.

Amy plot  

&emsp;&emsp;&emsp;&emsp;` library(ggplot2) `  

There are three parts to a ggplot2 plot - the data, the aesthetics, and the layers.  

Data would be the filtered version of baby names that  can be saved to an object using <-.  

&emsp;&emsp;&emsp;&emsp;` babynames_filtered <- babynames %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(name == "Amy") `  

&emsp;&emsp;&emsp;&emsp;` ggplot(babynames_filtered, aes(x = year, y = number)) + geom_line() `   

Filter for multiple names using ` %in% `:    

&emsp;&emsp;&emsp;&emsp;` babynames_multiple <- babynames %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(name %in% c("Amy", "Christopher")) `  

To find the year in which each name was most common:  

&emsp;&emsp;&emsp;&emsp;` babynames %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` group_by(name) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` top_n(1, number) `  

### Grouped mutates  

group_by() - we only want to add up within each year  

&emsp;&emsp;&emsp;&emsp;` babynames %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` group_by(year) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` mutate(year_total = sum(number)) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` ungroup() %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` mutate(fraction = number / year_total) `  

Visualize the normalized change in popularity  

Picking a few names and calculating each of them as a fraction of their peak is a type of "normalizing" a name, where we're focused on the relative change within each name rather than the overall popularity of the name.  

### Window function  

Takes a vector and returns a vector of the same length.  

Lag - to move each item to the right by one.  

&emsp;&emsp;&emsp;&emsp;` v <- c(1, 3, 6, 14) `  
&emsp;&emsp;&emsp;&emsp;` v `  
[1] 1 3 6 14  
&emsp;&emsp;&emsp;&emsp;` lag(v) `  
[1] NA 1 3 6  

What is each value once we subtracted the previous one?  
&emsp;&emsp;&emsp;&emsp;` v - lag(v) `  

Using ratios to describe the difference in the frequence of a baby name between consecutive years.  

The biggest jumps:  
&emsp;&emsp;&emsp;&emsp;` babynames_fraction %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(name == "Matthew") %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(year) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` mutate(difference = fraction - lag(fraction)) %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(difference)) `  

Changes with every name:  
&emsp;&emsp;&emsp;&emsp;` babynames_fraction %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(name, year) %>% `   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` mutate(difference = fraction - lag(fraction)) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` group_by(name) %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` arrange(desc(difference)) `  


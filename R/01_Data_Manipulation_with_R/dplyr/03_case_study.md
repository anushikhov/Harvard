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



We will join multiple tables together to analyze them in combination.  

We will work with the LEGOs dataset from the Rebrickable website:  
[LEGOs datasets](https://rebrickable.com/downloads/)  
The dataset contains information about the sets, parts, themes, and colors of LEGOs, and is spread across many tables.

Four mutating joins - inner, left, right, full  
Two filtering joins - semi, anti  

### Loading data in R  

R has three different functions which can import data:  

* read.table()  
* read.csv()  
* read.delim()  

`read.table()` loads data from a file into a tabular data set in memory. It takes three parameters - the file path to load, a flag telling if the file contains a header line, the separator character used inside to file to separate the values of each row:  

&emsp;&emsp;&emsp;&emsp;` read.table("data.csv", header=T, sep=";") `  

`help("read.table()")`  to get a full list of the parameters.

The command `read.table()`  will load the data file and print its contents to the console but the data set will not be kept in memory. To keep the data set in memory so we can work with it, we have to assign it to a variable.  

` data = read.table("data.csv", header = T, sep = ";") `  

Whether you use the `=` or `<-` after the variable name doesn't matter.  

You assign the loaded data set to the variable. You can load multiple data sets into memory, and assign each data set to its own variable. Then they can be accessed separately during the analysis.  

### The inner join  

The information we need isn't always confined to one table. 

Inner joins select records that have matching values in both tables.  

Joining sets to themes:  

&emsp;&emsp;&emsp;&emsp;`sets %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("theme_id" = "id")) `  

### Joining with a one-to-many relationship  

An inner join keeps an observation only if it has an exact match between the first and second tables.  

When the variables we're joining by have the same name, we can write the name once, e.g. "set_num".  

&emsp;&emsp;&emsp;&emsp;` sets %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(inventories, by = "set_num") %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` filter(version == 1) `  

Paying close attention to the number of observations before and after a join is an important part of understanding your data.  

An `inner_join` works the same way with either table in either position. The table that is specified first is arbitrary, wince you will end up with the same information in the resulting table either way.  





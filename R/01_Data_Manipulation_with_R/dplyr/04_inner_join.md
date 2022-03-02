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

Joining sets to themes:  

&emsp;&emsp;&emsp;&emsp;`sets %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("theme_id" = "id")) `  



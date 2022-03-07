### Joining tables to themselves  

id, name, parent_id - the table has a relationship to itself  

Having a parent id is a common way to represent a hierarchical relationship.

Tables can be joined to themselves.

child-parent table
&emsp;&emsp;&emsp;&emsp;` themes %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("parent_id" = "id")) `  

&emsp;&emsp;&emsp;&emsp;` themes %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("parent_id" = "id"), suffix = c("_child", "_parent")) `  

&emsp;&emsp;&emsp;&emsp;` themes %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("parent_id" = "id"), suffix = c("_child", "_parent")) %>% `  
&emsp;&emsp;&emsp;&emsp;` filter(name_child == "The Lord of the Rings") `  

&emsp;&emsp;&emsp;&emsp;` themes %>% `  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;` inner_join(themes, by = c("parent_id" = "id"), suffix = c("_child", "_parent")) %>% `  
&emsp;&emsp;&emsp;&emsp;` filter(name_parent == "The Lord of the Rings") `  


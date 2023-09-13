---
title: "Tidy Data and Iteration"
author: "YujieWang"
tags: R
Week: 2
type: lecture
Lecture: 5
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

>[!note] Preface
>* tidy data
>* reshape data frames
>* uniting and separating columns  
>* use the *`map`* function for efficient iteration  
>* handling missing data  


## Tidy data

### What is tidy data?
* Each column corresponds to a **variable**((a property or quality of individual examples)
* Each row corresponds to a specific and unique observation(an instance of a specific type of things)
![upgit_20221127_1669583393.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669583393.png)
Each row corresponds to a penguin instance, each column corresponds to a property

---

### Why tidy data?
* Uniform formats across the rows and columns
* Observations(that are needed by the process of statistical analysis)
- non-tidy data advantages:
	- Non-tidy data can be more accessible visually for non-specialists.
	- Non-tidy can offer substantial performance and space advantages in certain contexts.
	- Specialist fields e.g. computer vision often have unique standards for storing data.

### 1. Reshaping data

- **narrow data** to **wide data** and vice versa
![upgit_20221127_1669583689.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669583689.png)

```r
# create summary data
library(palmerpenguins)
library(dplyr)
library(tidyverse)
# this is a wide data
penguins_summary<-penguins%>%
  group_by(species)%>%
  summarize(bill=round(mean(bill_length_mm,na.rm=TRUE),digits=1),
            flipper=round(mean(flipper_length_mm,na.rm=TRUE),digits=1),
            weight=round(mean(body_mass_g,na.rm=TRUE),digits=1))

print(penguins_summary)
```
![upgit_20221127_1669584011.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584011.png)

#### Create narrow data
#Rnote 利用`pivot_longer()`函数
```r
penguins_summary_wide<-penguins_summary
penguins_summary_narrow<-penguins_summary_wide%>%
  pivot_longer(c(bill,flipper,weight),names_to='property',values_to='value')
penguins_summary_narrow
```
![upgit_20221127_1669584167.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584167.png)

#### Narrow to Wide data
#Rnote 利用`pivot_wider()`函数
```r
penguins_summary_wide<-penguins_summary_narrow%>%
  pivot_wider(names_from=property,values_from=value)
print(penguins_summary_wide)
```
![upgit_20221127_1669584230.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584230.png)

### 2. Uniting and separating data
* **Separate**:separate a character column into multiple columns
* **Unite**: paste together multiple columns into one
![upgit_20221127_1669584346.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584346.png)
The flipper and weight columns on the right data frame are combined into a single column call `flipper_over_weight` on the left
#### Unite
- paste together **multiple columns into one**.
* #Rnote take advantages of `unite()` function.
```r
uni_df<-penguins_summary%>%
  unite(flipper_over_weight,flipper,weight,sep='/')
print(uni_df)
```
![upgit_20221127_1669584727.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584727.png)
Now the original columns *flipper* and *weight* are removed, and a column *flipper_over_weight* is created.

#### Separate
* #Rnote take advantages of `separate()` function.
```r
sep_df<-uni_df%>%separate(flipper_over_weight,into=c("flipper","weight"),sep="/")
print(sep_df)
```
![upgit_20221127_1669584922.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584922.png)

- Use "`convert=TRUE`" to convert columns into <u>numeric</u> types:
```r
sep_df_double<-uni_df%>%
separate(flipper_over_weight,into=c("flipper","weight"),sep="/",convert=TRUE)
print(sep_df_double)
```
![upgit_20221127_1669584935.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669584935.png)

### 3. Nesting and unnesting

* <font color=#c10b26>Nest</font>: pack the data of each individual group into a table(data frame)   ^3f74e3
* <font color=#c10b26>Unnest</font>: flatten the tables back into regular columns(undo the nest operation) 
![upgit_20221127_1669585093.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669585093.png)
>[!note] Note: 
>a tibble is a special type of data frame in R ^60bd33

#### [[#^3f74e3|Nesting]]
#Rnote Nesting can be done in R using the `nest()` function
- Suppose that we have a data frame called musicians:
```r
# Nesting
musicians <- full_join(band_members, band_instruments)
print(musicians)
```
![upgit_20221127_1669585469.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669585469.png)

- Note: to use `nest()` we need to first group the data frame using `group_by()`
- A list of tibbles is created in the column data (corresponds to the individual groups), which is called a list-column
```r
musicians_nest<-musicians%>%group_by(name)%>%nest()
print(musicians_nest)
```
![upgit_20221127_1669585547.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669585547.png)

#### [[#^60bd33|Unnesting]]
- To unnest a data frame, we use the `unnest()` function
```r
musicians_nest%>%unnest(cols=data)
```
![upgit_20221127_1669585673.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669585673.png)

### 4. Iteration based on the map function
- The standard approach to this is <u>through loops</u> e.g. for, while etc.
- we can also use vectorized operations and the map function for iterations
* using `map()` function
* The function `map` returns a `list`
#### Example for map function

```r
is_div_2_3<-function(x){
  if(x%%2==0|x%%3==0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
v<-c(1,2,3,4,5,6)
map(v,is_div_2_3)
```
![upgit_20221127_1669585916.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669585916.png)
In this example, the map function applies the `is_div_2_3` to each individual element of v and <u>returns a list</u> that combines the outputs of the functions.

several variants of the map function that ==return a vector== of a specific type
* `map_lgl()` returns <font color=#c10b26>booleans</font>
* `map_int()` return <font color=#c10b26>integers</font>
* `map_dbl()` return <font color=#c10b26>double</font>
* `map_chr()` return <font color=#c10b26>strings</font>

### 5. Finding variables of maximal correlation
>寻找最大相关变量

1) Takes as ==input a data frame== and a ==variable name== (column name)

2) Computes the <font color=#c10b26>correlation</font> with all other numeric variables(columns)

3) Returns the name of the variable with ==maximal absolute correlation==, and the corresponding correlation.
Recall that the **correlation** between vector $x$ and $y$ is defined as (Pearson formula): #Rnote 
$$
\frac{\sum_1^{n} (x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^n(x_i-\bar{x})^2} \sqrt{\sum_{i=1}^n (y_i-\bar{y})^2} }$$

💡 #Rnote In R, the correlation between two vectors can be computed using the function `cor()`

#### Example for correlation
**Start with a script for a specific case where**
* the dataset is the <u>penguins dataset</u>
* the variable(column) name is 'body_mass_g'

```r
col_name<-'body_mass_g'
df=penguins

v_col<-select(df,all_of(col_name)) # extract column based on col_name
df_num<-select_if(df,is.numeric)%>%select(-all_of(col_name)) # select all numeric columns excluding col_name

cor_func<-function(x){cor(x,v_col,use='complete.obs')}# a function that computes cor between v_col and a vector

correlations<-unlist(map(df_num,cor_func))# compute correlations with all other numeric columns (with map)

print('the computed correlations are:');print(correlations)
```
![upgit_20221127_1669586508.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669586508.png)


```r
max_abs_cor_var<-names(which(abs(correlations)==max(abs(correlations)))) # extract the name of the column with max correlation

cor_val<-as.double(correlations[max_abs_cor_var])

print('\ncolumn with maximal correlation:');print(max_abs_cor_var);
print(cor_val)
```
![upgit_20221127_1669586588.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669586588.png)

Define a function called **max_cor_var**, the body of this function is copied from the previous script:
```r
max_cor_var<-function(df,col_name){
   v_col <- select(df, all_of(col_name)) # extract column based on col_name
  df_num <- select_if(df, is.numeric) %>% select(-all_of(col_name)) # select all numeric columns excluding col_name
  
  cor_func <- function(x){ cor(x, v_col, use='complete.obs') } # a function that computes cor between v_col and a vector
  correlations <- unlist(map(df_num, cor_func)) # compute correlations with all other numeric columns (with map)

  max_abs_cor_var <- names( which( abs(correlations)==max(abs(correlations))  ) ) # extract the name of the column with max correlation
  cor_val <- as.double(correlations[max_abs_cor_var])
  
  return (data.frame(var_name=max_abs_cor_var, cor=cor_val)) # return as a data frame 
}

max_cor_var(penguins,"body_mass_g")
```
![upgit_20221127_1669586632.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669586632.png)
The max_cor_var defined above can be also applied to each individual group of the data frame.

The idea is to use `nest()` and `unnest()` to transform the groups into tables, then apply **max_cor_var** to each of the tables
```r
cor_by_group<-penguins%>%
  group_by(species)%>%
  nest()%>%
  mutate(max_cor=map(data,function(x){max_cor_var(x,'body_mass_g')}))
print(cor_by_group)
```
![upgit_20221127_1669586739.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669586739.png)


### 6. Missing data

Stocks:
* The NA value here represents a missing value
```r
stocks<-tibble(
  year=c(2015,2015,2015,2015,2016,2016,2016),
  qtr=c(1,2,3,4,2,3,4),
  return=c(1.88,0.59,0.35,NA,0.92,0.17,2.66)
)
print(stocks)
```
![upgit_20221127_1669586799.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669586799.png)

#### Two types of missing data
1) <font color=#c10b26>Explicit missing data</font>: The value of an individual variable is replaced with "**NA**"
2) <font color=#c10b26>Implicit missing date</font>:**The entire row is missing**. e.g.,the row corresponding to the first quarter of 2016 is missing.
##### Making missing data explicit
* To make the implicit missing data explicit, we can insert rows that include **NA** values.
* #Rnote using the `complete()` function
* The `complete()` function takes a set of columns and finds all unique combinations.
```r
complete(stocks,year,qtr)
```
![upgit_20221127_1669587001.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669587001.png)
In this example, all unique combinations between (2015,2016) and (1,2,3,4).

* find the row with missing values using the function `complete.cases`, which returns a logical vector indicating which cases are complete.第四行数据缺少值
```r
complete.cases(stocks)
```
![upgit_20221127_1669587094.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669587094.png)
>[!note] Note
>the 4th row is not complete because it contains a NA value

#### Removing the incomplete cases
With the complete case analysis, we can remove the incomplete cases using the `filte()`r function
```r
filter(stocks,complete.cases(stocks))
```
![upgit_20221127_1669587209.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669587209.png)
The 4th row of the original data frame is removed.

#### Replacing the missing values
For example, we can replace a missing value with the **mean of its associated column**
Let’s first define a function called `replace_by_mean` to replace the **NA** value in a vector

```r
replace_by_mean<-function(x){
  mu<-mean(x,na.rm=TRUE)
  impute_f<-function(z){
    if(is.na(z)){
      return (mu)
    }else{
      return(z)
    }
  }
  return(map_dbl(x,impute_f))
}

x<-c(1,2,NA,4)
replace_by_mean(x)
```
![upgit_20221127_1669587294.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669587294.png)
Here the 3rd element of $x$ is replaced with the mean value (1+2+4)/3 = 2.33333

>[!note] Note
here we have used the *mutate()* function to create a new column called returned

```r
mutate(stocks,return=replace_by_mean(return))
```
![upgit_20221127_1669587603.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669587603.png)

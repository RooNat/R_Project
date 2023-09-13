---
title: "Data Wrangling"
author: "YujieWang"
tags: R
type: lecture
Lecture: 4
Week: 2
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Data Wrangling

### What is data wrangling
==**Data wrangling**==: the process of transforming data from one form to another in preparation for another downstream task(e.g.,visualisation, modelling)

Transforming data with data wrangling operations: 
<table style="text-align: center" align="center" border=1, cellspacing=0>
	<tr >
		<td>selecting</td><td>filtering</td>
	</tr>
	<tr>
		<td>mutating</td><td>arranging</td>
	</tr>
	<tr>
		<td>summarising</td>
		<td> joining</td>
	</tr>
</table>
### Learning data wrangling with examples in R

We will do the examples with two important R packages
1. *The `dplyr` package* 
	- An R package designed for **data wrangling**
	- data wrangling APIs, such as:
		- *selecting(), filtering(), mutating()...* 
2. *The `tidyverse` package*
	- A collection of R packages that are designed for data science
	- Including:
		- *`ggplot2`* : a package for visualisation
		- *`tidyr`* : a package for tidying data
		- <font color=#c10b26><i>dplyr</i></font>
		- *`purrr`* : functional programming
	The `dplyr` package is included in the `tidyverse` package (so it is loaded when `tidyverse` is loaded)

**Case study: the <u>Palmer penguins</u> data set** 
```r
install.packages("palmerpenguins")
library(palmerpenguins)
head(penguins)
```
This is what the *penguins* data looks like:
![upgit_tmp_1669570236981625.png}](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669570236.png)

#### Tabular data
Penguins is an example of a ==tabular data== set represented by an R data frame.

| rows                                    | columns(variable)                                |
| --------------------------------------- | ------------------------------------------------ |
| an instance of a specific type of thing | a property or quality of the individual examples |

## Data wrangling operations

### 1. Selecting columns

#Rnote **Select columns**: `select()` function 
`select(data,column_name,...)`
Selecting a subset of columns and generating a new dataset
```r
library(dplyr)
penguins2<-select(penguins,species,bill_length_mm,body_mass_g,flipper_length_mm)
print(penguins2)
```
![upgit_20221127_1669570795.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669570795.png)

**remove several columns** using ==the symbol '-'==
```r
penguins2_1<-select(penguins,-species,-bill_length_mm,-body_mass_g)
print(penguins2_1)
```
![upgit_20221127_1669570948.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669570948.png)

### 2. Filtering rows

Extracting a subset of **rows**(while the columns are unchanged)
#Rnote this can be done with the `filter()` function (from the `dplyr` package)
```r
filter(penguins2,species=='Gentoo')
```
![upgit_20221127_1669571091.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669571091.png)

Select the rows that satisfy multiple conditions: **using  `&`**
For example, to select penguins that are of the Gentoo species and has body mass bigger than 5kg:
```r
filter(penguins2,species=='Gentoo' & body_mass_g>5000)
```
![upgit_20221127_1669571192.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669571192.png)

#### Combining filter & select functions

The following statements are equivalent:

```r
select(filter(penguins2,species=='Gentoo'),species,bill_length_mm,body_mass_g)

penguins2%>%filter(species=='Gentoo')%>%select(species,bill_length_mm,body_mass_g)

```
![upgit_20221127_1669574500.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669574500.png)


#### Simplifying codes with the pipe operator

We can also chain multiple operations with the ==pipe operator %>%==
The pipe operator `%>%` is taken from the `magrittr` package which is also part of the `tidyverse`
To chain multiple operations: `x%<% f1(a)%<%f2(b)%<%f3(c) = f3(f2(f1(x,a),b),c)`
![upgit_20221127_1669574741.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669574741.png)


### 3. Creating and renaming columns

-   #Rnote  using `mutate()` function to create a new column
-   create a new column `flipper_bill_radtio`

```r
# create columns
penguins2%>%mutate(flipper_bill_ratio=flipper_length_mm/bill_length_mm)
```
![upgit_20221127_1669574873.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669574873.png)

-   #Rnote using `rename()` function

```r
# rename an existing column
penguins2%>% rename(f_1_m=flipper_length_mm)
```
![upgit_20221127_1669574946.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669574946.png)

### 4. Sorting the rows

-   #Rnote using `arrange()` function to sort the rows of a data frame according to the values of a column. 
-   in ascending order(default)
-   in descending order, with `desc()`

```r
penguins2 %>% arrange(bill_length_mm)
```
![upgit_20221127_1669575080.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575080.png)

In descending order:

```r
penguins2%>% arrange(desc(bill_length_mm))
```
![upgit_20221127_1669575097.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575097.png)

### 5. Summarizing data

-   summarizing a data frame into ==just one value or a vector==.
-   eg. compute <u>the mean</u>, <u>median（中间值）</u>, <u>sum</u>, <u>standard deviation</u>...
-   #Rnote using `summarize()` function

```r
penguins2%>% summarize(num_rows=n(),avg_weight_kg=mean(body_mass_g/1000,na.rm=TRUE),avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm,na.rm=TRUE))
```
![upgit_20221127_1669575231.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575231.png)
>[!tip] 
>`num_rows=n()` 统计行数

#### Group the rows when summarizing

-   #Rnote use the function **`group_by()`** function

```r
penguins2%>%group_by(species)
```
![upgit_20221127_1669575432.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575432.png)

-   group and then summarize
```r
penguins2%>%group_by(species)%>%summarize(num_rows=n(),avg_weight_kg=mean(body_mass_g/1000,na.rm=TRUE),avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm,na.rm=TRUE))
```
![upgit_20221127_1669575476.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575476.png)
Now we have extracted the three statistics for individual groups(instead of the whole data frame)

#### Column-wise operations with across()

suppose that we want to compute <u>the number of NA</u> (not available) values in each column, which can be done via: 计算NA的数量

```r
Num_NAs<-penguins2%>%summarize(species=sum(is.na(species)),bill_length_mm=sum(is.na(bill_length_mm)),body_mass_g=sum(is.na(body_mass_g)),flipper_length_mm=sum(is.na(flipper_length_mm)))
print(Num_NAs)
```
![upgit_20221127_1669575689.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575689.png)

-   #Rnote Use `across()` to perform column-wise operations,执行结果与上面相同
-   `~sum(is.na(.x))` is equivalent to `function(x){(sum(is.na(x)))}`

```r
Num_NAs<-penguins2%>%summarize(across(everything(),~sum(is.na(.x))))
print(Num_NAs)
```
![upgit_20221127_1669575799.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669575799.png)

-   combine `across()` and `where()` to perform column-wise operations for a <u>subset of columns</u> (for example, that is a **numeric type**)

```r
penguins2%>% summarize(across(where(is.numeric),~mean(.x,na.rm=TRUE)))
```

Combine the `summarize`, `group_by` and `across` functions to perform Column-wise summarizing by groups 
- `~mean(.x,na.rm=TRUE)` is equivalent to `function(x){mean(x,na.rm=TRUE)}`

```r
penguins%>%select(-bill_length_mm)%>%group_by(species)%>%summarize(across(where(is.numeric),~mean(.x,na.rm=TRUE)))
```
![upgit_20221127_1669576216.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576216.png)

### 6. Joining multiple data frames

-   Combining multiple data frames
![upgit_20221127_1669576361.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576361.png)

-   #Rnote using `join()` function to combine the multiple data frames

1. Create data frame 1 : a data frame of <u>bill lengths and species</u>.
```r
# first step:create data frame 1
penguin_bill_lengths_df<-penguins2%>%arrange(desc(bill_length_mm))%>%select(species,bill_length_mm)
penguin_bill_lengths_df
```
![upgit_20221127_1669576491.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576491.png)

2. create data frame 2 : a data frame of <u>Latin species names</u>
```r
# Second step:create data frame 2
species<-unique(penguins2$species)
latin_name<-c('Pygoscelis adeliae','Pygoscelis papua','Pygoscelis antarcticus')
latin_names_df<-data.frame(species,latin_name)
print(latin_names_df)
```
![upgit_20221127_1669576574.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576574.png)
3. combine these two data frames with a join function:

- **Join--Inner join**
```r
	# Finally, combine these two data frames with a join fucntion
	penguin_bill_lengths_df%>%inner_join(latin_names_df)
```
![upgit_20221127_1669576730.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576730.png)
```r
	#inner_join:只保留两表共有的关键字
	print(band_members)
	print(band_instruments)
	inner_join(band_members,band_instruments)
```
<table style="text-align: center" align="center" border=1, cellspacing=0>
	<tr >
		<td>
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576823.png">
		</td>
		<td>
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669576876.png">
		</td>
	</tr>
	<tr>
		<td>band_members</td>
		<td>band_instruments</td>
	</tr>
	<tr>
		
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669577013.png">
		
	</tr>
</table>

- **Join--Outer Join**
	- a full join
	- means to include all rows in x with matching columns in y, then the rows of y that don’t match x
		![upgit_20221127_1669577661.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669577661.png)
```r
	full_join(band_members,band_instruments)
```
![upgit_20221127_1669577481.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669577481.png)

- **Join--Left Join**
	- include all rows in x, and add matching columns from y.
```r
	left_join(band_members,band_instruments)
```
![upgit_20221127_1669577493.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669577493.png)

- **Join--Right Join**
	- include all rows in y, and add matching columns from x
```r
	right_join(band_members,band_instruments)
```
![upgit_20221127_1669577508.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669577508.png)

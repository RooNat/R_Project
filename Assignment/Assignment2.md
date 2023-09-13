---
title: "Assignment2 for Week2"
author: "YujieWang"
tags: R
Week: 2
type: assignment
---

```{r setup, include=FALSE,results="hide"}
knitr::opts_chunk$set(echo = TRUE)
```

## Load packages

1. Load the `tidyverse` package:
```r
library(tidyverse)
```

2. Load the `Stat2Data` package and then the dataset Hawks

```r
library(Stat2Data)
data("Hawks")
```

## 1. Data Wrangling
>[[../My R-note/Data Wrangling|Data wrangling]]

### 1.1 Select and filter
>[[../My R-note/Data Wrangling#1. Selecting columns|Select]] and [[../My R-note/Data Wrangling#2. Filtering rows|filter]]

**(Q1)** Use a combination of the `select()` and `filter()` functions to generate a data frame called "`hSF`" which is a sub-table of the original `Hawks` data frame, such that 
1. Your data frame should include the columns: 
	a) "Wing"
	b) "Weight" 
	c) "Tail" 
2. Your data frame should contain a row for every hawk such that: 
	a) They belong to the species of ==Red-Tailed hawks== 
	b) They have **weight** at least **1kg**. 
3. Use the [[../My R-note/Data Wrangling#Simplifying codes with the pipe operator|pipe operator]] to simplify your code.

```r
head(Hawks)
```
![upgit_20221127_1669591699.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669591699.png)

```r
hsF<-Hawks%>%filter(Species=='RT' & Weight>=1000)%>%select(Wing,Weight,Tail)
print(hsF)
head(hsf,5)
hsFSpecies<-Hawks%>%group_by(Species)%>%summarize(n_rows=n())
print(hsFSpecies)
```

<table style="text-align: center" align="center" border=1, cellspacing=0>
	<tr>
		<td colspan="2">
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669630040.png"
		</td>
	</tr>
		<td colspan="2">head(hsF,5)</td>
	<tr>
	</tr>
	<tr >
		<td>
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669629775.png">
		</td>
		<td>
			<img src="https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669591870.png">
		</td>
	</tr>
	<tr>
		<td>hsF</td><td>hsFSpecies</td>
	</tr>
</table>

**(Q2)** How many variables does the data frame `hSF` have? What would you say to communicate this information to a Machine Learning practitioner?
**Answer:** There are 3 variables (or equivalently 3 features)——Wing, Weight, Tail

---
How many examples does the data frame `hSF` have? How many observations? How many cases?
>[!note] Note
>The "examples"="observations"="cases",they have the same meaning here.

**Answer:** Examples: 398
```r
hsF%>%nrow()
hsF%>%summarize(n_rows=n())
```
>[!important] Results:
>	```
>	[1] 398
>	```
>![upgit_20221127_1669591930.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669591930.png)	
>	

>[!note] nrow()
>Compute the numbers of rows


### 1.2 The arrange function
>The [[../My R-note/Data Wrangling#4. Sorting the rows|arrange]] function

**(Q1)** Use the `arrange()` function to sort the `hSF` data frame created in the previous section so that the rows appear in order of **increasing** wing span. 
Then use the `head` command to print out the **top five rows** of your sorted data frame.

```r
head(hsF%>%arrange(Wing),5)
```
![upgit_20221127_1669591947.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669591947.png)

### 1.3 Join functions and rename functions
>[[../My R-note/Data Wrangling#6. Joining multiple data frames|Join functions]] and [[../My R-note/Data Wrangling#3. Creating and renaming columns|rename functions]]

The species of Hawks within the data frame have been indicated via a two-letter code (e.g., RT, CH, SS). The correspondence between these codes and the full names is given by the following data frame:

| \##   | species_code | species_name_full |
| ----- |:------------:| -----------------: |
| \## 1 |      CH      | Cooper's          |
| \## 2 |      RT      | Red-tailed        |
| \## 3 |      SS      | Sharp-shinned     |

**(Q1)** Use `data.frame()` to create a data frame that is called **`hawkSpeciesNameCodes`** and is the same as the above data frame (i.e., containing the correspondence <u>between codes and the full species names</u>).
```r
species_code<-c("CH","RT","SS")
species_name_full<-c("Cooper's","Red-tailed","Sharp-shinned")
hawkSpeciesNameCodes<-data.frame(species_code,species_name_full)
print(hawkSpeciesNameCodes)
```
![upgit_20221127_1669591975.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669591975.png)

**(Q2)** Use a combination of the functions `left_join()`, the `rename()` and the `select()` functions to create a new data frame called "**hawksFullName**" which is the same as the "**Hawks**" data frame except that <u>the Species column contains the full names rather than the two-letter codes</u>.
**Answer**:
```r
print(hawkSpeciesNameCodes)
hawkSpecies2<-hawkSpeciesNameCodes%>%rename(Species=species_code)
print(hawkSpeciesNameCodes)
```
![upgit_20221127_1669592089.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592089.png)
```r
hawksFullName<-left_join(Hawks,hawkSpecies2)%>%select(-Species)%>%rename(Species=species_name_full)
#如果是right_join的话结果有区别吗
hawksFullName2<-right_join(Hawks,hawkSpecies2)%>%select(-Species)
print(hawksFullName)
print(hawksFullName2)
#没区别
```
![upgit_20221127_1669592276.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592276.png)

**(Q3)** Use a combination of the `head()` and `select()` functions to print out the <u>top seven rows</u> of the columns "**Species**", "**Wing**" and "**Weight**" of the data frame called "**hawksFullName**". Do this without modifying the data frame you just created.
**Answer:**
```r
hawksFullName%>%select(Species,Wing,Weight)%>%head(7) 
```

^3cb4c1

![upgit_20221127_1669592315.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592315.png)
- Does it matter what type of join function you use here?
	**Answer:** Answer The results obtained with any one of left_join(), right_join(), inner_join(), and full_join() are the same, because the two data frames share the same set of species codes. 
- In what situations would it make a difference?
	Answer It would matter if there were some unmatched entries in either data frame 
right_join 和left_join没有区别因为Species只有三种 

### 1.4 The mutate function
>[[../My R-note/Data Wrangling#3. Creating and renaming columns|mutate]]


Suppose that the **fictitious** "**Healthy Hawks Society**" has proposed a new measure called the "**bird BMI**" which attempts to measure the mass of a hawk standardised by their wing span. The "bird BMI" is equal to the weight of the hawk (in grams) divided by their wing span (in millimeters) squared. That is, $$\text{Bird-BMI} := 1000 × \text{Weight/(Wing-span)}^2$$
**(Q1)** Use the `mutate()`, `select()` and `arrange()` functions to create a new data frame called "**hawksWithBMI**" which has the <u>same number of rows</u> as the original Hawks data frame but only <u>two columns</u> -one with their **Species** and one with their "**bird BMI**". Also, arrange the rows in **descending order** of "bird BMI". 

**Answer:**
```r
hawksWithBMI<-Hawks%>%
  mutate(bird_BMI=1000*Weight/Wing^2)%>%
  select(Species,bird_BMI)%>%
  arrange(desc(bird_BMI))
print(head(hawksWithBMI,8))
```
![upgit_20221127_1669592430.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592430.png)


### 1.5 Summarize and group-by functions
>[[../My R-note/Data Wrangling#5. Summarizing data|Summarize]] and [[../My R-note/Data Wrangling#Group the rows when summarizing|group-by]] functions

Using the data frame "**hawksFullName**", from [[Assignment2#^3cb4c1|problem 3]] above, to do the following tasks:

**(Q1)** In combination with the `summarize()` and the `group_by` functions, create a summary table, broken down by **Hawk** species, which contains the following summary quantities:
1. The number of rows (`num_rows`); 
2. The average wing span in centimeters (`mn_wing`); 
3. The median wing span in centimeters (`nd_wing`); 
4. The trimmed average wing span in centimeters with trim=0.1, i.e., the mean of the numbers after the 10% largest and the 10% smallest values being removed (`t_mn_wing`);
5. The biggest ratio between wing span and tail length (`b_wt_ratio`).
Type `?summarize` to see a list of useful functions (mean, sum, etc) that can be used to compute the summary quantities.

**Answer:** 
```r
hawksFullName%>%
  group_by(Species)%>%
  summarize(num_rows=n(),mn_wing=round(mean(Wing),digits=0),
            nd_wing=median(Wing,na.rm=TRUE),
            t_mn_wing=round(mean(Wing,trim=0.1),digits=0),
            b_wt_ratio=round(max(Wing/Tail,na.rm=TRUE),digits=2))
```
![upgit_20221127_1669592458.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592458.png)

**(Q2)** Next create a summary table of the following form: Your summary table will show <u>the number of missing values</u>, <u>broken down by species</u>, for the columns **Wing**, **Weight**, **Culmen**, **Hallux**, **Tail**, **StandardTail**,**Tarsus**, and **Crop**. You can complete this task by combining the `select()`, `group_by()`, `summarize()`,`across()`, `everything()`, `sum()` and `is.na()` functions.

```r
hawksFullName%>%
  group_by(Species)%>%
summarize(across(everything(),~sum(is.na(.x))))%>%
  select(Species,Wing,Weight,Culmen,Hallux,Tail,StandardTail,Tarsus,Crop)
```
![upgit_20221127_1669592544.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592544.png)

## 2.Tidy data and iteration
>[[../My R-note/Tidy Data and Iteration|Tidy data and iteration]]

### 2.1 Missing data and iteration
> [[../My R-note/Tidy Data and Iteration#6. Missing data|Missing data]] and [[../My R-note/Tidy Data and Iteration#4. Iteration based on the map function|iteration]]

**(Q1)** The following function performs imputation by mean. What library do we need to load to run this function?
**Answer:** `tidyverse`
```r
library(tidyverse)
impute_by_mean<-function(x){
  mu<-mean(x,na.rm=1) # first compute the mean of x
  impute_f<-function(z){ # coordinate-wise imputation
  if(is.na(z)){
  return(mu) # if z is na replace with mean
  }else{
  return(z) # otherwise leave in place
  } }
  return(map_dbl(x,impute_f)) # apply the map function to impute across vector
}
```

**(Q2)** Create a function called *impute_by_median* which imputes <u>missing values</u> based on the <u>median of the sample</u>, rather than the mean.
**Answer:**
```r
impute_by_median<-function(x){
  mu<-median(x,na.rm=TRUE)
  impute_median<-function(z){
    if(is.na(z)){
      return(mu)
    }else{
      return(z)
    }
  }
  return(map_dbl(x,impute_median)) ## apply the map function to impute across vector
}
v<-c(1,2,NA,4)
c(impute_by_median(v))
```

```
[1] 1 2 2 4
```

**(Q3)** Next generate a data frame with two variables $x$ and $y$. For our first variable $x$ we have a sequence $(x_1, x_2, ..., x_n)$ where $x_1 = 0$, $x_n = 10$ and for each $i = 1$, · · · , $n − 1$, $x_{i+1} = x_i + 0.1$. For our second variable $y$ we set $y_i = 5x_i + 1$ for $i = 1$, · · · , $n$. Generate data of this form and place within a data frame called `df_xy`
**Standard Answer:**

```r
x <- seq(from=0, to=10, by=0.1) 
y <- x*5 + 1 
df_xy = data.frame(x, y)
df_xy %>% head(5)
```

**My Answer:**
```r
x<-c(seq(0,10,0.1))
z<-function(x){
  result<-5*x+1
  return(result)
}
y<-map_dbl(x,z)
df_xy<-data.frame(x,y)
df_xy%>%head(5)
```
![upgit_20221127_1669592602.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592602.png)

The `map2()` function is similar to the `map()` function but <u>iterates over two variables in parallel</u> rather than one. You can learn more here <https://purrr.tidyverse.org/reference/map2.html>. The following simple example shows you how `map2_dbl()` can be combined with the `mutate()` function.
**Standard example:**

```r
df_xy %>% 
mutate(z=map2_dbl(x,y,~.x+.y)) %>% 
head(5)
```
**My example:**

```r
x<-c(seq(0,10,0.1))
l<-function(x){
  result<-5*x+1
  return(result)
}
h<-function(x,y){
  result<-x+y
  return(result)
}
y<-map_dbl(x,l)
z<-map2_dbl(x,y,h)
df_xyz<-data.frame(x,y,z)
df_xyz%>%head(5)

```
![upgit_20221127_1669592622.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592622.png)

**(Q4)** We will now use `map2_dbl()` to generate a new data frame with missing data. 
- First create a function **`sometimes_missing`** with two arguments: **index** and **value**. The function should return **NA** if index is divisible by 5 and returns value otherwise.
**Answer:** 
```r
sometimes_missing<-function(i,v){
  if(i%%5==0){
    return(NA)
  }else{
    return(v)
  }
}
print(sometimes_missing(14,25))
print(sometimes_missing(15,25))
```

```
[1] 25
[1] NA
```

- Next generate a new data frame called **`df_xy_missing`** with two variables $x$ and $y$, but some missing data. For the first variable x we have a sequence $(x_1, ..., x_n)$, which is precisely the same as with `df_xy`. For the second variable $y$ we have a sequence $(y_1,..., y_n)$ where $y_i = \mathrm{NA}$ if $i$ is divisible by 5 and otherwise $y_i = 5x_i + 1$. To generate the data frame `d_xy_missing` you may want to make use of the functions `row_number()`, `map2_dbl()`, `mutate()` as well as `sometimes_missing()`. Check that the first <u>ten rows</u> of your data frame are as follows:
```r
library(dplyr)
```
**Standard answer:**

```r
df_xy_missing <- df_xy %>%
mutate(y=map2_dbl(row_number(),y,sometimes_missing)) 
df_xy_missing<-df_xy %>%
mutate(y=map2_dbl(.x=row_number(),.y=y,sometimes_missing))
df_xy_missing %>% head(10)
```

**My answer:**
```r
x<-c(seq(0,10,0.1))
sometimes_missing<-function(i,v){
    if(i%%5==0){
      return(NA)
    }else{
      return(5*v+1)
    }
}
y<-map2_dbl(row_number(x),x,sometimes_missing)
df_xy_missing<-data.frame(x,y)
df_xy_missing%>%head(10)
```
![upgit_20221127_1669592678.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592678.png)

**(Q5)** Create a new data frame `df_xy_imputed` with two variables $x$ and $y$. For the first variable $x$ we have a sequence $(x_1,..., x_n)$, which is precisely the same as with `df_xy`. For the second variable $y$ we have a sequence $(y^ \prime_{1} ,..., y^ \prime_{n})$ which is formed from $(y_1,...,y_n)$ by imputing any missing values with the median. To generate **`df_xy_imputed`** from **`df_xy_missing`** by applying a combination of the functions `mutate()` and `impute_by_median()`.
**Answer:**
```r
df_vy_imputed<-df_xy_missing%>%
mutate(y=impute_by_median(y))%>%head(6)
print(df_vy_imputed)
```
![upgit_20221127_1669592700.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592700.png)


### 2.2 Tidying data with pivot functions

In this task you will read in data from a spreadsheet and apply some data wrangling tasks to tidy that data. First download the excel spreadsheet entitled "**HockeyLeague.xlsx**". The excel file contains two spread-sheets- one with <u>the wins for each team</u> and one with <u>the losses for each team</u>. To read this spreadsheet into R we shall make use of the ***readxl*** library. You may need to install the library: `install.packages("readxl")`

![[../../../Attachments/HockeyLeague.xlsx]]
-   The following code shows how to read in a sheet within an excel file as a data frame. You will need to edit the **folder_path** variable to be the directory which contains your copy of the spreadsheet
```r
library(readxl)
folder_path<-'../Assignment2/' # set this to the name of the # directory containing "HockeyLeague.xlsx"
file_name<-"HockeyLeague.xlsx"
file_path<-paste(folder_path,file_name,sep="") # create the file_path
wins_data_frame<-read_excel(file_path,sheet="Wins")
# read of a sheet from an xl file
```
Inspect the first 3 rows of the first five columns:
```r
wins_data_frame%>%select(1:5)%>%head(3)
```

![upgit_20221127_1669592779.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592779.png)

A cell value of the form "a of b" means that games were won out of a total of b for that season. For example, the element for the "Ducks" row of the "1990" column is "30 of 50" meaning that 30 out of 50 games were won that season.
**Is this tidy data?**
**Answer:** This would not usually be considered as tidy data. Firstly, the number of wins and the total number of games for a given season are contained in the same column, rather than being contained within a single column. Indeed the number of wins for different years are spread across multiple columns. A tidy data format would have a single column.<br>

**(Q1)** Now apply your data wrangling skills to transform the *"**wins_data_frame**"* data frame object into a data frame called *"**wins_tidy**"* which contains the same information but has just four columns entitled "**Team**", "**Year**", "**Wins**", "**Total**". The "**Team**" column should contain the team name, the "**Year**" column should contain the year, the "**Wins**" column should contain the number of wins for that season and the "**Total**" column the total number of games for that season. The first column should be of character type and the remaining columns should be of integer type. You can do this by combining the following functions: `rename()`, `pivot_longer()`, `mutate()` and `separate()`.
**Standard answer:**

```r
w_l_narrow<-function(w_or_l){ 
return( 
read_excel(file_path,sheet=w_or_l)%>%
rename(Team=...1)%>% pivot_longer(!Team,names_to="Year",values_to="val")%>% mutate(Year=as.integer(Year))%>% separate(col=val,into=c(w_or_l,"Total"),sep=" of ",convert=TRUE) 
) 
} 
wins_tidy<-w_l_narrow(w_or_l="Wins")
```

**My answer:**
```r
wins_tidy<-wins_data_frame%>%
rename(Team=...1)%>%
pivot_longer(-all_of('Team'),names_to="Year",values_to="Wins_Total")%>%
separate(Wins_Total,into=c("Wins","Total"),sep="of",convert=TRUE)
```

```r
wins_tidy%>%dim() # check the dimensions
```

```
[1] 248   4
```

```r
wins_tidy%>%head(5) # inspect the top 5 rows
```
![upgit_20221127_1669592804.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592804.png)

**(Q2)** The "**HockeyLeague.xlsx**" also contains a sheet with the losses for each team by season. Apply a similar procedure to read the data from this sheet and transform that data into a data frame called 6 "**losses_tidy**" with four columns: "**Team**", "**Year**", "**Losses**", "**Total**" which are similar to those in the "`wins_tidy`" data frame except for the "**Losses**" column gives the number of losses for a given season and team, rather than the number of losses.
**Standard answer:**

```r
losses_tidy<-w_l_narrow(w_or_l="Losses")
losses_tidy %>% head(5)
```

---

**My Answer:**
```r
Losses_game<-read_excel(file_path,sheet="Losses")
Losses_game%>%head(10)
```
![upgit_20221127_1669592844.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592844.png)
```r
# "convert=TRUE"很重要
Losses_tidy<-Losses_game%>%rename(Team=...1)%>%pivot_longer(-all_of('Team'),names_to="Year",values_to="Losses_Total")%>%separate(Losses_Total,into=c("Losses","Total"),sep="of",convert=TRUE)
Losses_tidy%>%head(5)
```
![upgit_20221127_1669592857.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669592857.png)

---

You may notice that the number of wins plus the number of losses for a given team, in a given year does not add up to the total. This is because some of the games are neither wins nor losses but draws. That is, for a given year the number of draws is equal to the total number of games minus the sum of the wins and losses.

**(Q3)** Now combine your two data frames, "**wins_tidy**" and "**losses_tidy**", into a single data frame entitled "`hockey_df`" which has <u>248 rows and 9 columns</u>: 
	- A "Team" column which gives the name of the team as a character
	- the "Year" column which gives the season year, the "Wins" column which gives the number of wins for that team in the given year
	- the "Losses" column which gives the number of losses for that team in the given year 
	- the "Draws" column which gives the number of draws for that team in the given year
	- the "`Wins_rt`" which gives the wins as a proportion of the total number of games (ie. Wins/Total) 
	- the "`Losses_rt`" and the "`Draws_rt`" which gives the losses and draws as a proportion of the total, respectively. 
To do this you can make use of the `mutate()` function. You may also want to utilise the `across()` function for a slightly neater solution.
**Standard answer:**

```r
hockey_df<-inner_join(wins_tidy,losses_tidy)%>%
mutate(Draws=Total-Wins-Losses)%>%
mutate(across(starts_with(c("Wins","Losses","Draws")),~.x/Total, .names="{.col}_rt"))
hockey_df %>% head(5)
```
**My Answer:**
```r
# 考虑如何将double转为int并保留两位小数
hockey_df<-wins_tidy%>%full_join(Losses_tidy)%>%mutate(Draws=Total-Wins-Losses,Wins_rt=Wins/Total,Losses_rt=Losses/Total,Draws_rt=1-Wins_rt-Losses_rt)
print(hockey_df)
```
![upgit_20221128_1669637427.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669637427.png)

**(Q4)** To conclude this task generate a summary data frame which displays, for each team, the **median win rate**, the **mean win rate**, the **median loss rate**, the **mean loss rate**, the **median draw rate** and the **mean draw rate**. The number of rows in your summary should equal the number of teams. These should be sorted in <u>descending order</u> or median win rate. You may want to make use of the following functions: `select()`, `group_by()`, `across()`, `arrange()`.
**Standard answer:**

```r
hockey_df %>% select(-Wins,-Draws,-Losses) %>%
group_by(Team) %>%
summarise(across(starts_with(c("Wins","Losses","Draws")), list(md=median,mn=mean),.names="{substring(.col,1,1)}_{.fn}")) %>% 
arrange(desc(W_md))
```

**My answer:**
```r
#保留两位小数
library(dplyr)
hockey_summary_data<-hockey_df%>%
group_by(Team)%>%
summarize(W_md=median(Wins_rt),W_mn=mean(Wins_rt),L_md=median(Losses_rt),L_mn=mean(Losses_rt),D_md=median(Draws_rt),D_mn=mean(Draws_rt))%>%
select(Team,W_md,W_mn,L_md,L_mn,D_md,D_mn)%>%
group_by(Team)%>%
arrange(desc(W_md))
print(hockey_summary_data)
```
![upgit_20221128_1669637713.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669637713.png)


## 3.Visualisation
>[[../My R-note/Data visualisation with R||Visulisation]]

We will reuse the data wins_tidy obtained above to do visualisation.

**(Q1)** Use a combination of the functions `filter()`, `ggplot()` and `geom_histogram` to create a histogram plot of the **Wins** of **Ducks** within data frame `wins_tidy` with bin widths of 3.

**Answer:**
```r
wins_ducks<-wins_tidy%>%filter(Team=="Ducks")
univar_plot<-ggplot(data=wins_ducks,aes(x=Wins))+xlab("wins")+ylab("Count")
univar_plot+geom_histogram(binwidth = 3)
```
![[../../../../Attachments/Pasted image 20221127234821.png]]
**(Q2)** Similar to (Q1), use the `geom_density()` function to create two density plots, with parameters `adjust=0.5` and `adjust=2`, respectively.
**Answer:**
```r
univar_plot+geom_density(adjust=0.5)
```
![[../../../../Attachments/Pasted image 20221127234902.png]]
```r
univar_plot+geom_density(adjust=2)
```
![[../../../../Attachments/Pasted image 20221127234907.png]]

>[!question]-  **the difference between the two plots?** 
 **Answer:**  The second plot has a curve that is a smoother version of the first plot. This is because the adjust argument in the `geom_density()` function adjusts the **bandwidth** (带宽) of the density plot. A larger “adjust” corresponds to a larger bandwidth, hence a smoother function in the plot.
 
**(Q3)** Next, let's create a bivariate plot. First, from `wins_tidy`, create a data frame called `wins_teams` with columns: **Year**, **Ducks**, **Eagles,** as well as the other teams. For example, the column **Ducks** represent the **Wins** of the team **Ducks** for different years. You can use a combination of `select` and `pivot_wider` to do so.
**Standard answer:**

```r
wins_team <- pivot_wider( select(wins_tidy, Team, Year, Wins), names_from = Team, values_from = Wins )
wins_team
```

**My Answer:**
```r
wins_team<-wins_tidy%>%pivot_wider(names_from = Team,values_from=Wins)%>%select(-Total)
wins_team
```
![upgit_20221128_1669638223.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669638223.png)

Then from wins_team, use `geom_point()` to create a scatter plot, the **x-axis** is the **Wins** of **Ducks**, and the **y-axis** is the **Wins** of **Eagles**.
**Standard answer:**

```r
plot_object = ggplot(data=wins_team,aes(x=Ducks,y=Eagles))+ geom_point()+xlab("Ducks")+ylab("Eagles")+theme_bw()
plot_object
```
![[../../../../Attachments/Pasted image 20221128122612.png]]
**My Answer:**
```r
bivariate_plot<-ggplot(data=wins_team,aes(x=Ducks,y=Eagles))+xlab("Ducks")+ylab("Eagles")
bivariate_plot+geom_point(size=1)
```
![[../../../../Attachments/Pasted image 20221127234936.png]]
>[!note] Note
>The difference between **My Answer** and **Standard answer** is the function `theme_bw()`


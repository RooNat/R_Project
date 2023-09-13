---
title: "Assignment1RMarkdown"
author: "YujieWang"
tags: R
Week: 1
type: assignment
date: "`Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Wave plot

Define a vector called x consisting of a sequence which starts at 0 and goes to 20 in increments of 0.01. You can do this using the `seq()` function.

```{r cars}
x<-seq(0,20,0.01)
x
```

Next create a vector called `y`, which is of the same length as `x`, such that the $i^{th}$ entry of `y` is equal to the sin function of the $i^{th}$ entry of `x`. This can be done via the R function `sin()`.

```r
y<-sin(x)
y
```

Then create a data frame called `sin_df` with two columns: `x` and `y`. 
You can inspect the first few rows of your data frame with the `head()` function like this: #Rnote (`head()`)
```r
sin_df<-data.frame(x,y)
head(sin_df,3)
```

![upgit_tmp_1669548446217189.png}|500](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669548446.png)

• Write a statement to plot sin df.You can do this using the `plot()` function. This aims to display a plot with $x$ as the `x-axis` and $y$ as the `y-axis`.

```r
plot(sin_df)
```
![[../../../Attachments/plot20221127112922.png]]

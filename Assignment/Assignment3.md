---
title: "Assignment 3"
author: "Yujie Wang"
date: "2022-10-12"
tags: R
Week: 3
type: assignment
---
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
## Load packages
1. Load the `tidyverse` package:
2. Load the `Stat2Data` package and then the dataset `Hawks`
```r
library(tidyverse)
library(Stat2Data)
data("Hawks")
```
![upgit_20221128_1669640842.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669640842.png)
## 1. Exploratory data analysis
>[[../My R-note/07 Exploratory data analysis|Exploratory data analysis]]
We will use the **Hawks dataset**.
```r
head(Hawks)
```
![upgit_20221128_1669640853.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669640853.png)
### 1.1 Location estimators
#### 1.1 (Q1)
-   Let's start by computing some $location \: estimators$ for Hawks' Tail.
1.  create a vector called `HawksTail`, the elements of which are from the `Tail` column of `Hawks` data frame.
**Standard answer:**
```r
HawksTail = Hawks$Tail
head(HawksTail)
```
**Answer:**
```r
HawksTail<-Hawks%>%select(Tail)%>%unlist()%>%as.vector()
head(HawksTail)
```
```
[1] 219 221 235 220 157 230
```
2.  use the <u>mean and median</u> functions to compute the sample mean and sample median from the vector HawksTail.
**Standard answer:**
```r
print(mean(HawksTail))
print(median(HawksTail))
```
**My answer:**
```r
HawksTail_mean<-mean(HawksTail,na.rm=TRUE)
HawksTail_median<-median(HawksTail,na.rm=TRUE)
print("HawksTail's mean is:")
print(HawksTail_mean)
print("HawksTail's median is:")
print(HawksTail_median)
```
```
[1] "HawksTail's mean is:"
[1] 198.8315
[1] "HawksTail's median is:"
[1] 214
```
### 1.2 Combining location estimators with the summarise function
#### 1.2 (Q1)
- Use a combination of the `summarise()`, `mean()` and `median()` to compute the [[../My R-note/07 Exploratory data analysis#2. Sample mean|sample mean]], [[../My R-note/07 Exploratory data analysis#3. Sample median|sample median]] and [[../My R-note/07 Exploratory data analysis#4. Trimmed sample mean|trimmed sample]] mean (with $q = 0.5$) of the Hawk's wing length and Hawk's weight (i.e., the Wing and Weight columns). You may need to remove the **NA** values.
**Answer:**
```r
Hawks%>%
  summarise(Wing_mean=mean(Wing,na.rm=TRUE),
            Wing_t_mean=mean(Wing,na.rm=TRUE,trim=0.5),
            Wing_med=median(Wing,na.rm=TRUE),
            Weight_mean=mean(Weight,na.rm=TRUE),
            Weight_t_mean=mean(Weight,na.rm=TRUE,trim=0.5),
            Weight_med=median(Weight,na.rm=TRUE))
```
![upgit_20221128_1669643570.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669643570.png)
- What can you say by comparing the results of the <u>median</u> and the <u>trimmed mean</u> that you obtain?
	**Answer**: The trimmed mean is equivalent to the median after removing half percent of the data means that the median and trimmed mean is more robust than mean.
### 1.2 (Q2)
- Combine them with the `group_by()` function to obtain a breakdown by species.
**Answer:**
```r
Hawks%>%group_by(Species)%>%
  summarise(Wing_mean=mean(Wing,na.rm=TRUE),
            Wing_t_mean=mean(Wing,na.rm=TRUE,trim=0.5),
            Wing_med=median(Wing,na.rm=TRUE),
            Weight_mean=mean(Weight,na.rm=TRUE),
            Weight_t_mean=mean(Weight,na.rm=TRUE,trim=0.5),
            Weight_med=median(Weight,na.rm=TRUE))
```
![upgit_20221128_1669643943.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669643943.png)
### 1.3 Location and dispersion estimators under linear transformations
#### 1.3 (Q1)
Suppose that a variable of interest $X$ has values $X_1,...X_n$. Suppose that $X_1,...,X_n$ has a sample mean $A$. Let $a, b \in \mathbb{R}$ be real numbers and define a new variable $\tilde X$ with $\tilde X_1,...,\tilde X_n$ defined by $\tilde X_i = aX_i + b\:. \text{for}\: i = 1, 2,...,n$. What is the sample mean of $\tilde X_1,...,\tilde X_n$ as a function of $a,b$ and $A$?
**Answer:** $\text{mean\;of} \; {\tilde X}=a*A+b$
Now using the vector **HawksTail** that you created in **Section 1.1** as data and letting **a = 2** and **b = 3**, verify your conclusion using R codes: Compute the mean of $\text{HawksTail*a+b}$ and then compare it with the one obtained from the mean of **HawksTail** and your conclusion.
**Verification:**
```r
a<-2
b<-3
#computed by my conclusion
HawksTailmean1<-HawksTail_mean*a+b
print(HawksTailmean1)
```
```
[1] 400.663
```
```r
#computed by HawksTail separately
compute_mean<-function(x){
  return(x*a+b)
}
HawksTail1<-map_dbl(HawksTail,compute_mean)
HawksTailmean2<-mean(HawksTail1,na.rm=TRUE)
print(HawksTailmean2)
```
```
[1] 400.663
```
The two results are equivalent
#### 1.3 (Q2)
**Question:**
Suppose further that $X_1,...X_n$ has sample variance p and standard deviation q. What is the [[../My R-note/07 Exploratory data analysis#6. Sample variance and sample standard deviation|sample variance]] of $\tilde X_1,...,\tilde X_n$?
What is the [[../My R-note/07 Exploratory data analysis#6. Sample variance and sample standard deviation|sample standard]] deviation of $\tilde X_1,...,\tilde X_n$?
**Answer:**
$\text{Variance\:of\:}\tilde X=a^2*p$
$\text{standard Deviation\:of}\:\tilde X=a*q$
Now using the vector **HawksTail** that you created in Section 1.1 as data and letting **a = 2** and **b = 3**, verify your result using R codes again.
**Verification:**
```r
a<-2
b<-3
HawksTail_variance<-var(HawksTail,na.rm=TRUE)
HawksTail_deviation<-sd(HawksTail,na.rm=TRUE)
#computer by my conclusion
HawksTailvariance1<-HawksTail_variance*a^2
HawksTaildeviation1<-HawksTail_deviation*a
print("computed by my answer:")
print(paste("Variance1:",HawksTailvariance1))
print(paste("Deviation1:",HawksTaildeviation1))
```
```
## [1] "computed by my answer:"
## [1] "Variance1: 5424.1465012701"
## [1] "Deviation1: 73.6488051584688"
```
```r 
#computed by HawksTail separately
HawksTailvariance2<-var(HawksTail1,na.rm=TRUE)
HawksTaildeviation2<-sd(HawksTail1,na.rm=TRUE)
print("computed by new HawksTail:")
print(paste("Variance2:",HawksTailvariance2))
```
```
## [1] "computed by new HawksTail:"
## [1] "Variance2: 5424.1465012701"
```
```r 
print(paste("Deviation2:",HawksTaildeviation2))
```
```
## [1] "Deviation2: 73.6488051584688"
```
### 1.4 Robustness of location estimators
We begin by extracting a vector called "`hal`" consisting of the talon lengths of all the hawks with any missing values removed.
```r
hal<-Hawks$Hallux # Extract the vector of hallux lengths
hal<-hal[!is.na(hal)] # remove ay nans
```
To investigate the effect of outliers on estimates of location we generate a new vector called "**corrupted_hall**" with 10 outliers each of value 100 created as follows:
```r
outlier_val<-100
num_outliers<-10
corrupted_hal<-c(hal,rep(outlier_val,times=num_outliers))
```
Compute the mean of the original sample and the corrupted sample:
```r
mean(hal)
```
```
[1] 26.41086
```
```r
mean(corrupted_hal)
```
```
[1] 27.21776
```
Now let’s investigate what happens as the number of outliers changes from 0 to 1000.
The code below generates a vector called "`means_vect`" which gives the sample means of corrupted samples with different numbers of outliers.
More precisely, `means_vect` is a vector of length 1001 with the $i-th$ entry equal to the mean of a sample with $i-1$ outliers.
```r
num_outliers_vect<-seq(0,1000)
means_vect<-c()
for(num_outliers in num_outliers_vect){
  corrupted_hal<-c(hal,rep(outlier_val,times=num_outliers))
  means_vect<-c(means_vect,mean(corrupted_hal))
}
```
#### 1.4 (Q1) Sample median:
Copy and modify the above code to create an additional vector called "`medians_vect`" of length 1001 with the $i-th$ entry equal to the median of a sample "`corrupted_hal`" with $i-1$ outliers.
**Answer:**
```r
medians_vect<-c()
for(num_outliers in num_outliers_vect){
  corrupted_hal<-c(hal,rep(outlier_val,times=num_outliers))
  medians_vect<-c(medians_vect,median(corrupted_hal))
}
```
#### 1.4 (Q2) Sample trimmed mean:
Amend the code further to add an additional vector called "`t_means_vect`" of length 1001 with the $i-th$ entry equal to the trimmed mean of a sample with $i-1$ outliers, where the trimmed mean has a trim fraction $q=0.1$.
**Answer:**
```r
t_means_vect<-c()
for(num_outliers in num_outliers_vect){
  corrupted_hal<-c(hal,rep(outlier_val,times=num_outliers))
  t_means_vect<-c(t_means_vect,mean(corrupted_hal,trim=0.1))
}
```
#### 1.4 (Q3) Visualisation
Now you should have the vectors "`num_outliers_vect`", "`means_vect`", "`medians_vect`" and "`t_means_vect`". Combine these vectors into a data frame with the following code.
```r
df_means_medians<-data.frame(num_outliers=num_outliers_vect,mean=means_vect,t_mean=t_means_vect,median=medians_vect)
```
Recall that the function `pivot_longer()` below is used to reshape the data.
```r
df_means_medians%>%pivot_longer(!num_outliers,names_to="Estimator",values_to="Value")%>%
ggplot(aes(x=num_outliers,color=Estimator,linestype=Estimator,y=Value))+
  geom_line()+xlab("Number of outliers")
```
![[../../../Attachments/Pasted image 20221128142431.png]]
**Question:** Which quantity is the most robust when the number of outliers is small? 
	Note that, in this experiment, the term outliers simply means the artificial data used to corrupt the vector. It is not related to the outliers computed in 1.4
**Answer:** When the number of outliers is small, the sample **median** is the most robust one.
### 1.5 Box plots and outliers
#### 1.5 (Q1)
Use the functions `ggplot()` and `geom_boxplot()` to create a box plot which summarises the distribution of hawk weights broken down by species.
**Answer:**
```r
ggplot(data=Hawks,aes(x=Species,y=Weight))+
  geom_boxplot()+xlab("Species")+ylab("Weight")
```
![[../../../Attachments/Pasted image 20221128142814.png]]
Note the outliers are displayed as individual dots.
#### 1.5 (Q2) Quantile and boxplots
Compute the 0.25-quantile, 0.5-quantile, 0.75-quantile of the Weight grouped by Species.
**Answer:**
```r
Hawks%>%group_by(Species)%>%
  summarise(quantile025=quantile(Weight,0.25,na.rm=TRUE),
  quantile050=round(quantile(Weight,0.5,na.rm=TRUE),digits=0),
  quantile075=round(quantile(Weight,0.75,na.rm=TRUE),digits=0))
```
![upgit_20221128_1669645976.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669645976.png)
**Question:** Can you explain which parts of the boxplot these numbers correspond to?
**Answer:** The 0.25 − quantile and 0.75 − quantile correspond to the bottom and the top of each box in the plot, respectively. The 0.5 − quantile corresponds to the bar at the middle of the box.
#### 1.5 (Q3) Outliers
>[[../My R-note/07 Exploratory data analysis#Outlier|Outliers]]
Create a function called "`num_outliers`" which computes the number of outliers within a sample (with missing values excluded).
**Answer:**
```r
num_outliers<-function(x){
  q25<-quantile(x,0.25,na.rm=TRUE)
  q75<-quantile(x,0.75,na.rm=TRUE)
  IQRrange<-IQR(x,na.rm=TRUE)
  count=0
  # Remove any nans
  outliers<-x[(x>(q75+1.5*IQRrange)|x<(q25-1.5*IQRrange))&(!is.na(x))]
  return(length(outliers))
}
#Test the function
num_outliers(c(0,40,60,185,NA))
```
```
[1] 1
```
#### 1.5 (Q4) Outliers by group
Now combine your function `num_outliers()` with the functions `group_by()` and `summarise()` to compute the number of outliers for the three samples of hawk weights broken down by species.
**Answer:**
```r
Hawks%>%group_by(Species)%>%
  summarise(num_outliers_weight=num_outliers(Weight))
```
![upgit_20221128_1669646246.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669646246.png)
### 1.6 Covariance and correlation under linear transformations
#### 1.6 (Q1)
Compute the [[../My R-note/07 Exploratory data analysis#Sample covariance|covariance]] and [[../My R-note/07 Exploratory data analysis#Sample correlation|correlation]] between the **Weight** and **Wing** of the Hawks data.
Use `cov` and `cor` function: 
```r
cov(Hawks$Weight,Hawks$Wing,use='complete.obs')
```
```
[1] 41174.39
```
```r
cor(Hawks$Weight,Hawks$Wing,use='complete.obs')
```
```
[1] 0.9348575
```
#### 1.6 (Q2)
**Question:** Suppose that we have a pair of variables: $X$ with values $X_1,...,X_n$ and $Y$ with values $Y_1,...,Y_n$. Suppose that $X_1,...,X_n$ relation R. Let $a,b \in R$ be real numbers and define a new variable $\tilde X$ with $\tilde X_1,...,\tilde X_n$ defined by $\tilde X_i = a\cdot X_i + b. for\: i = 1, 2,...,n$. In addition, Let $c, d \in R$ be real numbers and define a new variable $\tilde Y$ with $\tilde Y_1,...,\tilde Y_n$ defined by $\tilde Y_i = c\cdot Y_i + d$. What is the covariance between $\tilde X_1,...,\tilde X_n$ and $\tilde Y$ with $\tilde Y_1,...,\tilde Y_n$ (as a function of S, a, b, c, d)? Assuming that $a\neq 0$ and $c \neq 0$, what is the correlation between $\tilde X_1,...,\tilde X_n$ and $\tilde Y$ with $\tilde Y_1,...,\tilde Y_n$?
**Answer:**
$\text{The covariance between X and Y}=a \cdot c \cdot S$
$\text{The correlation between X and Y}=\text{sign(a...b)}\cdot R$
Let a = 2.4, b = 7.1, c = −1, d = 3, and let $X$ be the hawk’s weight and $Y$ be the hawk’s Wing. Verify your conclusion with R codes in a similar way to Section 1.3 (Q1).
**Standard verification:**
```r
cov(Hawks$Weight, Hawks$Wing, use='complete.obs')*2.4*(-1) - cov(Hawks$Weight*2.4+7.1, Hawks$Wing*(-1)+3, use='complete.obs')
```
```
[1] 0
```
```r
cor(Hawks$Weight, Hawks$Wing, use='complete.obs')*sign(2.4*(-1)) - cor(Hawks$Weight*2.4+7.1, Hawks$Wing*(-1)+3, use='complete.obs')
```
```
[1] 1.110223e-16
```
**My Verification:**
```r
a<-2.4
b<-7.1
c<--1
d<-3
X<-Hawks%>%select(Weight)
Y<-Hawks%>%select(Wing)
#computed by my answer
S<-cov(X,Y,use='complete.obs')
R<-cor(X,Y,use='complete.obs')
newS<-a*c*S
newR<-R
print(paste("The covariance is:",newS))
```
```
[1] "The covariance is: -98818.535939441"
```
```r
print(paste("The correlation is:",newR))
```
```
[1] "The correlation is: 0.934857460302637"
```
```r
#computed by new X and new Y
newX<-a*X+b
newY<-c*Y+d
newS_compute<-cov(newX,newY,use='complete.obs')
newR_compute<-cor(newX,newY,use='complete.obs')
print(paste("The verified covariance is:",newS))
```
```
[1] "The verified covariance is: -98818.535939441"
```
```r
print(paste("The verified correlation is:",newR))
```
```
[1] "The verified correlation is: 0.934857460302637"
```
## 2. Random experiments, events and sample spaces, and the set theory
>[[../My R-note/08 Population,random samples and elementary set theory|Random experiments, events and sample spaces, and the set theory]]
### 2.1 Random experiments, events and sample spaces
#### 2.1 (Q1)
**Questions:** Firstly, write down the definition of a random experiment, event and sample space.
**Answers:**
1.  A random experiment is a procedure(real or imagined) which has a well-defined set of possible outcomes and could be repeated arbitrarily many times.
2.  A event is a set of possible outcomes of an experiment.
3.  A sample space is the set of all possible outcomes of interest for a random experiment.
#### 2.1 (Q2)
**Questions:** Consider a random experiment of rolling a dice twice. Give an example of what is an event in this random experiment(1). Also, can you write down the sample space as a set(2)? What is the total number of different events in this experiment(3)? Is the empty set considered as an event(4)?
**Answers:**
(1) {(1,2), (2,3)} is an event. Here (1,2) means the number on the top of the first die is 1 and the number on the top of the second die is 2.
(2) The sample space is $\{(a, b)|a, b ∈ {1, 2, 3, 4, 5, 6}\}$
(3) 36. There are 36 different outcomes, so the total number of events is $2^{36}$.
(4) Yes. The empty set is an event.
### 2.2 Set theory
>[!note]
>Remember that a set is just a collection of objects. All that matters for the identity of a set is the objects it contains. In particular, the elements within the set are unordered, so for example the set {1, 2, 3} is exactly the same as the set {3, 2, 1}. In addition, since sets are just collections of objects, each object can only be either included or excluded and multiplicities do not change the nature of the set. In particular, the set {1, 2, 2, 2, 3, 3} is exactly the same as the set A = {1, 2, 3}. In general there is no concept of “position” within a set, unlike a vector or matrix.
>
#### 2.2 (Q1) Set operations
Let the sets $A$, $B$, $C$ be defined by A:={1,2,3}, B:={2,4,6}, C:={4,5,6}.
**Questions:**
1.  What are the unions $A \cup B$ and $A \cup C$?
2.  What are the intersections $A \cap B$ and $A \cap C$?
3.  What are the complements $A\setminus B$ and $A\setminus C$?
4.  Are A and B disjoint? Are A and C disjoint?
5.  Are B and $A\setminus B$ disjoint?
6.  Write down a partition of {1,2,3,4,5,6} consisting of two sets (1). Also, write down another partition of {1,2,3,4,5,6} consisting of three sets (2).
**Answers:**
1.  $A \cup B :\{1,2,3,4,6\},A \cup C:\{1,2,3,4,5,6\}$
2.  $A \cap B :\{2\},$ $A \cap C:\{4,6\}$
3.  $A\setminus B$:{1,3}, $A\setminus C$:{1,2,3}
4.  A and B are not disjoint, but A and C are disjoint.
5.  Yes,B and $A\setminus B$ are disjoint.
6.  (1) {1,2,3},{4,5,6},  (2) {1,2},{3,4},{5,6}
#### 2.2 (Q2) Complements, subsets and De Morgan's laws
Let $\Omega$ be a sample space. Recall that for an event $A \subseteq \Omega$ the complement $A^c:= \Omega\setminus A := \{w \in \Omega : w \notin A\}$.Take a pair of events $A \subseteq \Omega$ and $B \subseteq \Omega$.
**Questions:**
1.  Can you give an expression for $(A^c)^c$ without using the notion of a complement?
2.  What is $\Omega ^c$?
3.  (Subsets) Show that if $A \subseteq B$, then $B^c\subseteq A^c$.
4.  (De Morgan's laws) Show that $(A \cap B)^c = A^c \cup B^c$.(1) Let's suppose we have a sequence of events $A_1, A_2,..., A_K \subset \Omega$. Can you write out an expression for $(\cap^K_{k=1}A_k)^c$? (2)
5.  (De Morgan's laws) Show that $(A \cup B)^c$ = $A^c \cap B^c$.
6.  Let's suppose we have a sequence of events $A_1, A_2, · · · , A_K \subset \Omega$. Can you write out an expression for $(\cup ^K_{k=1}A_k)^c$?
**Answers:**
1.  A
2.  $\emptyset$
3.  $A^c:=\{w\in\Omega:w\notin A\},B^c:=\{w\in\Omega:w\notin B\}$
    $A \subseteq B : =\{ w\in \Omega:w\in A \implies w\in B\}$
    $\implies \{w\in \Omega,w\notin B\implies w\notin A\}$
    $\implies B^c\subseteq A^c$
4.  
    (1) Proof:
    $Let\: M=(A\cap B)^c\:and\:N=A^c\cup B^c$
    $x \in M \implies x \in (A \cap B)^c$
    $\implies x \notin (A \cap B)$
    $\implies x \notin A \:or\: x \notin B$
    $\implies x \in A^c\: or \:x \in B^c$
    $\implies x \in A^c \cup B^c$
    $\implies x \in N$
    Thus, $M \subset N$... (i)
    $y \in N \implies y \in A^c \cup B^c$
    $\implies y \in A^c\: or\: y \in B^c$
    $\implies y \notin A\:or\: y \notin B$
    $\implies y \notin (A \cap B)$
    $\implies y \in (A \cap B)^c$
    $\implies y \in M$
    Thus, $N \subset M$... (ii)
    Combing (i) and (ii) we get:$M=N$ means that
    $(A\cap B)^c=A^c\cup B^c$
	(2) $(\cap^K_{k=1}A_k)^c=A_1^c\cup A_2^c \cup A_3^c \cup ...\cup A_K^c$
>[! answer] Standard answer
>![upgit_20221128_1669650735.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669650735.png)
5.  Proof:
    $Let \:P = (A\cup B)^c\: and \:Q = A^c \cap B^c$
    $Let\: x \in P ,then \: x\in P\implies x \in (A \cup B)^c$
    $\implies x \notin (A \cup B)$
    $\implies x \notin A \:and\: x \notin B$
    $\implies x \in A^c \:and\: x \in B^c$
    $\implies x \in A^c \cap B^c$
    $\implies x \in Q$
    So $P\subset Q$...(i)
    $y \in Q \implies y \in A^c \cap B^c$
    $\implies y \in A^c \:and\: y \in B^c$
    $\implies y \notin A \:and \:y \notin B$
    $\implies y \notin (A \cup B)$
    $\implies y \in (A \cup B)^c$
    $\implies y \in P$
    So $Q\subset P$...(ii)
    Combing (i) and (ii) we get:$P=Q$ means that
    $(A\cup B)^c=A^c\cap B^c$
>[!note] Standard answer
>![upgit_20221128_1669650795.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669650795.png)
6.  $(\cup ^K_{k=1}A_k)^c=A_1^c \cap A_2^c \cap A_3^c \cap ...\cap A_K^c$

#### 2.2 (Q3) Cardinality and the set of all subsets:

**Question:**

Suppose that $\Omega = \{w_1, w_2,...,w_K\}$ contains K elements for some natural number K. Here $\Omega$ has cardinality K. Let E be a set of all subsets of $\Omega$, i.e., $E := \{A|A \subset \Omega\}$. Give a formula for the cardinality of E in terms of K.
**Answer:** $The\:cardinality\:of\:E:2^K$

#### 2.2 (Q4) Disjointness and partitions.
Suppose we have a sample space $\Omega$, and events $A_1, A_2, A_3, A_4$ are subsets of $\Omega$.
**Questions:**
1.  Can you think of a set which is disjoint from every other set? That is, find a set $A \subseteq \Omega$ such that $A \cap B = \emptyset\: \text{ for all } B \subseteq \Omega$.
2.  Define events $S_1:= A_1$, $S_2 = A_2\setminus A_1$, $S_3 = A_3\setminus (A_1 \cup A_2)$, $S_4 = A_4\setminus (A_1 \cup A_2 \cup A_3)$. Show that $S_1, S_2, S_3, S_4$ form a partition of $A_1 \cup A_2 \cup A_3 \cup A_4$.
**Answers:**
1.  $\emptyset$ .The empty set satisfies $\emptyset \cap B = \emptyset$ for all $B \subseteq \Omega$
2.  Prove:
    $Let\:M=A_1\cup A_2 \cup A_3 \cup A_4$
    $Let\: x \in M\implies \{x\in A_1\: or \:x\in A_2\:or\:x\in A_3\:or\:x\in A_4\}$
    $S_2=A_2\setminus A_1\implies\{x\in A_2|x\notin A_1\}$
    $S_3=A_3\setminus (A_1\cup A_2)\implies\{x\in A_3|x\notin A_1\: and \:x\notin A_2\}$
    $S_4=A_4\setminus (A_1\cup A_2\cup A_3)\implies\{x\in A_4|x\notin A_1\:and\:x\notin A_2\:and\:x\notin A_3\}$
    $So, S_1 \:and \:S_2\:and \:S_3\:and \:S_4 \:are\: disjoint$
    $S_1\cup S_2\cup S_3\cup S_4=A_1\cup A_2\cup A_3\cup A_4$
    Thus, $S_1,S_2,S_3,S_4$ are from a partition of $A_1\cup A_2\cup A_3\cup A_4$
    
#### 2.2 (Q5) Indicator function.
**Questions:**
Suppose we have a sample space $\Omega$, and the event A is a subset of $\Omega$. Let $\mathbb{1}_A$ be the indicator function of A.
1.  Write down the indicator function $1{_A{^c}}$ of $A^c$ (use $1_A$ in your formula).
2.  Can you find a set B whose indicator function is $1{_A{^c}}$ +$1_A$?
3.  Recall that $1{_{A\cap B}}$ = $1_A\cdot 1_B$ and $1{_{A\cup B}}=\max(1_A,1_B) = 1_A + 1_B - 1_A \cdot1_B$ for any $A \subseteq \Omega$ and $B \subseteq \Omega$. Combining this with the conclusion from Question (Q5) 1, Use indicator functions to prove $(A \cap B)^c = A^c \cup B^c$  (De Morgan's laws).
**Answers:**
1.  $1{_A{^c}}=1-1_A$
2.  $1_{A^c} + 1_A = 1$, so this is the indicator function of $\Omega=A\cup A^c$
3.  Prove:
    $1{_A{^c}}=1-1_A$
    $1{_{A\cup B}}=\max(1_A, 1_B) = 1_A + 1_B - 1_A \cdot 1_B$
    $1_{(A\cap B)^c}=1-1_{A\cap B}=1-1_A \cdot 1_B$
    $1_{A^c\cup B^c}=1_{A^c}+1_{B^c}-1_{A^c}\cdot 1_{B^c}$
    $=1-1_A+1-1_B-(1-1_A)\cdot(1-1_B)$
    $=2-1_A-1_B-(1-1_B-1_A+1_A\cdot1_B)$
    $=2-1_A-1_B-1+1_B+1_A-1_A\cdot 1_B$
    $=1-1_A\cdot1_B$
    $=1_{(A\cap B)^c}$

#### 2.2 (Q6) Uncountable infinities (this is an optional extra)
This is a challenging optional extra. You may want to return to this question once you have completed all other questions.
Show that the set of numbers $\Omega:=[0,1]$ is uncountably infinite.
**Answer:**
We use a proof due to Cantor known as the diagonalisation argument. We shall suppose that $[0, 1]$ is countable and then deduce a contradiction. So suppose that $[0, 1]$ is countable and that there is an 10 enumeration $(a_n)_{n\in \mathbb{N}}$ of $[0, 1]$.
For each $n \in \mathbb{N}$, let $a_{n,j}$ be the corresponding decimal expansion, so each $a_{n,j} \in \{0, 1, · · · , 9\}$ and $a_n = 0$. $a_{n,1}a_{n,2}a_{n,3}a_{n,4}...$. Now choose $x \in [0, 1]$ with decimal expansion $(x_j)_{j\in \mathbb{N}}$ by setting $x_j \in {1, 2,..., 9}\setminus a_{j,j}$ for all $j \in \mathbb{N}$. It follows that $x  \neq a_n$ for all $n \in \mathbb{N}$, and hence $(a_n)_{n \in N}$ is not an enumeration of $[0, 1]$. This is a contradiction, hence there does not exist such an enumeration, so $[0, 1]$ is uncountable.
## 3. Visualisation
> [[../My R-note/Data visualisation with R|Visualisation]]
### 3 (Q1) Density plot:
Use the `ggplot` and `geom_density()` functions to create the following density plot for the three species.
**Answer:**
```r
ggplot(data=Hawks,aes(x=Tail,color=Species))+
  xlab("Tail(mm)")+ylab("Density")+
  theme_bw()+geom_density()
```
![[../../../Attachments/Pasted image 20221128150852.png]]
### 3 (Q2) Violin plot:
Use the `ggplot` and `geom_violin()` functions to create the following violin plot for the three species.
**Answer:**
```r
ggplot(data=Hawks,aes(x=Tail,y=Species,fill=Species))+
  xlab("Tail(mm)")+ylab("Density")+theme_bw()+geom_violin()
```
![[../../../Attachments/Pasted image 20221128150942.png]]
### 3 (Q3) Scatter plot:
**Questions:** Generate a plot similar to the following plot using the `ggplot()` and `geom_point()` functions.
1.  How many aesthetics are present within the following plot?
2.  What are the glyphs within this plot?
3.  What are the visual cues being used within this plot?
```r
ggplot(data=Hawks,aes(x=Tail,y=Weight))+
  geom_point(aes(color=Species,shape=Species))+
  xlab("Tail(mm)")+ylab("Weight(g)")+theme_bw()
```
![[../../../Attachments/Pasted image 20221128151018.png]]
**Answers:**
1.  Four: 
	(1) Tail-horizontal position 
	(2) Weight-vertical position 
	(3) Species-colour 
	(4) Species-shape
2.  The glyphs are the small elements (in this particular case represented by the shapes) corresponding to individual cases
3.  (1) Vertical Position (2) Shape (3) Colour
### 3 (Q4) Trend lines and facet wraps:
**Questions:** Generate the following plot using the `ggplot()`, `geom_point()`, `geom_smooth()` and `facet_wrap()` functions. Note that in the facet plot, the three panels use different scales.
1.  What are the visual cues being used within this plot?
2.  Based on the plot below, what can we say about the relationship between the weight of the hawks and their tail lengths?
**Answer:**
```r
ggplot(data=Hawks,aes(x=Tail,y=Weight))+
  geom_point(aes(color=Species))+
  xlab("Tail(mm)")+ylab("Weight(g)")+theme_bw()+
  geom_smooth(aes(color=Species),method="lm")+
  facet_wrap(~Species,scales="free")
```
![[../../../Attachments/Pasted image 20221128151652.png]]
**Answers:**
1.  The visual cues include horizontal and vertical position, shape, color and direction
2. Based on this sample, longer tail lengths appear to be predictive of larger weights within each species.
### 3 (Q5) Adding annotations
First, compute the **Weight** and the **Tail** of the heaviest hawk in the dataset. You can use `filter()` and `select()` function to select proper data.
Second, reuse the code that you create from Q(3), adding an arrow and an annotation to indicate the heaviest hawk.
```r
heaviest_hawk<-Hawks%>%
  filter(Weight==max(Weight,na.rm=TRUE))%>%
  select(Species,Weight,Tail)
heaviest_hawk
ggplot(data=Hawks,aes(x=Tail,y=Weight))+
  geom_point(aes(color=Species))+
  xlab("Tail(mm)")+ylab("Weight(g)")+
  theme_bw()+
  geom_curve(x=heaviest_hawk$Tail,xend=heaviest_hawk$Tail,
             y=heaviest_hawk$Weight-300,yend=heaviest_hawk$Weight,
             arrow=arrow(length=unit(0.1,'cm')),curvature=0.5)+
  geom_text(x=heaviest_hawk$Tail,y=heaviest_hawk$Weight-300,
            label="heaviest hawk",size=2)
```
![upgit_20221128_1669648602.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669648602.png)
![[../../../Attachments/Pasted image 20221128151625.png]]
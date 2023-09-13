---
title: "Assignment 4"
author: "Yujie Wang"
date: "2022-10-19"
tags: R
Week: 4
type: assignment
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```r
library(tidyverse)
```
![upgit_20221129_1669739442.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669739442.png)

# 1. Probability theory
> [[../My R-note/09 Introduction to probability theory#Definition of the probability|Probability theory]]

## 1.1 Rules of probability

### 1.1 (Q1) Construct probability based on the Rules of probability

#### Question:
Consider a sample space $\Omega=\{a,b,c\}$ and a set of events $\xi=\{A\subseteq B\}$. Based on the rules of probability, find an example of probability $P:\xi\to[0,1]$ such that $P$ satisfies:

$$P(\{a,b\})=0.6\:\text{and}\:P(\{b,c\})=0.5$$

Make sure that your function P satisfies the three rules

#### Answer:

Based on the rules:

$$\mathbb{P}(\{a,b\})+\mathbb{P}(\{c\})=1,\:\mathbb{P}(\{b,c\})+\mathbb{P}(\{a\})=1,\: \text{So},\:\mathbb{P}(\{c\})=0.4,\mathbb{P}(\{a\})=0.5,\mathbb{P}(\{b\})=0.1$$
$$\mathbb{P}(\{b,c\})=0.5, \mathbb{P}(\{a,c\})=0.9, \mathbb{P}(\{a,b,c\})=1$$

**Example**:In a box, there are 10 spheres, and 5 of them are labeled "a",1 of them is labeled "b", and 4 of them are labeled "c".Every time only one sphere is drawn from the box, after that, the sphere will be returned to the bag.


### 1.1 (Q2) Verify that the following probability space satisfies the rules of probability.

#### Question:

Consider a setting in which the sample space $\Omega=\{0,1\}$, and $\xi=\{A\subseteq\Omega\}=\{\emptyset,\{0\},\{1\},\{0,1\}\}$. For a fixed $q \in [0,1]$, define a function $P:\xi\to[0,1]$ by

$$P(\emptyset)=0,\:P(\{0\})=1-q,\:P(\{1\})=q,\:P(\{0,1\})=1.$$

Show that the probability space ($\Omega,\xi,P$) satisfies the three rules of probability. 

#### Answer:
##### My Answer:
$$\begin{aligned}
\text{From the description,we know for any} \: A\in\xi\\P(\emptyset)=0\geq0,P(\{0\})=1-q,\text{and}\:q\to[0,1],\\ \text{So} \:P(\{0\})\geq0,\text{and}\:P(\{1\})=q\geq0,P(\{0,1\})=1>=0\\ \text{Also},P(\Omega)=P(\{0,1\})=1,\\P(\Omega)=P(\{0\}\cup \{1\})=P(\{0\})+P(\{1\})=1-q+q=1
\end{aligned}$$
##### Standard answer:
![upgit_20221129_1669737927.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669737927.png)

So, the probability space($\Omega,\xi,P$) satisfies the three rules of probability.


## 1.2 Deriving new properties from the rules of probability

### 1.2 (Q1) Union of a finite sequence of disjoint events.

#### Question:

In Rule 3, we have:

$$P(\cup_{i=1}^\infty A_i)=\sum_{i=1}^\infty P(A_i)$$

for an infinite sequence of pairwise disjoint events $A_1,A_2,...$. Show that for a finite sequence of disjoint events $A_1,A_2,...,A_n$, for any integer n bigger than 1, the above equality holds as a consequence of Rule 3, i.e.,

$$P(\cup_{i=1}^n A_i)=\sum_{i=1}^n P(A_i)$$

#### Answer:
##### My Answer:
In an infinite sequence,$\Omega=\{A_1,A_2,...\}$ and $P(\cup_{i=1}^\infty A_i)=\sum_{i=1}^\infty P(A_i)$

let $\xi={A_1,A_2,...,A_n}$

so $\xi\subset\Omega$,

so $P(\cup_{i=1}^n A_i)=\sum_{i=1}^n P(A_i)$
##### Standard answer:

![upgit_20221129_1669738104.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669738104.png)

### 1.2 (Q2) Probability of a complement.

#### Question:
Prove that if $\Omega$ is a sample space, $S\subseteq\Omega$ is an event and $S^c:= \Omega\setminus S$ is its complement, then we have
$$P(S^c)=1-P(S)$$

#### Proof:
$$\begin{aligned}
S \:\text{and} \:S^c \text{are disjoint} \:\\ \text{So} \:P(S\cup S^c)=P(S)+P(S^c)\\ \text{And}\:P(S\cup S^c)=P(\Omega)=1\\ \text{So} \:P(S)+P(S^c)=1\\P(S^c)=1-P(S)
\end{aligned}$$


### 1.2 (Q3) The union bound

#### Question:

In Rule 3, for pairwise disjoint events $A_1, A_2,...$, we have

$$P(\cup_{i=1}^\infty A_i)=\sum_{i=1}^\infty P(A_i)$$

Recall that we have also shown the union bound as a consequence of the rules of probability: for a sequence of events $S_1, S_2,...$, we have $P(\cup_{i=1}^\infty S_i) \leq \sum_{i=1}^\infty P(S_i)$.

Given an example of a sequence of sets $S_1, S_2,...$, such that $P(\cup_{i=1}^\infty S_i) \neq \sum_{i=1}^\infty P(S_i)$.

#### Answer:

In 1.1 (Q1),we know that

$$\begin{aligned}
P(\{a,b\})=0.6,P(\{b,c\})=0.5\\and\:P(\{a\})=0.5,P(\{b\})=0.1,P(\{c\})=0.4\\Let\:S_1=\{a,b\},S_2=\{b,c\}\\So \:P(S_1\cup S_2)=P(\{a,b,c\})=1\neq P(S_1)+P(S_2)=0.6+0.5=1.1
\end{aligned}$$

### 1.2 (Q4) Probability of union and intersection of events.

#### Question:

Show that for events $A\subseteq\Omega$ and $B\subseteq\Omega$, we have

$$P(A\cup B)=P(A)+P(B)-P(A\cap B)$$

#### Answer:
##### My answer:
$$\begin{aligned}
Let\:C=A\cap B^c\\D=A\cap B\\E=A^c\cap B
\end{aligned}
$$

$$\begin{aligned}
So\\P(A\cup B)=P(C)+P(D)+P(E)\\A=C\cup D\:and\:C\:and\:D\:are\:disjoint\\So\:P(A)=P(C)+P(D).\\P(B)=P(D)+P(E).\\So\:P(A)+P(B)=P(C)+P(E)+2P(D)\\=P(A\cup B)+P(D)\\So\:P(A\cup B)=P(A)+P(B)-P(D)\\=P(A)+P(B)-P(A\cup B)
\end{aligned}$$
##### Standard answer:
![upgit_20221129_1669738641.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669738641.png)


# 2. Finite probability spaces
>[[../My R-note/10 Finite probability spaces|Finite probability spaces]]

## 2.1 Sample with replacement
>[[../My R-note/10 Finite probability spaces#Example5 Sampling with replacement|Sample with replacement]]

![[../My R-note/10 Finite probability spaces#^0c7374]]
#Rnote You can computed this number straightforwardly within R via the choose function `choose()`. For example, if we want to compute the number of different subsets of size <font color=#c10b26>3</font> from a collection of size <font color=#c10b26>8</font> we would compute:

```r
choose(8,3)
```
Results:

```
# [1] 56
```
- Suppose we have a bag containing 10 spheres. This includes 3 red spheres and 7 blue spheres. 
- Let’s suppose that we draw a sphere at random from the bag (all spheres have equal probability of being drawn). We record its colour and then return the sphere to the bag. This process is repeated 22 times. This is an example of sampling with replacement since the spheres are replaced after each draw.

### 2.1 (Q1) 

#### Question:

Write down a mathematical expression for the probability that $z$ out of the 22 selections were red spheres (here $z \in \{0, 1,...,22\}$).
>[!tips] Tips
>You can try writing down your mathematical expression using LaTex code in your R markdown file, making use of the LaTex functions `binom` and `frac`. For information about writing mathematical formulae in Rmarkdown documents visit: https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html#equations

#### Answer:

Let A is the event that $z$ out of the 22 selections were red spheres:
$$P(A)=\dfrac{22!}{z!(22-z)!} \cdot (\dfrac{3}{10})^z \cdot (\dfrac{7}{10})^{22-z}=\binom{22}{z} \left(\frac{3}{10} \right)^z \cdot \left(\frac{7}{10}\right)^{22-z}$$

### 2.1 (Q2)
Next write an R function called `prob_red_spheres()` which takes $z$ as an argument and computes the probability that $z$ out of a total of the 22 balls selected are red.
#### Answer:

```r
# the results of my expression
prob_red_spheres<-function(z){
  results<-choose(22,z)*(0.3)^z*(0.7)^(22-z)
  return(results)
}
prob_red_spheres(10)
```
Results:
```
[1] 0.05285129
```

### 2.1 (Q3)

Generate a data frame called **prob_by_num_reds** with two columns **num_reds** and **prob**. The **num_reds** column should contain numbers 1 through 22 and the **prob** column should give the associated probability of selecting that many reds out of a total number of 22 selections.

#### Answer:
##### My answer:
```r
library(dplyr)
num_reds<-seq(22)
prob<-map_dbl(num_reds,prob_red_spheres)
prob_by_num_reds<-data.frame(num_reds,prob)
prob_by_num_reds%>%head(3)
```
##### Standard answer:
```r
prob_by_num_reds <- data.frame(num_reds=seq(22)) %>% mutate(prob=prob_red_spheres(num_reds))
```
Display the first 3 rows of your data frame:
```r
prob_by_num_reds %>% head(3)
```
![upgit_20221129_1669739725.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669739725.png)

### 2.1 (Q4)

Now use the `geom_line()` function within the `ggplot2` library, in conjunction with your data frame to display a plot of the probability as a function of the number of reds.

**Answer:**
##### My answer:
```r
library(ggplot2)
ggplot(data=prob_by_num_reds,aes(x=num_reds,y=prob))+geom_line()+xlab('Number of reds')+ylab('Probability')
```
![[../../../Attachments/Pasted image 20221129163630.png]]
##### Standard answer:
```r
ggplot(prob_by_num_reds, aes(x=num_reds, y=prob)) + geom_line() + xlab('Number of reds') + ylab('Probability') + theme_bw()
```
![[../../../Attachments/Pasted image 20221129163706.png]]
### 2.1 (Q5)

Next we shall explore the `sample()` function within R. Let's suppose we want to simulate a random experiment in which we sample with replacement from a collection of 10 objects, and repeat this process 22 times.
We can do this by calling: 
```r
sample(10,22,replace=TRUE)
```

```
[1]  7  7  4  1  3  1  6 10  9  7  6  8  6  8  6  6  9  7 10  8  2  4
```

Try this out for yourself. The output should be a vector of length 22 consisting entirely of numbers between 1 and 10. Since this is sampling with replacements and the number of samples exceeds the number of elements, there will be repetitions. 

Try rerunning the function. You probably get a different sample. This is to be expected, and even desirable, since the function simulates a random sample. However, the fact that we get a different answer every time we run the code is problematic from the perspective of reproducibility. To avoid this process we can set a random seed via the function `set.seed()`. By doing so we should get the same output every time. Try the following out for yourself:

```r
# Setting the random seed just once
set.seed(0)
for(i in 1:5){
  print(sample(100,5,replace=FALSE))
  # The result may well differ every time
}
```

```
[1] 14 68 39  1 34
[1] 87 43 14 82 59
[1] 51 97 85 21 54
[1] 74  7 73 79 85
[1]  37  89 100  34  99
```

```r
# Resetting the random seed every time
for(i in 1:5){
  set.seed(1)
  print(sample(100,5,replace=FALSE))
  # The result should not change
}
```

```
[1] 68 39  1 34 87
[1] 68 39  1 34 87
[1] 68 39  1 34 87
[1] 68 39  1 34 87
[1] 68 39  1 34 87
```

We shall now use the `sample()` to construct a simulation study to explore the probability of selecting $z$ red balls from a bag of size 10, with 3 red and 7 blue balls, when sampling 22 balls with replacement.
**Steps:**
1.  set a random seed.
2.  create a data frame called `sampling_with_replacement_simulation` consisting of two columns. The first is called *trial* and contains numbers 1 through 1000. The second is called *sample_balls* and corresponds to random samples of size 22 from a bag of size 10, with replacement.
3.  Now add a new column called *num_reds* such that, for each row, *num_reds* contains an integer which gives the number of items within the sample for that row (the entry in the sample_balls column) which are less than or equal to three (assuming that the three red balls are labelled by {1, 2, 3}).
For example, suppose that in some row of the data frame, the sample_balls column contains the following list:

4 10 4 10 8 3 5 5 5 5 10 7 1 2 1 10 5 6 5 7 1 10

Then the corresponding row of the num_reds column should contain the number 5, since 5 of these values are less than equal to 3.You may want to use the functions `mutate()`, `map_dbl` and `sum()`. After performing this step, the data frame `sampling_with_replacement_simulation` should contain one column called `num_reds`.

```r
num_trials<-1000 # set the number of trials
set.seed(0) # set the random seed
sampling_with_replacement_simulation<-data.frame(trials=1:num_trials)%>%mutate(sample_balls=map(.x=trials,~sample(10,22,replace=TRUE)))
# generate collection of num_trials simulations
compute_num<-function(x,y,z){
  new<-as.vector(unlist(x))
  return (sum(new<=z & new>=y))
}
sampling_with_replacement_simulation<-sampling_with_replacement_simulation%>%mutate(num_reds=map_dbl(.x=sample_balls,~compute_num(.x,1,3)))
sampling_with_replacement_simulation%>%head(10)
```
![upgit_20221129_1669740088.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740088.png)

### 2.1 (Q6)

Next we shall add a new column called **predicted_prob** to our existing data frame **prob_by_num_reds** which gives the number of times (that we observed the corresponding number of reds within our simulation) divided by the total number of observations. This aims to estimate the probability of the event that $z$ out of a total of the 22 balls selected are red (for $z = 1, 2, ... , 22$).

```r
num_reds_in_simulation<-sampling_with_replacement_simulation%>%
  pull(num_reds)
#we extract a vector corresponding to the number of reds in each trial
prob_by_num_reds<-prob_by_num_reds%>%mutate(predicted_prob=map_dbl(.x=num_reds,~sum(num_reds_in_simulation==.x))/num_trials)
#add a column which gives the number of trials with a given number of reds
prob_by_num_reds%>%head(10)
```
![upgit_20221129_1669740127.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740127.png)

### 2.1 (Q7)

Finally, create a plot which compares the results of your simulation with your probability formula.

```r
prob_by_num_reds%>%rename(TheoreticalProbability=prob,EstimatedProbability=predicted_prob)%>%
  pivot_longer(cols=c("EstimatedProbability","TheoreticalProbability"),names_to="Type",values_to="count")%>%
  ggplot(aes(num_reds,count))+geom_line(aes(lineType=Type,color=Type))+
  geom_point(aes(color=Type))+scale_linetype_manual(values=c("solid","dashed"))+
  theme_bw()+xlab("Number of reds")+ylab("Probabilities")
```
![[../../../Attachments/Pasted image 20221129164228.png]]
## 2.2 Sampling without replacement
>[[../My R-note/10 Finite probability spaces#Example6 Sampling without replacement|Sampling without replacement]]

Let's suppose we have a large bag containing 100 spheres. There are 50 red spheres, 30 blue spheres and 20 green spheres. Suppose that we sample 10 spheres from the bag **without** replacement.

### 2.2 (Q1)

What is the probability that one or more colours are missing from your selection? First aim to answer this question via a simulation study using ideas from the previous question.
**Use the following steps:**
1.  First set a random seed; 
2. Next set a number of trials (e.g., 10 or 1000. Try this initially with a small number of simulations.Increase your number of simulations to about a relatively large number to get a more accurate answer, once everything seems to be working well), and a sample size (10);
```r
set.seed(0)

sample_size<-10
```

3. Now use a combination of the functions `sample()`, `mutate()` and `map()` to generate your samples. Here you are creating a sample of size 10 from a collection of 100 balls - the sampling is done **without replacement**;

```r
number_trials<-1000
sampling_without_replacement_simulation<-data.frame(trials=1:number_trials)%>%
  mutate(samples=map(.x=trials,~sample(100,10,replace=FALSE)))
sampling_without_replacement_simulation%>%head(10)
```
![upgit_20221129_1669740172.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740172.png)

4. Now compute the number of "reds", "greens" and "blues" in your sample using the `map_dbl()` and `mutate()` functions.

```r
sampling_without_replacement_simulation<-sampling_without_replacement_simulation%>%
  mutate(reds=map_dbl(.x=samples,~compute_num(.x,1,50)),
         blues=map_dbl(.x=samples,~compute_num(.x,51,80)),
         greens=map_dbl(.x=samples,~compute_num(.x,81,100)))
sampling_without_replacement_simulation%>%head(10)
```
![upgit_20221129_1669740205.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740205.png)

5. Compute the minimum of the three counts using the `pmin()` function. When this minimum is zero, then one of the three colours is missing. It is recommended that you look up the difference between `pmin()` and `min()` here;

```r
sample_head<-sampling_without_replacement_simulation%>%head(10)
pmin(sample_head$reds,sample_head$blues,sample_head$greens)
min(sample_head$reds,sample_head$blues,sample_head$greens)

```

```
[1] 2 2 1 2 0 2 1 0 2 0
[1] 0
```

```r
min_color<-pmin(sampling_without_replacement_simulation$reds,
                sampling_without_replacement_simulation$blues,
                sampling_without_replacement_simulation$greens)

```

6. Compute the proportion of rows for which the minimum number of the three counts is zero.

```r
## Estimated Probability
prob_zero<-sum(min_color==0)/number_trials
prob_zero
```

```
[1] 0.124
```

### 2.2 (Q2)

#### Description of Question

Let's derive a mathematical expression for the probability that we considered in (Q1): You can try and use "combinations" with $(_k^n)$ to compute the probability directly.

1.  First aim to compute the number of subsets of size 10 from 100 which either entirely miss out one of the subsets $Red=\{1,...,50\},Blues=\{51,...,80\},Greens=\{81,...,100\}$.

2.  Then compute the number of subsets of size 10 from 100 which miss out two of the subsets Red, Blues, Green.

3.  Be careful not to double count some of these subsets!

4.  Once you have computed all such subsets, combine them with the formula for the total number of subsets of size 10 from a set of 100, to compute the probability of missing a colour.

Once you have the mathematical expression for the probability, you can check how close the probability computed in (Q1) to the theoretical values.

#### Answers:

Let A is the event that one or more colours are missing from the selection.

$P(A)=\dfrac{\sum_{i=1}^{10}((_i^{Blues})\cdot(_{10-i}^{Greens})+(_{i}^{Greens})\cdot(_{10-i}^{Reds})+(_{i}^{Reds})\cdot(_{10-i}^{Blues}))}{(_{10}^{100})}$

#### Test:(Mine)

```r
num_sum<-function(){
  num<-0
  for (i in 1:10){
    num=num+(choose(30,i)*choose(20,10-i)+choose(20,i)*choose(50,10-i)+choose(50,i)*choose(30,10-i))
  }
  return(num)
}
#Theoretical Probability
PA<-num_sum()/choose(100,10)
PA
```

```
[1] 0.1180318
```

```r

## Simulative Probability
set.seed(0)
PS<-function(num_trials){
  sample_size<-10
  sampling_without_replacement_simulation<-data.frame(trials=1:number_trials)%>%
    mutate(samples=map(.x=trials,~sample(100,10,replace=FALSE)))
  sampling_without_replacement_simulation<-sampling_without_replacement_simulation%>%
    mutate(reds=map_dbl(.x=samples,~compute_num(.x,1,50)),
            blues=map_dbl(.x=samples,~compute_num(.x,51,80)),
            greens=map_dbl(.x=samples,~compute_num(.x,81,100)))
  min_color<-pmin(sampling_without_replacement_simulation$reds,
                  sampling_without_replacement_simulation$blues,
                  sampling_without_replacement_simulation$greens)
  prob_zero<-sum(min_color==0)/number_trials
  return(prob_zero)
}

PSline<-map_dbl(seq(10,10000,by=100),PS)
num_trial<-seq(10,10000,by=100)
Table<-data.frame(num_trial,PSline)
ggplot(data=Table,aes(x=num_trial,y=PSline))+
  geom_line()+
  xlab("Number of trials")+
  ylab("EstimateProbability")+
  geom_hline(aes(yintercept=PA),color="red",linetype="dashed")
```
![[../../../Attachments/Pasted image 20221129164516.png]]

#### Standard answer:
![upgit_20221129_1669740404.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740404.png)

![upgit_20221129_1669740440.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669740440.png)

```r
num1 <- choose(50,10) + choose(70,10) + choose(80,10) - choose(20,10) -choose(30,10) - choose(50,10)
num2 <- choose(100,10)
probs_A <- num1/num2
print(probs_A)
```

```
[1] 0.1180318
```

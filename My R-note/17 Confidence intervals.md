---
tags: R
Week: 7
type: lecture
Lecture: 17
---
> 置信区间

[Lecture17.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1668605467735-174a668b-6023-4e30-be0c-e8776bfb2226.pdf)
## Preface
### What can we infer from our sample statistics
Suppose we want to know the **average flipper length** $\mu$ for the population of **Adelie penguins.**
We collect a sample of size n = 151, and compute sample statistics
$$\text{Sample mean: }\bar X=190, \quad \text{Sample Variance: }s^2=42.8$$
Assuming that **the sample is i.i.d**. Gaussian random variables, we know that $X$ is a consistent，minimum variance unbiased，maximum likelihood estimate of $\mu$
However, it is rarely the case that $\bar X=\mu$

>[!question] **Question**
>Can we say with confidence that $\mu$ is within some specific range of possible values?

### This chapter's focus

Suppose that $X_1,...,X_n$ are i.i.d. random variables. We are interested in the population parameter $\theta \in \mathbb{R}$

>[!important] Goal
>Given the sample, we want to find a range of possible values for $\theta$ such that we can be certain that the true value of $\theta$ will fall in the given range with a probability of our choosing.

This range of estimates is **an alternative to** the estimates in the form of a single value (point estimates), e.g.,the sample mean, sample variance, MLE,...

## Confidence intervals

### Definition of confidence intervals

>[!info] Confidence intervals
>If we have sample statistics $L_n \equiv L_n(X_1,...,X_n)$ and $U_n \equiv U_n(X_1,...,X_n)$ satisfying
>$$\mathbb{P}[L_n(X_1,...,X_n)<\theta<U_n(X_1,...,X_n)]\geq \gamma$$

**Note that** $L_n$ and $U_n$ are **random variables** themselves and $\theta$ is a number，so we can discuss the **probability of the event** ${L_n(X_1,...,X_n)<\theta < U_n(X_1,...,X_n)}$.
$\gamma \in [0,1]$, and $\gamma$ is referred to as the **confidence level** of the confidence interval.

---


## Confidence intervals with Gaussian data

If we have sample statistics $L_n \equiv L_n(X_1,...,X_n)$ and $U_n \equiv U_n(X_1,...,X_n)$ satisfying $\mathbb{P}[L_n(X_1,...,X_n)<\theta<U_n(X_1,...,X_n)]\geq \gamma$, then we refer to $(L_n,U_n)$ as $\color{red} \gamma \times 100\% \text{-level}$ **confidence interval**.

Again, we model our sample $X_1,...,X_n$ with a **parametric model**, then based on the **parametric model** we find the $L_n$ and $U_n$.
> parametric model 参数模型


>[!tip]
>Let's consider one of the simplest cases where the sample is modelled as i.i.d. **Gaussian random variables**,
>$$X_1,...,X_n \sim \mathcal{N}(\mu,\sigma^2)$$
>Assume that we want to have **a confidence interval for** $\mu$.


1. To develop a **confidence interval** for $\mu$, we first construct a random variable.

$$T:=\dfrac{\bar X-\mu}{S/\sqrt{n}}$$

   - where $X$ is the **sample mean** and $S$ is the **sample standard deviation**.

2. The distribution of $T$ is described by the following result:
>[!info] Lemma
>Suppose that $X_1,...,X_n \sim \mathcal{N}(\mu,\sigma^2)$ are i.i.d. random variables. 
>Let
>$$\bar X := \dfrac{1}{n} \sum_{i=1}^{n} X_i$$ $$S^2:= \dfrac{1}{n-1}(X_i-\bar X)^2$$
>Let
>$$T:=\dfrac{\bar X-\mu}{S/\sqrt{n}}$$
>Then the random variables is $t\text{-distributed}$ with $n-1$ degree of freedom. ^de4328
  
   - The distribution of $T$ does not depend on $\mu$ and $\sigma$.

3. **Student's t distribution:**
	[[14 Continuous random variables and limit raws#Chi-squared distribution(卡方分布,卡方检验)|Chi-squared distribution]]
	[[14 Continuous random variables and limit raws#Student's t distribution|Student's t distribution]]

- Let the **[[12 Random variables#^d7d3d1|cumulative distribution]]** of $T$ be denoted by $F_k(t) := \mathbb{P}(T<t)$.
- Let the **[[14 Continuous random variables and limit raws#Definition of Quantile function|quantile function]]** be denoted by $(F_k)^{-1}:[0,1]\to \mathbb{R}$, then for any $\alpha \in [0,1]$, we have

$$\mathbb{P}(T<(F_k)^{-1}(\alpha))=\alpha$$

- Then t distribution is well understood, and the function $F_k$ and $(F_k)^{-1}$ can be computed easily by using $R$ programming , Python,...
#### Example

- Given $\alpha \in [0,1]$, compute a quantity $t_{\alpha /2,n-1}$, such that $\mathbb{P}(-t_{\alpha /2,n-1}<T< t_{\alpha /2,n-1})=1-\alpha$.
- Then by $T:=\dfrac{\bar X-\mu}{S/\sqrt{n}}$ we get $\mathbb{P}(\bar X - \dfrac{t_{\alpha /2,n-1}}{\sqrt{n}} \cdot S <\mu < \bar X+\dfrac{t_{\alpha/2,n-1}}{\sqrt{n}} \cdot S)=1-\alpha$.
- So, $\left(\bar X - \dfrac{t_{\alpha /2,n-1}}{\sqrt{n}} \cdot S,\bar X+\dfrac{t_{\alpha/2,n-1}}{\sqrt{n}} \cdot S\right)$ is a $(1-\alpha)\% \text{-level}$ confidence interval.
- How to **compute**  $t_{\alpha /2,n-1}$:
   - By **symmetric:**
$$\mathbb{P}(-t_{\alpha /2,n-1}<T< t_{\alpha /2,n-1})=1-\alpha \\ \Longleftrightarrow \mathbb{P}(T< t_{\alpha /2,n-1})=1-\dfrac{\alpha}{2}\\ \Longleftrightarrow t_{\alpha /2,n-1}:=(F_{n-1})^{-1}(1-\dfrac{\alpha}{2})$$

   - **By R programming:** #Rnote `qt()` -**quantile function**
```r
#compute t_{alpha/2,n-1}
alpha<-0.05
n<-80
t=qt(1-alpha/2,df=n-1) #quantile function for t distribution
t
```

```
[1] 1.99045
```

---

## How to check if a Gaussian model is reasonable

>[!question]
>Can we reasonably assume** our data** is generated by a **Gaussian model** $X_1,...,X_n \sim \mathcal{N}(\mu,\sigma^2)$ ? 

1. **First**, we can do a density plot and check if the data looks Gaussian...
```r
ggplot(data=filter(penguins,species=="Adelie"),
       aes(x=flipper_length_mm))+
  geom_density()+theme_bw()+
  xlab("Flipper length(mm)")
```
| Note | Results    |
| ---- | --- |
|Here, a Gaussian model seems reasonable:<br> -   The data looks unimodal(a single peak) <br> -   The data looks symmetric about its mean.       | ![[../../../Attachments/Pasted image 20221201202040.png]]    |

2. **The second check** that a Gaussian model is reasonable is a **quantile-quantile** plot.
The $\mathrm{QQ}\text{-plot}$ is a **plot** that compares the **quantiles** in the sample (y-axis) with **theoretical quantiles** from a Gaussian (x-axis), i.e., it is the plot of the points
$$(F^{-1}(q),F^{-1}_X(q))\: \text{for} \: q\in [0,1]$$

#Rnote `stat_qq()` , `stat_qq_line()`
```r
ggplot(data=filter(penguins,species=="Adelie"),
       aes(sample=flipper_length_mm))+
  theme_bw()+stat_qq()+stat_qq_line(color="blue")
```

|    If our QQ plot points lie close to a straight line?    |                          Diagram                          |
|:---------------------------------------------------------:|:---------------------------------------------------------:|
| If so then our assumption of Gaussian data is reasonable. | ![[../../../Attachments/Pasted image 20221201203011.png]] |

---

## Confidence intervals with non-Gaussian data
> In practice, our data is rarely exactly Gaussian
> However, when the sample size is large, we have the **central limit theorem**, which approximates **sample distribution** with Gaussian distributions:

![[14 Continuous random variables and limit raws#The central limit theorem|The central limit theorem]]
Therefore, for large $n$, the sample mean $\dfrac{1}{n} \sum_{i=1}^{n} X_i$ behaves like the Gaussian distribution $\mathcal{N}(\mu,\dfrac{\sigma^2}{n})$.
So one can derive (approximate) confidence intervals based on **this limiting behaviour**, for non-Gaussian data.

---

## Binomial proportion confidence interval
> 二项比例置信区间

Suppose our data sample is a binary sequence $(X_i)_{i=1}^{n}$ in $\{0,1\}^n$

>[!example] $\text{Examples}$
>1. $(X_i)_{i=1}^n$ represents a sequence of test results for a driving test.
>2. $(X_i)_{i=1}^n$ represents a sequence of outcomes for a new treatment.

We can model the sequence $(X_i)_{i=1}^n$ as an i.i.d. Bernoulli sequence $X_1,...,X_n \sim \mathcal{B}(q)$.
We would like to estimate a **confidence interval** for the **success probability** $q=\mathbb{E}(X_i)$.
The idea is to use the result of the **central limit theorem**.
**Recall that** : for large $n$, the sample mean $\dfrac{1}{n} \sum_{i=1}^{n} X_i$ behaves like the Gaussian distribution $\mathcal{N}(\mu,\dfrac{\sigma^2}{n})$.

>[!info] 
>By the central limit theorem, $\sqrt{\dfrac{n}{q(1-q)}}\cdot (\dfrac{1}{n}\sum_{i=1}^{n} X_i-q)$ approximates $\mathcal{N}(0,1)$
>$\Longrightarrow$ we have $\dfrac{1}{n} \sum_{i=1}^{n} X_i$ approximates $\mathcal{N}(q,\dfrac{q(1-q)}{n})$.
>One of the important methods for **binomial proportion confidence intervals**, called $\color{red}\text{Wilson's method}$, uses this approximation to create a confidence interval for $q$ based on $\dfrac{1}{n} \sum_{i=1}^{n} X_i$.

[[../Understanding Binomial Confidence Intervals - SigmaZone 1|Understanding Binomial Confidence intervals]]
We can use the `PropCIs` package to compute confidence intervals via $\text{Wilson's method}$
#Rnote `scoreci()`
```r
library(PropCIs)
```

```r
driving_test_results<-c(1,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,1,0)
mean(driving_test_results)
```

```
[1] 0.3333333
```

```r
alpha<-0.05
num_successes<-sum(driving_test_results)#total passes
sample_size<-length(driving_test_results) #sample size
scoreci(x=num_successes,n=sample_size,conf.level = 1-alpha)
```

**Results**

```
data:  

95 percent confidence interval:
 0.1797 0.5329
```


---

## A flexible method for confidence intervals

### The Bootstrap method

Suppose we are interested in a **complex statistic** other than the mean...
Or suppose our data deviates strongly from the assumption of a Gaussian or normal distribution
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668868969461-68b726d8-3557-4e92-8e87-8cae60b7fbf7.png#averageHue=%23fafafa&clientId=uf1c7302c-36d3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=217&id=TUqHk&margin=%5Bobject%20Object%5D&name=image.png&originHeight=434&originWidth=1146&originalType=binary&ratio=1&rotation=0&showTitle=false&size=95818&status=done&style=none&taskId=ua12cc35e-44fa-4228-a9d1-645bdf5e7ae&title=&width=573)

>[!question] 
>Can we compute confidence intervals?
>**Answer:** The bootstrap method

Suppose we have an i.i.d. sample $X_1,…,X_n \sim P$. We estimate a population parameter $\theta$ with a **sample statistic**  $\hat\theta=g(X_1,...,X_n)$.
To quantify our uncertainty we wish to understand the distribution of $\hat \theta-\theta$

| **Motivation**                                                                                                                                                                                                                                                                                                                                                                                                                                                          | **The idea of Bootstrap**                                                                                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Consider a special case where $X_1,…,X_n \sim \mathcal{N}(\mu,1)$. Let $\theta := \mu$ and $\hat \theta := \bar X$.<br> To compute the confidence interval for $\mu$ we start from the distribution of $\hat \theta -\theta=\bar X -\mu \sim \mathcal{N}(0,\dfrac{1}{n})$. <br> Then a confidence interval can be obtained from $P\left(-\sqrt{\dfrac{1}{n}}z_{\alpha/2}<\bar X-\mu < \sqrt{\dfrac{1}{n}}z_{\alpha/2}\right)=1-\alpha$ for some quantity $z_{\alpha /2}$ | We do not have direct access to the distribution of $\hat \theta-\theta$ or the samples of $\hat \theta-\theta$.<br> However, we can try to generate samples to approximate the distribution of $\hat \theta-\theta$ |

#### Main steps

> Suppose we have an i.i.d. sample $X_1,…,X_n \sim P$. We estimate a population parameter $\theta$ with a **sample statistic** $\hat\theta=g(X_1,...,X_n)$.
> The main steps of the Bootstrap method for confidence intervals are as fellow:

<font color=#c10b26>Step1</font> We consider an **empirical distribution** $\hat P_n$ which approximates $P$ as follows:
- $P_n$ is the discrete distribution which assigns probability $\dfrac{1}{n}$ to each of $X_1,…,X_n$.
- So, Sampling from $\hat P_n$ is equivalent to randomly sampling from $X_1,...,X_n$ with replacement.
- So, in **Bootstrap**, we "view" $\{X_1,...,X_n\}$ as our population, and we generate subsamples from this population.

<font color=#c10b26>Step2</font> We generate multiple samples from $\hat P_n$, and compute the associate sample statistics $\tilde \theta_1,…,\tilde \theta_B$.
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668856079835-98627a24-f644-4721-a8ee-d7cefc8fd71c.png#averageHue=%23f6f6f6&clientId=uf1c7302c-36d3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=99&id=ub4f51445&margin=%5Bobject%20Object%5D&name=image.png&originHeight=198&originWidth=816&originalType=binary&ratio=1&rotation=0&showTitle=false&size=42851&status=done&style=none&taskId=u457cd5d6-2656-452a-a219-51cf5b1e838&title=&width=408)
Then we view $\{\tilde \theta_1,…,\tilde \theta_B\}$ as an approximate to the distribution of $\hat \theta$.
We argue that the behaviour of $\hat \theta-\theta$ is approximately the same as the behaviour of $\hat \theta-\theta$ where $\theta$ is the random variable that represents $\tilde \theta_1,…,\tilde \theta_B$.

<font color=#c10b26>Step3</font> We then compute a confidence interval from the distribution of $\tilde \theta - \hat \theta$, which is an approximation to $\hat \theta -\theta$.

>[!tip] Process 
>Suppose we want to compute $(1-\alpha) \times 100 \% \text{-level}$ confidence intervals for the parameter $\theta$.
>Let $\delta_{\alpha/2}$ denote the $\dfrac{\alpha}{2}$ quantile for $\{\tilde \theta_1 - \hat \theta,...,\tilde \theta_B - \hat \theta\}$.
>Similar, let $\delta_{1-\alpha/2}$ be the $1-\dfrac{\alpha}{2}$ quantile. So when $B$ is large.
>$$\mathbb{P}(\tilde \theta -\hat \theta <\delta_{\alpha/2}) \approx \dfrac{\alpha}{2},\quad and \quad \mathbb{P}(\tilde \theta-\hat \theta < \delta_{1-\alpha/2})\approx 1-\dfrac{\alpha}{2}$$
>![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668856777314-561b8ea1-1044-4616-b7ab-c16afe930687.png#averageHue=%23f6f6f6&clientId=uf1c7302c-36d3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=124&id=u8fc9c261&margin=%5Bobject%20Object%5D&name=image.png&originHeight=248&originWidth=1310&originalType=binary&ratio=1&rotation=0&showTitle=false&size=97637&status=done&style=none&taskId=ucba1cd9c-c918-482b-a053-b97ee9a0b26&title=&width=655)

>[!tip]
>So the empirical Bootstrap level confidence interval: $\color{red}[\hat \theta -\delta_{1-\alpha/ 2},\hat \theta -\delta_{\alpha/2}]$

**Remarks**:
- Note in each of the steps we do not assume a specific probabilistic model for $P$.
- Empirical Bootstrap method gives approximate confidence intervals under general conditions.

#### Example

>[!example]
>Suppose that we want to compute **a 99% level confidence interval** for the median for the duration of eruptions(in mins) for the volcano data set.

In **R**, bootstrap confidence intervals can be compute by using the `boot` package.

```r
library(boot) #load the library

set.seed(123) #set random seed
geyser=faithful #the volcano data set

#1. define a function which computes the median of a column of interest
compute_median<-function(df,indicies,col_name){
  sub_sample<-slice(df,indicies)%>% pull(all_of(col_name)) #extract subsample
  return(median(sub_sample,na.rm=TRUE)) #reutrn median
}

#2. use the boot function to generate the bootstrap statistics
results<-boot(data=geyser,statistic=compute_median,col_name="eruptions",R=10000)

#3. compute the 99% confidence interval for the median
boot.ci(boot.out = results,type="basic",conf=0.99)
```

```
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 10000 bootstrap replicates

CALL : 
boot.ci(boot.out = results, conf = 0.99, type = "basic")

Intervals : 
Level      Basic         
99%   ( 3.85,  4.25 )  
Calculations and Intervals on Original Scale
```

### Bootstrap VS parametric confidence intervals

The **Bootstrap** method has several <font color=#6fc10b><b>advantages</b></font> over **parametric methods**: 
- Non-parametric i.e. does not require strong distributional assumptions e.g. Gaussian data.
- Applies to any statistical estimator e.g. median, trimmed mean etc

The **Bootstrap method** also some has <font color=#c10b26><b>drawbacks</b></font> relative to **parametric methods**: 
- Computationally expensive - less of a concern with modern hardware.
- Parametric methods typically outperform the Bootstrap methods when the assumptions hold



---

## General guidelines for confidence intervals

Always check **the assumptions of whatever confidence intervals** you’re using:
- If you are interested in the **population mean** and your data is approximately **Gaussian:**
   - A good option is the Student t confidence intervals.
   - **Remark**: The larger the sample size the less concerned you need to be about departures from **Gaussianity**! (because of the **central limit theorem**)
- If you are interested in the **population mean** and your data is approximately **Bernoulli:**
   -  A good option is **Wilson’s score interval**
- If your data is **highly non-Gaussian** or you are interested in **another statistic either**:
   - Use a bespoke confidence interval for a specific setting but always check assumptions, or
   - Use the **Bootstrap** method!


---
tags: R
Week: 8
type: lecture
lecture: 20
---
## The chapter's focus
1. The idea of hypothesis testing for two <font color=#c10b26>unpaired samples</font> .(The elements of the first sample are not paired with the elements of the second sample)
2. <font color=#c10b26>Student's t-test</font> for comparing ==population means== in unpaired samples
3. We will discuss <font color=#c10b26>Welch's t-test</font> which is more robust to differences in ==population variances==.

---

## Unpaired data
1. **What is unpaired data**: 
	1. Suppose that we have two samples $X_1,\cdots,X_n$ (which are i.i.d. copies of $X$) and $Y_1,\cdots,Y_k$ (which are i.i.d. copies of $Y$) where $n$ may not be equal to $k$.
	2. **Unpaired data**: $X_i$ is not paired with a $Y_j$.
2. **Goal**:
	1. We want to <font color=#c10b26>compare the distribution</font> of $X$ with the distribution of $Y$. For example, we are interested in the **difference** between their **population means**.
	2. <font color=#c10b26>Two-sample hypothesis testing</font> for unpaired data.

### Example

>[!example]
>Comparing **Adelie** & **Chinstrap** penguins
>Suppose a biologist is investigating the morphological features of different types of penguins.
>>morphological (形态学的)
>
>**Question:** Is there a <font color=#c10b26>difference</font> between <font color=#c10b26>the average flipper lengths</font> of **Adelie** & **Chinstrap** penguins?
>1. Draw a random sample of ==Adelie penguins== and measure their **flipper lengths** $X_1,\cdots,X_n$.
>2. Draw a random sample of ==Chinstrap penguins== and measure their **flipper lengths** $Y_1,\cdots,Y_k$. ($n$ and $k$ can be different)
>
>**Unpaired data:** an **Adelie penguin** is not paired with **a Chinstrap penguin**.

#### Statistical hypothesis testing for unpaired data

**Problem formulation:**
1. Suppose that we have two samples $X_1,\cdots,X_n$ and $Y_1,\cdots,Y_k$.
2. Additionally, assume that $X_1,\cdots,X_n \sim \mathcal{N}(\mu_1,\sigma_{1}^2)$ are **i.i.d.** and $Y_1,\cdots, Y_k \sim \mathcal{N}(\mu_{2},\sigma_{2}^2)$ are **i.i.d.** 
3. We want to study the <font color=#c10b26>difference</font> $\mu_1-\mu_2$.

**Solutions:**
- Case1: $\sigma_1=\sigma_2$. We can use <font color=#c10b26>Student's t-test</font>.
- Case2: $\sigma_1\neq \sigma_2$. We can use <font color=#c10b26>Welch's t-test</font>.
![[../../../Attachments/Pasted image 20221209105309.png]]
## Student's t-test for unpaired data

>[!example]- 
>![[20 Statistical hypothesis testing for unpaired data#Example|Example]]

**Prerequisites for using Student's t-test**: 
1. $X_1,\cdots,X_n \sim \mathcal{N}(\mu_1,\sigma_{1}^2)$ are **i.i.d.** and $Y_1,\cdots, Y_k \sim \mathcal{N}(\mu_{2},\sigma_{2}^2)$ are **i.i.d.**
2. $\sigma_1=\sigma_2$

### Statistical hypothesis testing: key stages
![[18 One sample statistical hypothesis testing#Statistical hypothesis testing: key stages|Statistical hypothesis testing]] 


#### Unpaired Student's t-test step by step
1. Form <font color=#c10b26>null and alternative hypothesis</font>
	1. **Null hypothesis**: $H_0:\mu_1=\mu_2$
	2. **Alternative hypothesis**: $H_1:\mu_1 \neq \mu_2$
2. Validate modelling assumptions
	
	```r
	library(palmerpenguins)
	peng<-penguins%>%filter(species=="Adelie"|species=="Chinstrap")%>%select(species,flipper_length_mm)
	ggplot()+geom_density(data=peng,aes(x=flipper_length_mm,color=species))+theme_bw()+xlab("flipper lengths")+ylab("density")
	peng%>%ggplot(aes(sample=flipper_length_mm))+stat_qq()+stat_qq_line(color="blue")+theme_bw()+facet_wrap(~species)+xlab("theoretical")+ylab("sample")
	```
	
	| Density                                                   | Quantile-Quantile                                         |
	| --------------------------------------------------------- | --------------------------------------------------------- |
	| ![[../../../Attachments/Pasted image 20221209120617.png]]| ![[../../../Attachments/Pasted image 20221209120630.png]]|
	
	
	The distributions for both samples are approximately Gaussian.
	We have $n = 151$ and $k = 68$. Hence, by [[14 Continuous random variables and limit raws#The central limit theorem|the central limit theorem]], the sample means will be approximately Gaussian.
3. Select a [[18 One sample statistical hypothesis testing#Significance level|significance level]]
	choose a significance level $\alpha=0.05$
4. Select an appropriate statistical test
	- For $X_1,\cdots,X_n$, let the sample mean and variance be defined as $\bar X=\dfrac{1}{n}\sum _{i=1}^{n} X_i$ and $S_{X}^2:= \dfrac{1}{n-1}\sum_{i=1}^n(X_i-\bar X)^2$ , respectively.
	- Similarly, for $Y_1,\cdots,Y_k$, we can define the sample mean $Y$ and sample variance $S_{Y}^2$.
	- <font color=#c10b26>Student's t-test statistic</font>:
		$$\hat T := \dfrac{\bar X-\bar Y}{S_{X,Y}\sqrt{\dfrac{1}{n}+\dfrac{1}{k}}} \text{ where } S_{X,Y}^2=\dfrac{(n-1)S_X^2+(k-1)S_Y^2}{n+k-2}$$
		Assume that $\mu_1=\mu_2$.
		Then $\hat T$ is t-distributed with $n+k-2$ degrees of freedom.
		
5. Numerical value of the test statistics
	**Data:** 
	```r
	peng%>%head(10)
	```
	
	![upgit_20221209_1670588882.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670588882.png)
	Compute the numerical value $\tau$ of $\hat T$:
	```r
	mean_X<-peng%>%filter(species=="Adelie")%>%pull(flipper_length_mm)%>%mean(na.rm=TRUE) #the mean of X
	mean_Y<-peng%>%filter(species=="Chinstrap")%>%pull(flipper_length_mm)%>%mean(na.rm=TRUE) # the mean of Y
	sd_X<-peng%>%filter(species=="Adelie")%>%pull(flipper_length_mm)%>%sd(na.rm=TRUE) # sd of X
	sd_Y<-peng%>%filter(species=="Chinstrap")%>%pull(flipper_length_mm)%>%sd(na.rm=TRUE) #sd of Y
	n<-length(peng%>%filter(species=="Adelie")%>%pull(flipper_length_mm)%>%na.omit()) #n.omit: strip the null numbers
	k<-peng%>%filter(species=="Chinstrap")%>%nrow()
	
	s_xy<-sqrt(((n-1)*sd_X^2+(k-1)*sd_Y^2)/(n+k-2)) 
	
	t_statistic<-(mean_X-mean_Y)/(s_xy*sqrt(1/n+1/k))
	t_statistic
	```
	Results:
	```
	[1] -5.974041
	```
	
6. Compute [[18 One sample statistical hypothesis testing#Definition of the p-value|p-value]] based on the test statistic.
	$$p:=\mathbb{P}(|\hat T|>|\tau| \vert H_0)=2\cdot(1-F_{n+k-2}(|\tau|))$$
	```r
	p_value<-2*(1-pt(abs(t_statistic),df=n+k-2))
	p_value
	```
	P-value:
	```
	[1] 9.378738e-09
	```
	
7. Draw conclusions
	The p-value is below the significance level of $\alpha$. So we reject the null hypothesis $H_0$.

#### Unpaired Student's t-test with R
#Rnote with `t.test()` function we obtained the same $\text{p-value}$ as before.

```r
t.test(flipper_length_mm~species,data=peng,var.equal=TRUE)
```

Results:
```
Two Sample t-test

data:  flipper_length_mm by species
t = -5.974, df = 217, p-value = 9.379e-09
alternative hypothesis: true difference in means between group Adelie and group Chinstrap is not equal to 0
95 percent confidence interval:
 -7.806481 -3.933293
sample estimates:
   mean in group Adelie mean in group Chinstrap 
               189.9536                195.8235
```

## Welch's t-test unpaired data

>[!example]- 
>![[20 Statistical hypothesis testing for unpaired data#Example|Example]]


**Prerequisites for using Student's t-test**: 
1. $X_1,\cdots,X_n \sim \mathcal{N}(\mu_1,\sigma_{1}^2)$ are **i.i.d.** and $Y_1,\cdots, Y_k \sim \mathcal{N}(\mu_{2},\sigma_{2}^2)$ are **i.i.d.**
2. $\sigma_1 \neq \sigma_2$

The **main difference** between <font color=#c10b26>Student's t-test</font> and <font color=#c10b26>Welch's t-test</font>: <u>test statistic</u>
#### Welch's test statistic:
$$\hat T_W:=\dfrac{\bar X-\bar Y}{\sqrt{\dfrac{S_X^2}{n}+\dfrac{S_Y^2}{k}}}$$
where $\bar X$ and $\bar Y$ are sample means, and $S_X^2$ and $S_Y^2$ are sample variances.
Under the null hypothesis $H_0: \mu_1 = \mu_2$, Welch’s t-statistic is approximately t-distributed with $m$ degrees of freedom. 
Here, $m=\dfrac{(\dfrac{S_X^2}{n}+\dfrac{S_Y^2}{k})}{\dfrac{(S_X^2/n)^2}{n-1}+\dfrac{(S_Y^2/k)^2}{k-1}}$

#### Welch's test in R

>[!note] 
>- Welch's t-test is robust to **differences in population variances** between the two distributions.
>- Hence <font color=#c10b26>Welch's t-test</font> is the preferred option and the default for testing differences in means in R.


```r
t.test(flipper_length_mm~species,data=peng)
```

Results:

```
Welch Two Sample t-test

data:  flipper_length_mm by species
t = -5.7804, df = 119.68, p-value = 6.049e-08
alternative hypothesis: true difference in means between group Adelie and group Chinstrap is not equal to 0
95 percent confidence interval:
 -7.880530 -3.859244
sample estimates:
   mean in group Adelie mean in group Chinstrap 
               189.9536                195.8235
```

We record a p-value of 6.049e-08 which is below the significance level of 0.05.
So, we reject $H_0$

## Comparing paired and unpaired t-tests

Case 1: If our data is **unpaired** we must use **an unpaired statistical hypothesis test**.
Case 2: If our data is **paired** we should use **a paired statistical hypothesis test**.
Given paired data, we could just ignore the pairing and apply the standard unpaired t-test, but this is a bad idea!

>[!tip]
>The unpaired t-test:
>$$\hat T_W:=\dfrac{\bar X-\bar Y}{\sqrt{\dfrac{S_X^2}{n}+\dfrac{S_Y^2}{k}}} \text{ where } S_X^2 \text{ and } S_Y^2 \text{ are sample variances}$$
>The paired t-test:
>$$\hat T:=\dfrac{\bar D -\mu}{S/ \sqrt{n}} \text{ where } S_D^2 \text{ is the variance of differences } X_1-Y_1,\cdots, X_n-Y_n $$

The variance of the differences $S_D^2$, is often <font color=#c10b26>much smaller</font> than the <font color=#c10b26>variance of the whole samples</font> $S_X^2$ and $S_Y^2$.
Hence, the paired t-statistic is **often larger**. This means <font color=#c10b26>greater power</font> for the same significance level.

## Effect size

![[19 Statistical hypothesis testing with paired data#Reporting experimental results and effect size]]

#### Effect size
We can quantify the <font color=#c10b26>effect size</font> via <font color=#c10b26>Cohen's d</font> for **unpaired data**:
$$d:= \dfrac{\bar X-\bar Y}{S_{X,Y}} \text{ where } S_{X,Y}^2=\dfrac{(n-1)S_X^2+(k-1)S_Y^2}{n+k-2}$$

```r
effect_size<-(mean_X-mean_Y)/s_xy
effect_size
```

Results

```
[1] -0.8724636
```

---
#### Another common misunderstanding

Suppose that we carry out a statistical hypothesis test.
We start by fixing a significance level. We then compute our test statistic and derive our p-value.
If our p-value is above the significance level we cannot reject the null hypothesis.
**The following statement is incorrect:**
"We do not reject the null hypothesis, so we have good evidence for it"

This simply means we don't have enough evidence to reject the null hypothesis in favour of the alternative.
For example, we will often have a p-value above the significance level when we have little data, even when the alternative hypothesis is true.
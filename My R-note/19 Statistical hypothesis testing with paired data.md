---
tags: R
Week: 8
type: lecture
lecture: 19
---

## The chapter's focus
1. introduce the concepts of statistical hypothesis testing for differences between paired samples
2. introduce the paired t-test for testing for differences in the value of ==population mean==
3. The paired t-test applies when either **differences are approximately Gaussian** or **the sample size is large.**
4. consider the concept of <font color=#c10b26>effect size</font> for **assessing the magnitude of difference.**
---

Our discussion on hypothesis testing so far focuses on only **one sample**.
For example, given a sample (represented by $X_i,\cdots,X_n$ which are i.i.d. copies of $X$), we want to check if <font color=#c10b26>a hypothesis</font> on <font color=#c10b26>a population parameter</font> of <font color=#c10b26>interest</font> is <font color=#c10b26>reasonable</font>.
But sometimes we might need to <font color=#c10b26>compare several variables (samples)</font>
We will consider the setting of two samples (that might be drawn from ==two different populations==). In particular, we are interested in using hypothesis testing to study ==the difference between two samples.==

---
## Hypothesis testing with paired data

>[!question] 
>Suppose that we have data in the form of
>$$(X_1,Y_1),(X_2,Y_2),\cdots ,(X_n,Y_n).$$
>More specifically, we have sample one $\{X_1,\cdots, X_n\}$ and sample two $\{Y_1,\cdots,Y_n\}$, each element $X_i$ in sample one is paired with an element $Y_i$ in sample two.
>We want to study the difference between the two samples, i.e.，
><font color=#c10b26>$$D_i := X_i-Y_i, \quad i=1,\cdots,n.$$</font>

### Examples: Comparing two samples
Consider the following example scenarios:
1. A farmer wants to know if applying different types of soil treatment will modify their crop yield.
2. A **veterinarian(兽医)** wants to know if the <font color=#c10b26>weight</font> of mice will change following a particular treatment.
3. A pharmaceutical company wants to know if treatment for a medical condition is effective.
In each of these cases, we want to compare and contrast a variable under two conditions (before and after treatment).
Sample one $\{X_1,\cdots,X_n\}$ is obtained ==before the soil treatment==, Sample two $\{Y_1,\cdots,Y_n\}$ is obtained ==after the treatment==.
We want to study the difference between the two samples $D_i:=X_i-Y_i$.
This leads to the topic of two sample hypothesis testing.

We view $\{D_1,\cdots,D_n\}$ as **a new sample** with **population parameter** of interest $\theta$.
Hypothesis testing on $\theta$.

## Paired sample t-test
1. Problem formulation:
	Suppose that we have data in the form of $(X_1,Y_1),(X_2,Y_2),\cdots, (X_n,Y_n)$.
	We want to study the difference between the two samples, i.e., $D_i:=X_i-Y_i$.
	Additionally, we model **the difference** as **i.i.d. draws** from a ==Gaussian== $D_1,\cdots,D_n \sim \mathcal{N}(\mu,\sigma^2)$
	**Null hypothesis** $H_0: \mu=0$, and **alternative hypothesis** $H_1:\mu \neq 0$.
2. Solution:
	The **canonical** procedure for this setting is the <font color=#c10b26>paired t-test</font>.
	**Main idea**: apply <font color=#c10b26>one sample t-test</font> to $\{D_1,\cdots,D_n\}$. ^wzdt8t

### Example: The effect of soil treatment on yield

>[!example] 
>Suppose a farmer wants to know if the <font color=#c10b26>yields of his wheat fields</font> will change following **soil treatment**.
>The farmer has a collection of $n = 15$ fields.
>An experiment takes place over two years. Each of the fields is treated in one of the two years and untreated in another.
>
>Let $X_1,\cdots,X_n$, be the number of bushels for fields when treated and $Y_1,\cdots,Y_n$ when untreated
>Note that the data is paired：$(X_1,Y_1)\cdots,(X_n,Y_n)$, where $X_i$ and $Y_i$ denotes yields with and without treatment for the same field.
>The question is about the difference $Y_i-X_i$，we will do hypothesis testing.

![[18 One sample statistical hypothesis testing#Statistical hypothesis testing: key stages]]

#### Paired t-test step by step
1. Form our **statistical hypothesis** including a null hypothesis and an alternative hypothesis.
	**Paired data**: $(X_1,Y_1),\cdots,(X_n,Y_n)$ where $X_i$ denotes yields with and without treatment for the same yield.
	**Goals**: study the difference between $X_i$ and $Y_i$ .i.e., $D_i:= Y_i-X_i$
	**Model the difference as** i.i.d. draws from a Gaussian $D_1,\cdots,D_n \sim \mathcal{N}(\mu,\sigma^2)$
	**two hypotheses:**  ^k23iq7
	1. Null hypothesis $H_0: \mu=0$
	2. Alternative hypothesis: $H_1:\mu\neq 0$
2. Apply model checking to validate any **modelling assumptions**.
```r
wheat_df
```

![upgit_20221208_1670511010.png|300](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670511010.png)

```r
wheat_df<-wheat_df%>%mutate(diff=treated-untreated)
```

![upgit_20221208_1670511050.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670511050.png)
![upgit_20221208_1670511263.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670511263.png)
>[!note] 
	>Note that this does not require that $X_1,\cdots,X_n$ and $Y_1,\cdots,Y_n$ are <font color=#c10b26>Gaussian</font>.
	>It's just required that the difference $D_i$ is Gaussian.

3. Choose our desired **significance level**.
	We choose <font color=#c10b26>a significance level of</font> $\alpha=0.05$ .(**Important**)
4. Select an **appropriate statistical test**
	![[Data Science/R_Projects/My R-note/19 Statistical hypothesis testing with paired data#^wzdt8t|Solution]]
	==**Define test statistic:**== [[14 Continuous random variables and limit raws#Student's t distribution|Student's t distribution]]
	$$\hat T:=\dfrac{\bar D -\mu}{S/ \sqrt{n}}=\dfrac{\bar D-0}{S/\sqrt{n}} \text{ where } \bar D=\dfrac{1}{n} \sum_{i=1}^n D_i \: \text{and } S^2=\dfrac{1}{n-1} \sum_{i=1}^n(D_i-\bar D)^2$$
	Under the null hypothesis $H_0$, $\hat T$ is t-distributed with $n-1$ degrees of freedom.
5. Compute <font color=#c10b26>the numerical value of the test statistic</font> from the data
	Based ==on the samples== $\tau$ ,we compute the numerical value of test statistic.
	```r
	diffs<-wheat_df%>%pull(diff)
	n<-length(diffs) #sample size
	y_bar<-mean(diffs) #sample mean
	s<-sd(diffs) #sample standard deviation
	test_statistic<-y_bar/(s/sqrt(n)) #test statistic 
	```
	![upgit_20221208_1670517213.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670517213.png)
6. Compute a [[18 One sample statistical hypothesis testing#Definition of the p-value|p-value]] based on the test statistic. #fleeting 
	Under null $H_0$ , if $\text{p-value} >\alpha$ , we should accept the $H_0$.
	if $\text{p-value}< \alpha$ , we should reject $H_0$ and accept $H_1$.
	if $\text{p-value}== \alpha$ ,we should increases the number of samples.
	```r
	test_statistic
	```
	![upgit_20221208_1670517213.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670517213.png)

	```r
	p_value<-2*(1-pt(abs(test_statistic),df=n-1)) #p value
	```
	![upgit_20221208_1670519454.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670519454.png)

7.  Draw conclusions based on the relationship between the p-value and the significance level $\alpha$ .
	The p-value is 0.0183 which is below the significance level of $\alpha$. So we reject the null hypothesis and conclude that the alternative hypothesis $H_1$ holds.

>[!note] About p-value
>People often make the following mistake:
>“The p-value is the probability that the null hypothesis is true.”
>This is incorrect!
>1. We considered the population parameter $\theta$ as numbers rather than random variables (hence we can not say something like the "probability of $\theta=0$ ")
>2. What is random is the sample and the test statistics computed based on the sample.
>3. The p-value is the probability that the test statistic takes a value as extreme or more extreme than the observed value, under the condition that the null hypothesis is true.
>4. In another word, the <font color=#c10b26>p-value</font> reflects the probability of “<font color=#c10b26>observing the given sample or the samples that have more extreme values of test statistics</font>” <u>if our null hypothesis is true.</u>
>5. 用中文讲： $\alpha$ 为 $\text{Type 1 error}$ 出现的概率，我们希望其风险小于$\alpha$， p-value 为拒绝原假设时出现 $\text{Type 1 error}$ 的概率，大于$\alpha$ 时我们认为如果拒绝原假设则容易出错，所以接受原假设。
>6. [About hypothesis testing](https://www.jianshu.com/p/aca87a78e134?ivk_sa=1024320u)


![[../../../Attachments/Pasted image 20221209003821.png]]
#### Paired t-test using R
We can efficiently carry out the paired t-test in R as follows.

```r
t.test(x=wheat_df$treated,y=wheat_df$untreated,paired=TRUE)
```

![upgit_20221208_1670519881.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221208_1670519881.png)

#### Experimental design
1. For the example above, we are justified in rejecting the null $\mu=0$ and concluding that $\mu>0$ provided our assumption that $D_1,\cdots,D_n \sim \mathcal{N}(\mu,\sigma^2)$ (Independent holds)
2. We can't conclude that the treatment causes a difference even if we reject the null hypothesis $\mu=0$
	**Reasons:**
	1. The independence assumptions is often violated in practice
		1. imagine a crop disease across the fields.
	2. If all fields are treated in one year and untreated in another there could be another causal factor e.g.weather.
3. We hope to design our experiment such that it reflects <font color=#c10b26>causal relationships</font> between crop yield and the treatment——We can use **randomised allocation** (随机分配). 

## Effect size

>[!note] 
>Statistical significance doesn't tell us about magnitude of difference

#### Example
Example: $X_1,\cdots, X_n \sim \mathcal{N}(10,1)$ and $Y_1,\cdots,Y_n \sim \mathcal{N}(10.05,1)$. The difference between the population mean is small (=0.05).
#Rnote `case_when()` : allows you to vectorise multiple [if_else()](http://127.0.0.1:56860/help/library/dplyr/help/if_else) statements. 
```r
mu_0<-10
mu_1<-10.05
sigma<-1

data.frame(x=seq(mu_0-3*sigma,mu_0+3*sigma,0.001))%>%
mutate(density_0=map_dbl(.x=x))](<mu_0%3C-10
mu_1<-10.05
sigma<-1

data.frame(x=seq(mu_0-3*sigma,mu_0+3*sigma,0.001))%%3E%
  mutate(density_0=map_dbl(.x=x,.f=~dnorm(.x,mu_0,sigma)))%>%
  mutate(density_1=map_dbl(.x=x,.f=~dnorm(.x,mu_1,sigma)))%>%
  pivot_longer(c(density_0,density_1),names_to = "Distribution",values_to="Density")%>%
  mutate(Distribution=case_when(Distribution=="density_0"~"0",
                                Distribution=="density_1"~"1"))%>%
  ggplot(aes(x=x,y=Density,color=Distribution,
             linetype=Distribution))+geom_line()+theme_bw()>)
```
![[../../../Attachments/Pasted image 20221208230421.png]]
- So, the difference between the two distribution is small (or negligible).
- However, a small difference can be detected by our hypothesis testing.

Study the behaviour of $\text{p-value}$ when we increase the sample size (e.g.,100,1100...,29100)

```r
num_trials_per_sample_size<-100
min_sample_size<-100
sample_size_inc<-1000
max_sample_size<-30000

set.seed(0)
crossing(trial=seq(num_trials_per_sample_size),sample_size=seq(min_sample_size,max_sample_size,sample_size_inc))%>%
  mutate(sample_0=pmap(.l=list(trial,sample_size),.f=~rnorm(n=..2,mean=mu_0,sd=sigma)))%>%
  mutate(sample_1=pmap(.l=list(trial,sample_size),
                       .f=~rnorm(n=..2,mean=mu_1,sd=sigma)))%>%
  mutate(p_value=pmap_dbl(.l=list(sample_0,sample_1),
                          .f=~(t.test(..1,..2,paired=TRUE)$p.value)))%>%
  group_by(sample_size)%>%
  ggplot()+geom_smooth(aes(x=sample_size,y=p_value))+theme_bw()+
  xlab("Sample size")+ylab("P value")+
  geom_hline(aes(yintercept=0.05),linetype="dashed",color="red")
```
![[../../../Attachments/Pasted image 20221208234345.png]]
For large sample sizes, the p-value is consistently less than the significance level, even if <font color=#c10b26>the difference between two distributions is small</font>.
Therefore, <font color=#c10b26>statistical significance</font> is not the same as <font color=#c10b26>a meaningful difference between distributions</font>.

---
>[!note] 
>In the hypothesis testing, we care about if $\mu=0$ or not, but not the size of $\mu$.
>Given enough data (large sample size), extremely small differences between populations can yield ==large test statistics== and ==small p-values==, and hence ==statistically significant==.
>A treatment may cause a statistically significant change, but is this change large enough to be important?
>Moreover, the statistical significance depends on the **sample size**, but the <font color=#c10b26>population difference</font> (that we are interested in) does not.
>Apart from knowing that the difference is <font color=#c10b26>statistically significant</font>, we may want to ==quantify the size of the difference==.

---




### Effect size

>[!info] Effect size
>The effect size is <font color=#c10b26>a measure</font> for quantifying the magnitude of the observed phenomena.
>**For example**, in the crop yield example, the effect size is the magnitude of the **difference** between **crop yields** <font color=#c10b26>with</font> and <font color=#c10b26>without</font> soil treatment.
>For <font color=#c10b26>paired t-tests</font>, we use <font color=#c10b26>Cohen's d statistic</font> to quantify effect size.

#### Example
![[Data Science/R_Projects/My R-note/19 Statistical hypothesis testing with paired data#^k23iq7|Example]]
We can quantify the <font color=#c10b26>effect size</font> via <font color=#c10b26>Cohen's d</font> for paired data:
$$d_{\text{paired}}:= \dfrac{\bar D}{S} \text{ where } \bar D=\dfrac{1}{n} \sum_{i=1}^n D_i \: \text{and } S^2=\dfrac{1}{n-1} \sum_{i=1}^n(D_i-\bar D)^2$$
In comparison, the p-value is computed based on the <font color=#c10b26>test statistic</font> given by $\hat T:= \dfrac{\bar D}{S/ \sqrt{n}}$.

```r
y_bar<-mean(diffs) #sample mean
s<-sd(diffs) #sample standard deviation
effect_size<-y_bar/s #effect size
```

![upgit_20221209_1670544816.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670544816.png)
This quantity(measuring the magnitude of difference) is of interest when the null hypothesis has been rejected.

>[!important]
>A value of 0.2 represent a <font color=#c10b26>small effect</font>; A value of 0.5 represent a <font color=#c10b26>medium effect</font>; A value of 0.8 represent a <font color=#c10b26>large effect</font>;
- For the crop yield experiment, we have a ==moderate effect==

>[!note] Comparing effect size with test size
>Effect size is very different from the test size.
>1. The [[18 One sample statistical hypothesis testing#^3a9ff2|test size]] is the probability of $\text{Type I error}$ under the null hypothesis
>2. The <font color=#c10b26>effect size</font> is a measure for <font color=#c10b26>quantifying the magnitude</font> of the observed phenomena.

### Reporting experimental results and effect size
When reporting Our results we should include:
1) Our motivating <font color=#c10b26>research question</font>.
2) A corresponding <font color=#c10b26>statistical question</font> framed in terms of a <font color=#c10b26>statistical model</font>.
3) The <font color=#c10b26>hypothesis test</font> and its motivation.
4) The numerical value of the <font color=#c10b26>test statistic</font>.
5) The <font color=#c10b26>p-value</font> (computed based on the value of the test statistic).
6) The <font color=#c10b26>effect size</font> (this is interesting if we rejected the null and established an effect).

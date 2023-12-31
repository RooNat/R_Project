---
tags: R
Week: 6
type: lecture
Lecture: 15
---
[Lecture15.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1667989332404-c1a76625-305d-4246-b13a-91153d67ca18.pdf)
## Relevant concepts

>[!important]- Relevant concepts
>[[07 Exploratory data analysis#Sample vs. population|Sample and populations]]
>[[07 Exploratory data analysis#Sample statistics（样本统计）|Statistical estimation and probability]]
>[[09 Introduction to probability theory#Statistical estimation and probability|Statistical estimation]]
>![upgit_20221130_1669834740.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221130_1669834740.png)

## Probabilistic model(概率模型)

It is often useful to model our data as being generated by a probabilistic model $\mathbb{P}_\theta$ (parametrized by $\theta$).

### Example

#### Example1
Suppose we have a sequence $(X_1,…,X_n)$ in $\{0,1\}^n$ corresponding to **pass or fail** for a driving test.
We can model $(X_1,…,X_n)$ as a sequence of **[[14 Continuous random variables and limit raws#Independent and identically distributed random variables|independent and identically distributed]] [[12 Random variables#Bernoulli distribution and Bernoulli random variables|Bernoulli random variables]]**
$$X_1,...,X_n\sim \mathcal{B}(q),\quad \theta=q$$


#### Example2
Suppose we have a sequence $(X_1,…,X_n)$ in $\mathbb{R}^n$ corresponding to the **height of a penguin.**
We can model $(X_1,...,X_n)$ as a sequence of **independent and identically distributed [[14 Continuous random variables and limit raws#Gaussian random variables|Gaussian Random variables]]**
$$X_1,...,X_n\sim \mathcal{N}(\mu,\sigma ^2),\quad \theta=(\mu,\sigma ^2)$$

---

## Statistical estimation（统计性估计）
We often use **prior knowledge** to choose the form of our model 

- e.g. Gaussian, Bernoulli, ..., and perform tasks based on the probabilistic model $\mathbb{P}_\theta$

| **Tasks**                                                                                                        | **Approach**                                                                                                                                         | **Goal**                                                                    |
| ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| We need to estimate the parameters $\theta$ in our model based upon a sample $X_1,...,X_n\sim \mathbb{P}_\theta$ | We estimate our parameters based on sample statistics, which are functions of the samples $\hat \theta=g(X_1,...,X_n)$ that don't depend on $\theta$ | Find sample statistical $\hat \theta=g(X_1,...,X_n)$approximating $\theta$. |

>[!tip] Note 
>sample statistics depend on the sample, so are themselves random variables.

### Example1

>[!example] Example1
>Suppose that $X_1,...,X_n \sim \mathcal{B}(q)$ are i.i.d. with a single parameter $\theta=q$.
>We estimate the **population mean** $q = \mathbb{E}(X_i)$ with the **sample mean**：
>$$\bar X=\dfrac{1}{n}\sum_{i=1}^{n}X_i$$
>So $g(x_1,x_2,...,x_n)=\dfrac{x_1+...+x_n}{n}$.

[[13 Discrete Random variables#PMF,Expectation,Variance of Binomial distributions|The relevant knowledge about Bernoulli (Variance and Expectation)]]


#### Simulation1
Fix $n=30$ and simulate distribution of $\bar X$:
#Rnote  `rbinom()` ,`scale_color_manual()`, `scale_linetype_manual()` 
```r
set.seed(0)
num_trials<-1000
sample_size<-30
q<-0.3 #True parameter q

#1. create data-frame (trial=1,2,...,num_trials)
df<-data.frame(trial=seq(num_trials))

#2. generate samples for sequences of Bernoulli random variables
df<-mutate(df,simulation=map(.x=trial,.f=~rbinom(sample_size,1,q)))

#3. Compute the sample mean
simulation_df<-mutate(df,sample_mean=map_dbl(.x=simulation,.f=mean))

#4.1 kernel density plot of sample means
plot_obj<-ggplot()+labs(x="Mean",y="Density")+theme_bw()+
					geom_density(data=simulation_df,aes(x=sample_mean,color="Sample",linetype="Sample"))

#4.2 vertical line displaying population mean
plot_obj<-plot_obj+geom_vline(aes(xintercept=q,color="Population",linetype="Population"))

#4.3 legends
plot_obj+scale_color_manual(name="legend",values=c("Sample"="red","Population"="blue"))+
scale_linetype_manual(name="Legend",values=c("Sample"="solid","Population"="dashed"))
```

| **Tips**                                                                                                       | **Results**                                                   |
| -------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| We estimate the population mean $q=\mathbb{E}(X_i)$ with the sample mean $\bar X=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ | ![[../../../Attachments/Pasted image 20221130180912.png]] |

#### Simulation2

**Recall that**: We estimate the population mean $q=\mathbb{E}(X_i)$ with the sample mean $\bar X=\dfrac{1}{n}\sum_{i=1}^{n}X_i$
Compare $\bar X$ for different sample sizes ($n$ from 1 to 10000)
#Rnote  `pmap()`, `scale_x_sqrt()`
```r
# A sequence of samples with sizes varying from 1 and 10000

set.seed(0)
num_trials_per_sample_size<-10
max_sample_size<-10000
q<-0.3 #True parameter q

#1. create a data frame containing all pairs of sample_size and trial
df<-crossing(trial=seq(num_trials_per_sample_size),
            sample_size=seq(to=sqrt(max_sample_size),by=0.1)**2)

#2. For each pair,simulate a sequence of Bernoulli random variables
df<-mutate(df,simulation=pmap(.l=list(trial,sample_size),.f=~rbinom(.y,1,q)))

#3. compute the sample mean of each sequence
sim_by_n_df<-mutate(df,sample_mean=map_dbl(.x=simulation,.f=mean))

#4.1 scatter plot of sample means (for different sample sizes)
plot_obj<-ggplot()+labs(x="Sample size",y="Mean")+theme_bw()+
		geom_point(data=sim_by_n_df,aes(x=sample_size,y=sample_mean,color="Sample",linetype="Sample"),size=0.1)

#4.2 horizontal line displaying population mean
plot_obj<-plot_obj+
  geom_hline(aes(yintercept=q,color="Population",linetype="Population"),size=1)


#4.3 add legends
plot_obj+scale_color_manual(name="Legend",values=c("Sample"="blue","Population"="red"))+
	scale_linetype_manual(name="Legend",values=c("Sample"="dashed","Population"="solid"))+
	scale_x_sqrt()
```
| **Tips**                                                                                                                                                                                     | **Results**                                               |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| We estimate the population mean $q=\mathbb{E}(X_i)$ with the sample mean $\bar X=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ <br> **Conclusion:** the sample mean approaches the population mean for large $n$. | ![[../../../Attachments/Pasted image 20221130180952.png]] |


---

### Example2

>[!example]
>Suppose $X_1,...,X_n \sim \mathcal{N}(\mu,\sigma ^2)$ are i.i.d. with parameters $\theta=(\mu,\sigma ^2)$.
>We estimate the population mean $\mu$ with the sample mean $\bar X=\dfrac{1}{n}\sum_{i=1}^n X_i$.
>We estimate $\sigma ^2=\mathrm{Var}(X_i)$ with the sample variance $s^2=\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$.
>So $g(x_1,...,x_n)=\dfrac{1}{n-1}\sum_{i=1}^{n}(x_i-\sum_{j=1}^n x_j/n)^2$.

#### Simulation1
Fix $n=30$ and simulate distribution of $\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$
```r
set.seed(0)
num_trials<-1000
sample_size<-30
mu <- 1 #True mu
sigma_sqr <- 3  #True sigma^2

#1. Create a data frame (trial=1,2,...,num_trials)
df<- data.frame(trial=seq(num_trials))

#2. generate num_trials sample with rnorm()
df<- mutate(df,simulation=map(.x=trial,
                             .f=~rnorm(sample_size,mean=mu,sd=sqrt(sigma_sqr))))

#3. compute the sample variance (estimate sigma^2)
simulation_df<- mutate(df,sample_var=map_dbl(.x=simulation,.f=var))

#4.1 kernel density plot of sample variance
plot_obj<- ggplot()+labs(x="Variance",y="Density")+theme_bw()+
	geom_density(data=simulation_df,aes(x=sample_var,color="Sample",linetype="Sample"))

#4.2 vertical line displaying population mean
plot_obj<- plot_obj+geom_vline(aes(xintercept=sigma_sqr,
                                  color="Population",linetype="Population"))

#4.3 add legend
plot_obj+scale_color_manual(name="Legend",
                            values=c("Sample"="red","Population"="blue"))+
	scale_linetype_manual(name="Legend",
                       values=c("Sample"="solid","Population"="dashed"))

```
| **Tips**                                                                                                       | **Results** |
| -------------------------------------------------------------------------------------------------------------- | ----------- |
| We estimate $\sigma ^2=\mathrm{Var}(X_i)$ with the sample variance$\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$ | ![[../../../Attachments/Pasted image 20221130180820.png]]            |

#### Simulation2

Compare $\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$ for different sample sizes ($n$ from 1 to 10000)

```r
set.seed(0)
num_trials_per_sample_size<-10
max_sample_size<-10000
mu <- 1 #True mu
sigma_sqr <- 3  # sigma^2

#1. create data frame of all pairs of sample_size and trial
df<-crossing(trial=seq(num_trials_per_sample_size),
             sample_size=seq(to=sqrt(max_sample_size),by=0.1)**2)

#2. For each pair,simulate a sequence of Gaussian random variables
df<-mutate(df,simulation=pmap(.l=list(trial,sample_size),
                              .f=~rnorm(.y,mean=mu,sd=sqrt(sigma_sqr))))

#3. For each sequence, compute the sample variance
sim_by_n_df<-mutate(df,sample_var=map_dbl(.x=simulation,.f=var))

#4.1 create a scatter plot of sample variance
plot_obj<-ggplot()+labs(x="Sample size",y="Variance")+theme_bw()+
  geom_point(data=sim_by_n_df,
             aes(x=sample_size,y=sample_var,color="Sample",
                 linetype="Sample"),size=0.1)

#4.2 add a horizontal line displaying population variance
plot_obj<-plot_obj+geom_hline(aes(yintercept=sigma_sqr,color="Population",
                                  linetype="Population"),size=1)

#4.3 add Legends
plot_obj+
  scale_color_manual(name="Legend",values=c("Sample"="blue","Population"="red"))+
  scale_linetype_manual(name="Legend",values=c("Sample"="dashed","Population"="solid"))+
  scale_x_sqrt()
```

| **Tips**                                                                                                                                                                                                                      | **Results**                                                          |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| We estimate the population variance $\sigma ^2=\mathrm{Var}(X_i)$ with the sample variance $\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$ <br> **Conclusion:** the sample variance approaches the population variance for large $n$. | ![[../../../Attachments/Pasted image 20221130181244.png]] |


### Example3-The Cauchy distribution

>[!example] Example3  
>A random variable $X$ has a **Cauchy distribution** with location parameter $\theta$ if its density is:
>$$f_\theta(x):=\dfrac{1}{\pi \cdot (1+(x-\theta)^2)}$$
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668726578801-0d03afe7-bbc2-4efb-973e-c0ff71cf75fd.png#averageHue=%23fbfafa&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=317&id=u09fce02c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=634&originWidth=888&originalType=binary&ratio=1&rotation=0&showTitle=false&size=197142&status=done&style=none&taskId=u192dbcbb-cf3c-4526-9e35-8c7be7b140a&title=&width=444)

Suppose $X_1,...,X_n$ are i.i.d. **[[#The Cauchy distribution|Cauchy random variables]]** with parameters $\theta$.
**Attempt**: We estimate the **population mean** with the sample mean $\dfrac{1}{n}\sum_{i=1}^{n} X_i$.

#### Simulation1
Compare the sample mean $\dfrac{1}{n}\sum_{i=1}^{n} X_i$ for different sample sizes ($n$ from 1 to 10000)

```r
set.seed(0)
num_trials_per_sample_size<-10
max_sample_size<-10000
theta<-1 #True parameter theta

#1. create data frame consisting of all pairs of sample_size and trial
df<-crossing(trial=seq(num_trials_per_sample_size),
             sample_size=seq(to=sqrt(max_sample_size),by=0.1)**2)

#2. for each pair,simulate a sequence of Cauchy random variables
df<-mutate(df,simulation=pmap(.l=list(trial,sample_size),
                              .f=~rcauchy(.y,location=theta)))

#3. for each sequence,compute its sample mean
sim_by_n_df<-mutate(df,sample_mean=map_dbl(.x=simulation,.f=mean))

#4.1 create a scatter plot of sample mean
plot_obj<-ggplot()+labs(x="Sample size",y="Sample mean")+theme_bw()+
  geom_point(data=sim_by_n_df,
             aes(x=sample_size,y=sample_mean,color="Sample",
                 linetype="Sample"),size=0.1)+ylim(-10,10)

#4.2 add a horizontal line displaying theta
plot_obj<-plot_obj+geom_hline(aes(yintercept=theta,color="Theta",
                                  linetype="Theta"),size=1)

#4.3 add Legends
plot_obj+
  scale_color_manual(name="Legend",values=c("Sample"="blue","Theta"="red"))+
  scale_linetype_manual(name="Legend",values=c("Sample"="dashed","Theta"="solid"))+
  scale_x_sqrt()
```

| **Conclusion**                     | **Results** |
| ---------------------------------- | ----------- |
| the sample mean does not converge! |   ![[../../../Attachments/Pasted image 20221130182542.png]]          |


---

#### The Cauchy distribution

The sample mean of a sequence of i.i.d. **Cauchy random variables** is a bad estimator as it does not converge when the sample size is arbitrarily large.

**Recall** the **[[14 Continuous random variables and limit raws#^1b582b|weak laws of large numbers]]**

Since the sample mean of a sequence of i.i.d. Cauchy random variables does not converge, the weak law of large numbers implies that the Cauchy distribution does not have a well-defined expectation.

>[!question] Question
>What are reasonable estimators in the setting of Cauchy random variables?

**Recall that** a random variable $X$ has a Cauchy distribution with location parameter $\theta$ if its density is $f_\theta (x):=\dfrac{1}{\pi \cdot (1+(x-\theta)^2)}$.

A Cauchy random variable $X$ has a cumulative distribution function
$$F_\theta(x)=\mathbb{P}(X\leq x)=\int _{-\infty}^x f_\theta(z)\mathrm{d}z=\dfrac{1}{\pi}\mathrm{arctan}(x-\theta)+\dfrac{1}{2}$$
The **population median** of $X$ is $F_{\theta}^{-1}(0.5)=\mathrm{inf}\{x\in \mathbb{R} : F_{\theta}(x)\geq \dfrac{1}{2}\}=\theta$.

| Note                                                                                                                                                                             | Results |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| Suppose that we have $X_1,...,X_n$ are i.i.d. Cauchy random variables.<br> We can try the sample median $\hat \theta=\mathrm{Median}(X_1,...,X_n)$ as an estimator for $\theta$. | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668726578801-0d03afe7-bbc2-4efb-973e-c0ff71cf75fd.png#averageHue=%23fbfafa&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=331&id=FVcAD&margin=%5Bobject%20Object%5D&name=image.png&originHeight=634&originWidth=888&originalType=binary&ratio=1&rotation=0&showTitle=false&size=197142&status=done&style=none&taskId=u192dbcbb-cf3c-4526-9e35-8c7be7b140a&title=&width=463)        |



---

#### Simulation2

**Attempt**: We estimate $\theta$ with the sample median $\mathrm{Median}(X_1,...,X_n)$.

Compare $\mathrm{Median}(X_1,...,X_n)$ for different sample sizes ($n$ from 1 to 10000).

```r
set.seed(0)
num_trials_per_sample_size<-10
max_sample_size<-10000
theta<-1 #True parameter theta

#1. create data frame consisting of all pairs of sample_size and trial
df<-crossing(trial=seq(num_trials_per_sample_size),
             sample_size=seq(to=sqrt(max_sample_size),by=0.1)**2)

#2. for each pair,simulate a sequence of Cauchy random variables
df<-mutate(df,simulation=pmap(.l=list(trial,sample_size),
                              .f=~rcauchy(.y,location=theta)))

#3. for each sequence,compute its sample median
sim_by_n_df<-mutate(df,sample_median=map_dbl(.x=simulation,.f=median))

#4.1 create a scatter plot of sample median
plot_obj<-ggplot()+labs(x="Sample size",y="Sample median")+theme_bw()+
  geom_point(data=sim_by_n_df,
             aes(x=sample_size,y=sample_median,color="Sample",
                 linetype="Sample"),size=0.1)+ylim(-10,10)

#4.2 add a horizontal line displaying theta
plot_obj<-plot_obj+geom_hline(aes(yintercept=theta,color="Theta",
                                  linetype="Theta"),size=1)

#4.3 add Legends
plot_obj+
  scale_color_manual(name="Legend",values=c("Sample"="blue","Theta"="red"))+
  scale_linetype_manual(name="Legend",values=c("Sample"="dashed","Theta"="solid"))+
  scale_x_sqrt()
```

| **Conclusion**                                         | **Results** |
| ------------------------------------------------------ | ----------- |
| the sample median approaches to $\theta$ for large $n$ | ![[../../../Attachments/Pasted image 20221130183229.png]]            |


## Consistent estimators

We are interested in statistical estimator $\hat \theta$ that tend towards the true parameter $\theta$ as $n\to \infty$.

| Example1 | Example2 | Example3 |
| --- | --- | --- |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668725147020-e7771d7f-1c3b-41b6-b8ef-7a7fa94edb96.png#averageHue=%23fcfcfc&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=433&id=RdAiH&margin=%5Bobject%20Object%5D&name=image.png&originHeight=865&originWidth=1400&originalType=binary&ratio=1&rotation=0&showTitle=false&size=105893&status=done&style=none&taskId=u83ff1121-ae7c-4d3c-b33c-9b4daae4436&title=&width=700) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668765393216-765bd5b5-584a-48a6-8daa-eb9b933767bf.png#averageHue=%23fcfcfc&clientId=uce66fb2d-c490-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=433&id=u85b8c845&margin=%5Bobject%20Object%5D&name=image.png&originHeight=865&originWidth=1400&originalType=binary&ratio=1&rotation=0&showTitle=false&size=94484&status=done&style=none&taskId=u1c3a3a5d-1104-4329-b114-2dde0442428&title=&width=700) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668765097663-012dd921-d6c7-4725-9dca-70b30ac7ba47.png#averageHue=%23fcfcfc&clientId=uce66fb2d-c490-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=433&id=B04Kb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=865&originWidth=1400&originalType=binary&ratio=1&rotation=0&showTitle=false&size=71131&status=done&style=none&taskId=u78e107eb-a656-4cf2-b83d-959843c6bec&title=&width=700) |

These estimators are referred to as "consistent" estimators

### Definition of Consistent estimators

>[!note] Consistent estimators
>A sample statistic $\hat \theta=g(X_1,...X_n)$ of a population parameter $\theta$ is consistent if for all $\epsilon>0$,
>$$\lim_{n\to \infty}\mathbb{P}\{|g(X_1,...,X_n)-\theta|>\epsilon\}=0$$

So a consistent estimator converges to the population parameter in probability, as $n$ goes to infinity.

### Consequence of the weak law of large numbers
**Recall** the **[[14 Continuous random variables and limit raws#^1b582b|weak law of large numbers]]**: 

Suppose that $X_1,..,X_n$ are i.i.d. random variables with mean $\mu$ and variance $\sigma^2$, as a consequence of the weak law of large numbers, we have
1. The sample mean $\bar X :=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ is a consistent estimator of $\mu$（e.g，Example 1)
2. The sample variance $\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$ is a consistent estimator of $\sigma ^2$. (e.g.,Example 2).
3. Moreover, since the standard deviation $\sigma$ is the square root of the variance, we have: The sample deviation $\sqrt{\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2}$ is a consistent estimator of $\sigma$.

## Statistical bias(统计偏差)

### Definition of statistical bias

>[!note] The bias of an estimator 
>The **bias** of an estimator $\hat \theta=g(X_1,...,X_n)$ of a population parameter $\theta$ is
>$$\mathrm{Bias}(\hat \theta):=\mathbb{E}(\hat \theta)-\theta$$
>The estimator is said to be unbiased if $\mathrm{Bias}(\hat \theta)=0$

Given an independent and identically distributed sample $X_1,...,X_n$, we have
$$\mathrm{Bias}(\bar X)=\mathbb{E} \left( \dfrac{1}{n}\sum_{i=1}^{n}X_i\right)-\mu=0$$
$$\mathrm{Bias}(s^2)=\mathbb{E}\left(\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i- \bar X)^2\right)-\sigma^2=0$$
### Note
- ==The sample mean is an unbiased estimator for the population mean==
- The sample mean computed from just the quarter of the data is also unbiased.

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668728685078-a1380f6f-9b25-4ad6-8975-a9cd31a881bc.png#averageHue=%23fcfcfb&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=296&id=ufd03f742&margin=%5Bobject%20Object%5D&name=image.png&originHeight=466&originWidth=672&originalType=binary&ratio=1&rotation=0&showTitle=false&size=87409&status=done&style=none&taskId=ub7b19700-8745-459a-a748-084cf3ad148&title=&width=427)

- There are many unbiased estimators.
- However, the bias is not sufficient for measuring the accuracy of an estimator. In fact, many such estimators are of very high **variance**!
## Variance of an estimator
### Definition of variance of an estimator

>[!note] Variance of an estimator
>The variance of an estimator $\hat \theta=g(X_1,...,X_n)$ of a population parameter $\theta$ is
>$$\mathrm{Var}(\hat \theta):=\mathbb{E}\left\{\left(\hat \theta-\mathbb{E}(\hat \theta)\right)^2\right\}$$

An estimator with a small variance is not necessarily a good estimator either.
Consider an extreme case where $\hat \theta=0$ for any sample. So $\hat \theta$ does not reflect useful information about the population.

|                                                                                                                                                                                                     $\mathrm{Bias}(\hat \theta):=\mathbb{E}(\hat \theta)-\theta$                                                                                                                                                                                                      |                                                                                                                                                                                     $\mathrm{Var}(\hat \theta):=\mathbb{E}[\left\{\hat \theta-\mathbb{E}(\hat \theta)\right\}^2]$                                                                                                                                                                                     |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668729115531-84b0821b-5183-4a77-a883-49eefbfaeb9e.png#averageHue=%23fbfbfb&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=213&id=u6f03faa7&margin=%5Bobject%20Object%5D&name=image.png&originHeight=426&originWidth=622&originalType=binary&ratio=1&rotation=0&showTitle=false&size=70530&status=done&style=none&taskId=u3bb7bc2e-f132-42e4-b327-ac7309eae1a&title=&width=311) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668729126017-c633be2b-f890-42ec-9652-b2471e0ed2ad.png#averageHue=%23fbfbfb&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=218&id=u01ce481d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=436&originWidth=628&originalType=binary&ratio=1&rotation=0&showTitle=false&size=78674&status=done&style=none&taskId=u742aa332-418f-449c-9f73-f9b0482347b&title=&width=314) |

## Mean squared error（均方误差）

### Definition of mean squared error

>[!note] The mean square error of an estimator
>The mean square error of an estimator $\hat \theta=g(X_1,...,X_n)$ of a population parameter $\theta$ is:
>$$\mathrm{MSE}(\hat \theta):=\mathbb{E}\left\{\left(\hat \theta-\theta\right)^2\right\}$$

The MSE tells the difference between the estimate $\hat \theta$ and the parameter $\theta$ in the sense of mean square distance.
### The Bias-variance decomposition

>[!note] Theorem(Bias-variance decomposition)
>Suppose that $\hat \theta$ is an estimator of a parameter $\theta$. Then
>$$\mathrm{MSE}(\hat \theta)=\mathrm{Bias}(\hat \theta)^2+\mathrm{var}(\hat \theta)$$

#### Proof
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668729544196-d6193f0c-c29b-4d06-a236-03e03d577158.png#averageHue=%23f6f6f6&clientId=ud27c46db-e3f1-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=184&id=uc8f55829&margin=%5Bobject%20Object%5D&name=image.png&originHeight=368&originWidth=1058&originalType=binary&ratio=1&rotation=0&showTitle=false&size=88325&status=done&style=none&taskId=ufed96120-2a26-4032-9485-89b3f46c25d&title=&width=529)
## Minimum variance unbiased estimator（最小方差无偏估计）

**Recall that** an estimator is said to be unbiased if $\mathrm{Bias}(\hat \theta)=0$.
### Definition of Minimum variance unbiased estimator
>[!note] Minimum of variance unbiased estimator
>An estimator $\hat \theta$ is said to be a minimum variance unbiased estimator(MVUE) if:
>1. $\hat \theta$ is unbiased, i.e., $\mathbb{E}(\hat \theta)=\theta$.
>2. $\hat \theta$ has minimum variance, i.e., $\mathrm{Var}(\hat \theta)\leq \mathrm{Var}(\tilde \theta)$ for any unbiased estimator $\tilde \theta$.

**Remark**: A MVUE also has minimal mean square error over all unbiased estimators, because of the bias-variance decomposition
$$\mathrm{MSE}(\hat \theta)=\mathrm{Bias}(\hat \theta)^2+\mathrm{var}(\hat \theta)=\mathrm{var}(\hat \theta)$$
which holds for all unbiased estimators.
### Example

#### Example1
Suppose that $X_1,..,X_n \sim \mathcal{B}(q)$ are i.i.d.
Then $\bar X=\dfrac{1}{n} \sum_{i=1}^{n}X_i$is a MVUE of $q$.
**Note** : This is a consequence of **the Rao-Blackwell theorem**.

#### Example2
Suppose that $X_1,..,X_n \sim \mathcal{N}(\mu,\sigma^2)$ are i.i.d.
Then :
$\bar X=\dfrac{1}{n} \sum_{i=1}^{n}X_i$ is a MVUE of $\mu=\mathbb{E}(X_i)$.
$s^2=\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$ is a MVUE of $\sigma^2=\mathbb{E}((X_i-\mu)^2)$.
**Note**: This is also a consequence of the Rao-Blackwell theorem.


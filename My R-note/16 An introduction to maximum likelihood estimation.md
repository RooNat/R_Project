---
tags: R
Week: 7
type: lecture
Lecture: 16
---

[Lecture16.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1668589542049-bcf33fb5-6fe8-491a-86b0-eef7b7460cca.pdf)

## Preface
### Some key concepts
**Tasks**. We need to estimate the parameters $\theta$ in our model based upon a sample $X_1,...,X_n \sim \mathbb{P}_\theta$.
We estimate our parameters based on **sample statistics**,which are functions of the samples $\hat \theta=g(X_1,...,X_n)$ that don't depend on $\theta$.

>[!important] Relevant concepts
>[[15 Foundations of statistical estimation_ Consistency,bias and variance#Definition of Consistent estimators|Consistent estimators]]
>[[15 Foundations of statistical estimation_ Consistency,bias and variance#Definition of statistical bias|Bias of an estimator]]
>[[15 Foundations of statistical estimation_ Consistency,bias and variance#Definition of variance of an estimator|Variance of an estimator]]
>[[15 Foundations of statistical estimation_ Consistency,bias and variance#Mini|A minimum variance unbiased estimator]]



### The chapter's focus
>[!question]
>**Problem formulation:** Given a probabilistic model $\mathbb{P}_\theta$ (parametrized by $\theta$) and a sample $X_1,...,X_n$, can we find an algorithm/method to compute an estimate of $\theta$ from the sample?

> Of course, we can use the sample mean to estimate the population mean, and use the sample variance to estimate the population variance, but ..

We would like a general strategy for finding (near) optimal estimators $\hat \theta$ for population parameters $\theta$.
Find the parameter $\theta$ such that the model $\mathbb{P}_\theta$ best fit the dataset（sample）

---

## The likelihood function(似然函数)

**Question:**

**Problem formulation:** Given a probabilistic model $\mathbb{P}_\theta$ (parametrized by $\theta$) and a sample $X_1,...,X_n$, can we find an algorithm/method to compute an estimate of $\theta$ from the sample?

Search the unknown parameter $\theta$ in the parameter space $\Theta$
### Definition of likelihood function

**The likelihood function** $L:\Theta \to [0,\infty)$ is a function of the parameter $\theta$. It maps each $\theta$ to a single number which measures the goodness of fit to the data $X_1,...,X_n$.

Suppose that $\mathrm{X}=(X_1,...,X_n)$ is a sequence of i.i.d. random variables. The likelihood function is defined as below:

| **Case1: Discrete random variables**                                                                              | **Case2: Continuous random variables**                                                                               |
| ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| $L(\theta;\mathrm{X}):=\prod_{i=1}^n p_{\theta}(X_i)$ where $p_\theta$ is the probability mass function of $X_i$. | $L(\theta;\mathrm{X}):=\prod_{i=1}^n f_{\theta}(X_i)$ where $f_\theta$ is the probability density function of $X_i$. |

### Example1 (discrete random variables)
Suppose $X_1,...,X_n \sim \mathcal{B}(q_0)$ are i.i.d. Bernoulli random variables with an unknown parameter $\mathbb{E}(X_i)=q_0$.

Every observation $X_i$ has the [[13 Discrete Random variables#Probability mass function|probability mass function]] $p_q:\mathbb{R}\to [0,1]$ given by
$$p_q(x)=q^x\cdot (1-q)^{1-x} \cdot \mathbb{1}_{\{0,1\}}(x)=\begin{cases}
1-q,& \quad \text{if }x=0\\
q,& \quad \text{if }x=1\\
0, & \quad \text{Otherwise.}
\end{cases}$$
So $q\in \Theta :=[0,1]$, and the likelihood function $L:[0,1]\to [0,\infty)$ is given by
$$L(q;\mathrm{X})=\prod_{i=1}^{n}p_q(X_i)=\prod_{i=1}^n \left\{q^{X_i}\cdot (1-q)^{1-X_i}\right\}=q^{\sum_{i=1}^n X_i}\cdot (1-q)^{n-\sum_{i=1}^n X_i}.$$
Here we assume that the value of $X_i$ is either 0 or 1, so $\mathbb{1}_{\{0,1\}}(X_i)=1$.
### Example2 (continuous random variables)
Suppose $X_1,...,X_n \sim \mathcal{N}(\mu_0,\sigma_0^2)$ are i.i.d. Gaussian random variables with unknown parameters $(\mu_0,\sigma_0^2)$.

Every observation $X_i$has the probability density function $f_{\mu,\sigma}:\mathbb{R}\to [0,\infty]$ given by
$$f_{\mu,\sigma}(x)=\dfrac{1}{\sigma \sqrt{2\pi}}\mathrm{exp}\left\{-\dfrac{1}{2}\left(\dfrac{x-\mu}{\sigma}\right)^2\right\} \: \text{for all }x\in \mathbb{R}$$
So $(\mu,\sigma)\in \Theta := \mathbb{R} \times (0,\infty)$, and the likelihood function $L:\mathbb{R}\times (0,\infty)\to [0,\infty)$ is given by
$$L(\mu,\sigma;\mathrm{X})=\prod_{i=1}^{n}f_{\mu,\sigma}(X_i)=\left(\dfrac{1}{\sigma \sqrt{2 \pi}}\right)^n\mathrm{exp}\left(-\dfrac{1}{2}\sum_{i=1}^{n}\left(\dfrac{X_i-\mu}{\sigma}\right)^2\right)$$

---

## Maximum likelihood estimation
**<u>Question:</u>**
***Problem formulation*:** Given a probabilistic model $\mathbb{P}_\theta$ (parametrized by $\theta$) and a sample $X_1,...,X_n$, can we find an algorithm/method to compute an estimate of $\theta$ from the sample?

***Answer***: we can maximise the likelihood function $L(\theta;\mathrm{X})$ for an estimate of $\theta$

### Definition of Maximum likelihood estimate

The **maximum likelihood estimate** $\hat \theta(X_1,...X_n)$ for a parameter $\theta_0\in \Theta$ is defined to be the parameter value which maximizes the likelihood:
$$\hat \theta(X_1,...,X_n)=\mathrm{argmax}_{\theta\in \Theta}L(\theta,\mathrm{X}).$$

This formalises the idea of choosing a parameter such that the model best fits the data.
### Example1
Suppose $X_1,...,X_n \sim \mathcal{B}(q_0)$ are i.i.d. Bernoulli random variables with an unknown parameter $\mathbb{E}(X_i)=q_0$.
$$L(q;\mathrm{X})=\prod_{i=1}^{n}p_q(X_i)=\prod_{i=1}^n \left\{q^{X_i}\cdot (1-q)^{1-X_i}\right\}=q^{\sum_{i=1}^n X_i}\cdot (1-q)^{n-\sum_{i=1}^n X_i}.$$
Let $\bar X:=\dfrac{1}{n}\sum_{i=1}^{n}X_i$. We aim to find the maximizer of $$\mathrm{log}L(q;\mathrm{X})=\mathrm{log}\left(q^{n \bar X}\cdot (1-q)^{n-n \bar X_i}\right)=n\bar X \mathrm{log}(q)+(n-n\bar X)\mathrm{log}(1-q)$$.

To find the maximizer, setting $\dfrac{\partial \mathrm{log}(L(q;\mathrm{X}))}{\partial q}=n\left(\dfrac{\bar X}{q}-\dfrac{1-\bar X}{1-q}\right)=0$
Solving this equation, we get the maximum likelihood estimate $\hat q_{\mathrm{MLE}}=X$.
So the maximum likelihood estimate for $q_0$ is also an **MVUE**!
### Example2
Suppose $X_1,...,X_n \sim \mathcal{N}(\mu_0,\sigma_0^2)$ are i.i.d. Gaussian random variables with unknown parameters $(\mu_0,\sigma_0^2)$.
$$L(\mu,\sigma;\mathrm{X})=\prod_{i=1}^{n}f_{\mu,\sigma}(X_i)=\left(\dfrac{1}{\sigma \sqrt{2 \pi}}\right)^n\mathrm{exp}\left(-\dfrac{1}{2}\sum_{i=1}^{n}\left(\dfrac{X_i-\mu}{\sigma}\right)^2\right)$$

By taking the logarithm and differentiating we see that

| $\bar X:=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ | $\hat \sigma^2=\dfrac{1}{n}\sum_{i=1}^{n}(X_i-\bar X)^2$ |
| :---------------------------------------: | :--------------------------------------------------------: |
| is the MLE for $\mu_0$                  | is the MLE for $\sigma_{0}^2$                            |
| (this is also a MVUE)                   | (this is not unbiased)                                   |

**Recall that** the MVUE of $\sigma^2$ is given by $\dfrac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2$, which is unbiased.

---

## Simulation studies
In what follows, we will conduct simulation studies to see

- The maximum likelihood estimator with Gaussian distributions & Cauchy distributions, respectively
- How we can compute the maximum likelihood estimate using the idea of numerical optimisation when there is no closed-form solution
- Visualisation of the distribution of the maximum likelihood estimate (as a random variable)
### Simulation1: maximum likelihood
[[16 An introduction to maximum likelihood estimation#Example2|Example2]]: Suppose $X_1,...,X_n \sim \mathcal{N}(\mu_0,\sigma_0^2)$ are i.i.d. Gaussian random variables with unknown parameters $(\mu_0,\sigma_0^2)$.
#Rnote `dnorm()`  gives the density, `rbind()` 
```r
mu<-1 #choose a mean
sigma<-2 #choose a standard deviation

#1. generate some x indices
x<-seq(mu-3*sigma,mu+3*sigma,sigma*0.01)

#2. data frame with population density
df_gaussian<-data.frame(x,Density=dnorm(x,mean=mu,sd=sigma),Source="Population")

#3. plot the density function
df_gaussian %>% ggplot(aes(x=x,y=Density,color=Source))+
  geom_line()+ylab("Density function")+theme_bw()
```
The density function of the Gaussian random variable: 
![image.png|700](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668787103965-d1bf13f3-8b57-446f-a09c-e403f7ed0dc3.png#averageHue=%23fbfbfb&clientId=u509a146c-0d6d-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=371&id=uc15afdd3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=742&originWidth=1202&originalType=binary&ratio=1&rotation=0&showTitle=true&size=69668&status=done&style=none&taskId=u1e68219c-66c5-4842-9817-3f3c8224b8c&title=The%20density%20function%20%0D%20of%20the%20Gaussian%20%0D%20random%20variable&width=601 )

| $\bar X:=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ | $\hat \sigma^2=\dfrac{1}{n}\sum_{i=1}^{n}(X_i-\bar X)^2$ |
| :---------------------------------------: | :--------------------------------------------------------: |
| is the MLE for $\mu_0$                  | is the MLE for $\sigma_{0}^2$                            |
| (this is also a MVUE)                   | (this is not unbiased)                                   |

```r
set.seed(123)
sample_size<-100

#4. generate a sample of Gaussian random variables
sample_data<-rnorm(sample_size,mu,sigma)

#5. ML estimate of mu and sigma
mu_mle<-mean(sample_data)
sigma_mle<-sd(sample_data)*sqrt((sample_size-1)/sample_size)

#6. add estimated density function to df
df_gaussian<-df_gaussian %>% 
  rbind(data.frame(x,Density=dnorm(x,mean=mu_mle,sd=sigma_mle),
                   Source="MLE estimate"))

#7. plot the true and estimated density functions
df_gaussian %>% ggplot(aes(x=x,y=Density,color=Source))+
  geom_line()+ylab("Density function")+theme_bw()
```
|                                                                  Note                                                                  |                          Results                          |
|:--------------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------:|
| **MLE** for Gaussian distribution;<br> Plot the parametric Gaussian model, fitted with MLE.<br> Then compare it with the true density. | ![[../../../Attachments/Pasted image 20221201190918.png]] |


### Simulation2 maximum likelihood with penguins data
Let's fit a **Gaussian model** to the weights of Gentoo penguins

| $\bar X:=\dfrac{1}{n}\sum_{i=1}^{n}X_i$ | $\hat \sigma^2=\dfrac{1}{n}\sum_{i=1}^{n}(X_i-\bar X)^2$ |
| :---------------------------------------: | :--------------------------------------------------------: |
| is the MLE for $\mu_0$                  | is the MLE for $\sigma_{0}^2$                            |
| (this is also a MVUE)                   | (this is not unbiased)                                   |

```r
library(palmerpenguins)
```
```r
#1. sample of Gentoo weights
gentoo_weights<-penguins %>%
  filter(species=='Gentoo') %>%
  pull(body_mass_g) # extract the column of Gentoo weights

#2. ML estimates of mu and sigma
n<-length(gentoo_weights) #sample size
mu_mle<-mean(gentoo_weights,na.rm=TRUE) #mle mean
sigma_mle<-sd(gentoo_weights,na.rm=TRUE)*sqrt((n-1)/n) #mle standard deviation
```
Let's **plot** our parametric Gaussian model, fitted with MLE, and our kernel density plot.
```r
#4. generate indices
weights<-seq(mu_mle-3*sigma_mle,mu_mle+3*sigma_mle,sigma_mle*0.001)

#5.1 plot estimated density functions(MLE density)
colors<-c("MLE density"="red","Kernel density"="blue") #set color legend
estimated_density=data.frame(Weight=weights,
                             Density=dnorm(weights,mean=mu_mle,sd=sigma_mle))
plot_obj<-ggplot()+geom_line(data=estimated_density,
                             aes(x=Weight,y=Density,color="MLE density"))

#5.2 kernel density plot of the sample
plot_obj+geom_density(data=tibble(gentoo_weights),aes(x=gentoo_weights,color="Kernel density"))+
  labs(y="Density function",color="Estimator")+theme_bw()+scale_color_manual(values=colors)
```
![[../../../Attachments/Pasted image 20221201191118.png]]
### Finding the maximizer
In many other cases, there is no closed-form solution.
**Recall that:**
![[#Definition of Maximum likelihood estimate]]

We use **optimization techniques** to maximise the likelihood function $\theta\to L(\theta;\mathrm{X})$ numerically.
![image.png|300](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668783945660-787344eb-fad2-4590-b6b8-bf607bd93aee.png#averageHue=%23fcfafa&clientId=uc5dd9a54-f716-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=208&id=u023ae1e1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=416&originWidth=528&originalType=binary&ratio=1&rotation=0&showTitle=false&size=42636&status=done&style=none&taskId=ub1014e37-fc17-4c39-8102-3c000ef46f7&title=&width=264)
### Simulation3 maximum likelihood with Cauchy distribution
>[[15 Foundations of statistical estimation_ Consistency,bias and variance#The Cauchy distribution|Cauchy distribution]]

Suppose that we have i.i.d. random variables $X_1,...,X_n \sim f_{\theta_0}$. We aim to estimate the unknown parameter $\theta_0$.
The **likelihood function** is given by
$$L(\theta;\mathrm{X})=\prod_{i=1}^{n}f_{\theta}(X_i)=\prod_{i=1}^{n}\dfrac{1}{\pi (1+(X_i-\theta)^2)}$$.
The **log-likelihood function** is given by
$$\mathrm{log}L(\theta;\mathrm{X})=-n \mathrm{log}(\pi)-\sum_{i=1}^{n}\mathrm{log}(1+(X_i-\theta)^2)$$.
Unfortunately, we do not have an analytical solution to $\hat \theta _{n} \in \mathrm{argmax}L(\theta;\mathrm{X})$
**We can compute the optimisation problem numerically.**
#### Code
| **Goal**                                                                                                                                        | **Function** |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------- |
| Our goal is to maximise the log-likelihood $$\mathrm{log}L(\theta;\mathrm{X})=-n \mathrm{log}(\pi)-\sum_{i=1}^{n}\mathrm{log}(1+(X_i-\theta)^2)$$ | `optimise()`  |


- An example of finding the MLE numerically:
```r
set.seed(0)
sample_size<-100
theta_0<-5 #True parameter theta

#1. Generate sample of a sequence of Cauchy R.V.
cauchy_sample<-rcauchy(n=sample_size,location=theta_0)

#2. The log likelihood function
log_lik_cauchy<-function(theta,sample_X){return(-sum(log(1+(sample_X-theta)**2)))}
log_lik_cauchy_X<-function(theta){return(log_lik_cauchy(theta,cauchy_sample))}

#3. optimise the log likelihood function
theta_ml_est<-optimise(f=log_lik_cauchy_X,interval=c(-1000,1000),maximum=TRUE)$maximum
theta_ml_est
```
**Results**

```
[1] 4.906282
```

- Next, let's conduct a simulation to study the distribution of the maximum likelihood estimate, by using 100000 trials
```r
set.seed(0)

num_trials<-100000
sample_size<-100
theta_0<-5 #True parameter theta

#1. log likelihood function
log_lik_cauchy<-function(theta,sample_X){return(-sum(log(1+(sample_X-theta)**2)))}

#2. mapping a sample to ML estimate of theta
theta_ml<-function(sample_X){
  log_lik_cauchy_X<-function(theta){return(log_lik_cauchy(theta,sample_X))}
  theta_ml_est<-optimise(f=log_lik_cauchy_X,interval=c(-10,18),maximum=TRUE)$maximum
  return(theta_ml_est)
}

#3.1 create num_trials samples; the size of each sample is sample_size
df<-data.frame(trial=seq(num_trials))%>%
  mutate(sample=map(.x=trial,~rcauchy(sample_size,location=theta_0)))

#3.2 for each sample,compute ML est and Median est
cauchy_simulation_df<-mutate(df,ml_est=map_dbl(.x=sample,.f=theta_ml))%>%
  mutate(med_est=map_dbl(.x=sample,.f=median))


#4. pivot
plot_df<-cauchy_simulation_df%>%
  pivot_longer(cols=c(ml_est,med_est))%>%
  mutate(name=map_chr(.x=name,~case_when(.x=="med_est"~"Median",
                                         .x=="ml_est"~"Maximum likelihood")))

#5. create plot
ggplot(plot_df,mapping=aes(x=value,color=name,linetype=name))+
  geom_density()+theme_bw()+xlim(c(4,6))+
  labs(color="",linetype="")+xlab("Estimate")+ylab("Density")
```
|                                    Note                                     |                          Results                          |
|:---------------------------------------------------------------------------:|:---------------------------------------------------------:|
| The distribution of MLE compared with the distribution of the sample median | ![[../../../Attachments/Pasted image 20221201192916.png]] |

   - Compute the mean square error for MLE and for the sample median as estimates of the location parameter.
```r
msefunc<-function(x){return(mean((x-theta_0)^2))}

med_estimate_mean_sqr_error<-cauchy_simulation_df%>%
  pull(med_est) %>% msefunc

med_estimate_mean_sqr_error
```
**Results**
```
[1] 0.02533741
```

   - MLE has a slightly smaller MSE in the simulation study.
```r
ml_estimate_mean_sqr_error<-cauchy_simulation_df%>%
  pull(ml_est)%>% msefunc

ml_estimate_mean_sqr_error
```
**Results** 
```
[1] 0.02062467
```


---

## Property: Is MLE consistent ?
It is known that the maximum likelihood estimate(MLE) is consistent under some natural conditions.
**That means**, we have $\hat \theta(X_1,...,X_n)\to \theta_0 \in \Theta$ as $n\to \infty$.

#### Example1

Suppose $X_1,...,X_n\sim \mathcal{B}(q_0)$ are i.i.d. Bernoulli random variables with an unknown parameter $\mathbb{E}(X_i)=q_0$.
The MLE $\hat q_{\mathrm{MLE}}=\bar X\to q_0$ as $n\to \infty$

#### Example2

Suppose $X_1,...,X_n\sim \mathcal{N}(\mu_0,\sigma_0^2)$ are i.i.d. Gaussian random variables with unknown parameters $(\mu_0,\sigma_0^2)$.
$$
\bar X=\dfrac{1}{n}\sum_{i=1}^{n}X_i \quad  \to \mu_0 \quad \text{as} \quad n\to \infty
$$

$$
\hat \sigma^2=\dfrac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2 \to \hat \sigma_{0}^2 \quad \text{as} \quad n\to \infty
$$




---

## Maximum likelihood and Fisher information
A useful quantity for understanding maximum likelihood estimation is the **Fisher information** given by
$$\mathcal{I}(\theta):=-\mathbb E\left\{\dfrac{\partial ^2}{\partial \theta ^2}\text{log}f_\theta (X)\right\}  \quad \text{ where }X\sim f_\theta$$
![image.png|300](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668770366462-0b45aeff-b36d-4daf-8933-fb64a1a915de.png#averageHue=%23faf9f9&clientId=u41ffe0c3-8c76-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=230&id=ud1422c65&margin=%5Bobject%20Object%5D&name=image.png&originHeight=460&originWidth=928&originalType=binary&ratio=1&rotation=0&showTitle=false&size=120188&status=done&style=none&taskId=uede10775-1792-410e-ad6d-600d0a57bca&title=&width=464)
#### Theorem

Let $\hat \theta$ be the maximum likelihood estimator based on a sample $X_1,...,X_n \sim f_\theta$.
Let $Z\sim \mathcal{N}(0,1)$ be a standard Gaussian random variable. For a sequence of suitably well-behaved i.i.d. random variables $X_1,…,X_n \sim f_\theta$, we have
$$
\lim_{n\to \infty} \mathbb{P}\left(\sqrt{n\mathcal{I}(\theta_0)}(\hat \theta_n-\theta_0)\leq x \right)=\mathbb{P}(Z\leq x)
$$
**Remarks:**

1. The variance of $\hat \theta_n$ is approximately at the level of $\dfrac{1}{n \mathcal{I}(\theta _0)}$ for large $n$.
2. The result implies that $\hat \theta_n$ is a consistent estimator for $\theta_0$.

Cramer and Rao showed that the variance level $\dfrac{1}{n \mathcal{I}(\theta _0)}$ is the best possible


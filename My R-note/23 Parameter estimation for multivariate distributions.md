---
tags: R
Week: 9
type: lecture
lecture: 23
---
>多元分布的参数估计

## The chapter's focus
1. The concept of a <font color=#c10b26>random vector</font>
2. The family of <font color=#c10b26>multivariate Gaussian distributions</font>
3. <font color=#c10b26>Parameter estimation</font> for <font color=#c10b26>multivariate Gaussian distributions</font>

## Multivariate distributions
>多元分布

We often need to think about distributions involving **multiple features**.
![upgit_20221210_1670685078.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670685078.png)

To model <font color=#c10b26>the relationships between these features</font> we must consider **multivariate distributions**
- <u>Univariate analysis</u> is about **a single variable**, e.g., bill length
- <u>Multivariate analysis</u> considers **several variables**, e.g., (bill length, bill depth, body mass)

### Random variables and random vectors

#### Recall the random variables
![[12 Random variables#Definition]]

#### Random vectors

>[!important] Random vectors
>Suppose we have a probability space $(\Omega, \xi, \mathbb{P})$. A random vector is a mapping $X:\Omega\to \mathbb{R}^d$ such that for every $a_1,\cdots,a_d,b_1,\cdots,b_d \in \mathbb{R}$ with each $a_i \leq b_i$, we have $\{\omega \in \Omega: X(\omega)\in \prod_{i=1}^d[a_i,b_i]\}$ is an event in $\xi$ 

**Note**: here the mapping $X$ outputs a vector (with $d$ elements)：$X(\omega):=(X_1(\omega),X_2(\omega),\cdots,X_d(\omega))$.

>[!example]
>Rolling two dice, we model their outcome with a random vector $X$ (the value of $X$ is a pair of numbers e.g. (1,2), (3,3),···).

### Probability density function

#### Recall the probability density function
![[14 Continuous random variables and limit raws#Definition of Probability density function]]


#### Multivariate probability density function
Continuous random <font color=#c10b26>vectors</font> $X:=(X_1,X_2,\cdots,X_d)$ are specified by a <u>multivariate probability density function</u> $f_X : \mathbb{R}^d\to [0,\infty)$ with $\int_{-\infty}^{\infty},\cdots,\int_{-\infty}^{\infty} f_X(x_1,\cdots,x_d)dx_d\cdots dx_1=1$. For all $a_1,\cdots,a_d,b_1,\cdots,b_d\in \mathbb{R}$ with each $a_i\leq a_d$ we have
$$\mathbb{P}(X\in [a_1,b_1]\times \cdots \times [a_d,b_d])=\int_{a_1}^{b_1}\cdots \int_{a_d}^{b_d}f_X(x_1,\cdots,x_d)dx_d\cdots dx_1$$

>[!note] 
>Here $[a_1,b_1]\times \cdots \times [a_d,b_d]$ is a [[10 Finite probability spaces#^8ce3ac|Cartesian product]] defined as follow:
>$[a_1,b_1]\times \cdots \times [a_d,b_d]:=\{(x_1,\cdots,x_d): x_1 \in [a_1,b_1],\cdots,x_d\in [a_d,b_d]\}$


### Multivariate Gaussians
>A classical example of continuous random <font color=#c10b26>variables</font> is a **Gaussian**.
>A classical example of continuous random <font color=#c10b26>vectors</font> is a multivariate Gaussian $X=(X_1,\cdots,X_d)$

>[!info]- **Recall the Gaussian random variable**
>![[14 Continuous random variables and limit raws#^cb670b|Definition of Gaussian random variable]]
>![[14 Continuous random variables and limit raws#Expectation of Gaussian random variables|Expectation of Gaussian random variables]]
>![[14 Continuous random variables and limit raws#The variance of Gaussian random variables|Variance of Gaussian random variable]]

#### Multivariate Gaussians
>A classical example of continuous random <font color=#c10b26>vectors</font> is a multivariate Gaussian $X=(X_1,\cdots,X_d)$

1. Multivariate Gaussian's <font color=#c10b26>parameters</font> are:
	1. A <u>mean vector</u>: $\mu=\mathbb{E}(X) \in \mathbb{R}^d$
	2. A <u>covariance matrix</u>: $\Sigma=\mathbb{E}[(X-\mathbb{E}(X))(X-\mathbb{E}(X))^T]\in \mathbb{R}^{d\times d}$.
		>covariance matrix: 协方差矩阵
2. Multivariate Gaussian's <font color=#c10b26>probability density function</font> $f_{\mu,\Sigma}:\mathbb{R}^d\to (0,\infty)$ is given by:
	$$f_{\mu,\Sigma}(x):=\dfrac{1}{\sqrt{(2\pi)^d |\Sigma|}}\mathrm{exp}\left(-\dfrac{1}{2}(x-\mu)^T \Sigma^{-1}(x-\mu)\right)$$
	where $x\in \mathbb{R}^d$, $|\Sigma|$ is the **determinant** of $\Sigma$, $\Sigma^{-1}$ is the **inverse** of $\Sigma$, and $(x-\mu)^T$ is the **transpose** of $x-\mu$.
	**Note**: if $d = 1$, then the **multivariate Gaussian** defined above reduces to a **univariate Gaussian** that we discussed previously.
3. A <font color=#c10b26>univariate</font> Gaussian and a <font color=#c10b26>bivariate</font> Gaussian:
	![upgit_20221210_1670688531.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670688531.png)


## Parameter estimation for multivariate Gaussians
>多元高斯函数的参数估计

1. Suppose that we have a i.i.d. sample $X_1,X_2,\cdots,X_n \sim \mathcal{N}(\mu,\Sigma)$ from a **multivariate Gaussian distribution**.
2. The <u>population parameters</u> are $\mu:=\mathbb{E}(X)$ and $\Sigma:= \mathbb{E}[(X-E(X))(X-E(X))^T]$
3. <u>Parameter estimation</u>: Given the sample $X_1,\cdots,X_n$ , we want to estimate the population parameter $\mu$ and $\Sigma$.
	1. The sample mean $\bar X$ is both the [[15 Foundations of statistical estimation_ Consistency,bias and variance#Definition of Minimum variance unbiased estimator|MVUE]] and the [[16 An introduction to maximum likelihood estimation#Definition of Maximum likelihood estimate|MLE]] for $\mu$.
	2. $\hat \Sigma_U=\dfrac{1}{n-1}\sum_{i=1}^n(X_i-\bar X)(X_i-\bar X)^T \in \mathbb{R}^{d\times d}$ is the <font color=#c10b26>MVUE</font> for $\Sigma\in \mathbb{R}^{d\times d}$.
	3. $\hat \Sigma_{ML}=\dfrac{1}{n}\sum_{i=1}^n(X_i-\bar X)(X_i-\bar X)^T \in \mathbb{R}^{d\times d}$ is the <font color=#c10b26>MLE</font> for $\Sigma\in \mathbb{R}^{d\times d}$.

#### Example

>[!example]
>Fit a multivariate model for our **Gentoo penguins**

1. Our sample:
	```r
	penguins_gwf<-penguins%>%
	filter(species=="Gentoo")%>%
	select(body_mass_g,flipper_length_mm)
	penguins_gwf
	```
	![upgit_20221210_1670689670.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670689670.png)

2. We model the <font color=#c10b26>body mass</font> and <font color=#c10b26>flipper length</font> with a <u>bivariate Gaussian</u> random vector.
3. We want to fit the model to the data. To do this, we obtain **estimates** of the <font color=#c10b26>population mean</font> and <font color=#c10b26>population covariance</font>.
	1. MLE for population mean:
		```r
		#MLE for mean
		mu_gwf<-map_dbl(.x=penguins_gwf,.f=~mean(.x,na.rm=TRUE))
		mu_gwf
		```
		Results:
		```
		body_mass_g flipper_length_mm 
         5076.016           217.187
		```
		
	2. <font color=#c10b26>MVUE</font> estimate of the <font color=#c10b26>covariance</font> (matrix):
		```r
		#MVUE of covariance
		Sigma_gwf<-cov(penguins_gwf,use="complete.obs")
		Sigma_gwf
		```
		Results:
		```
		                  body_mass_g flipper_length_mm
		body_mass_g        254133.180        2297.14448
		flipper_length_mm    2297.144          42.05491
		```
		
	3. <font color=#c10b26>MLE</font> estimate of the <font color=#c10b26>covariance</font> (matrix):
		```r
		# MLE of the covariance 
		Sigma_gwf_MLE<-cov(penguins_gwf,use="complete.obs")*(n-1)/n
		Sigma_gwf_MLE
		```
		Results:
		```
						  body_mass_g flipper_length_mm
		body_mass_g        252450.179         2281.9316
		flipper_length_mm    2281.932           41.7764
		```
		
4. The **density function of the fitted model** (i.e., the bivariate Gaussian with the estimated mean and covariance)：
	![upgit_20221210_1670690493.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670690493.png)

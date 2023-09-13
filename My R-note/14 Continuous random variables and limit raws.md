---
tags: R
Week: 6
type: lecture
Lecture: 14
---
[Lecture14.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1667989291295-c49ee8b4-99be-4ac5-9c1b-0ca0997c6119.pdf)
## Relevant concepts
>[!important] Relevant concepts
>![[12 Random variables#Definition|Random variables]]


## Continuous random variables
> 连续随机变量

We often want to **model stochastic quantities（建立随机量模型）** which can take on a continuum of possible values（可能值的连续统）.
>[!example] Examples
>- The **wing span** of a penguin selected at random from a population of penguins on an island
>- The **time** taken by an athlete to run the London marathon
>- The **level of rainfall** in a given location on a particular day of the year.

### Definition

Suppose we have a probability space $(\Omega,\xi,\mathbb{P})$.
Recall that a [[12 Random variables#Definition|random variable]] is a mapping $X: \Omega \to \mathbb{R}$  such that for every $a,b\in \mathbb{R}$, the set $$\{\omega\in \Omega : X(\omega)\in [a,b]\}\text{ is an event in }\xi$$
>[!note] Continuous random variables
>A continuous random variable is a random variable $X$ that can <u>take on a continuum of values</u> (rather than a discrete subset of $R$).

#### Example: Uniform distribution
A random variable $X$ that takes any value in $[a,b]$ (for some a<b), and the values of $X$ "**spread evenly**" across $[a,b]$.

### Probability density function(概率密度公式)

^98548d

![[13 Discrete Random variables#PMF Definition|PMF Definition]]

However, for a continuous random variable, we have $P(X = x)=0$ for all $x\in \mathbb{R}$. So we can not map each a to a meaningful probability.
Instead of discussing the probability of $X$ taking on any one single value, we can consider the "**probability per unit length**".
To understand continuous random variable $X:\Omega \in \mathbb{R}$， we require a probability density function $f$.
#### Definition of Probability density function
>[!note] Probability density function
>A **probability density function** (p.d.f) is a function $f: \mathbb{R}\to [0,\infty )$such that 
>$$\int _{-\infty}^{\infty} f(x)\mathrm{d}x =1$$
>A **continuous random variable** is a random variable $X:\Omega\to \mathbb{R}$ with a probability density function $f_X: \mathbb{R}\to[0,\infty)$ such that for all $a,b\in \mathbb{R}$, we have 
>$$\mathbb{P}(X\in [a,b])=\int_a^b f_X(x)\mathrm{d}x$$

If the above equality holds, then we say that $f_X: \mathbb{R}\to[0,\infty)$ is the p.d.f. of the random variable $X:\Omega\to \mathbb{R}$.
>[!info]
>The associated **distribution function** is given by 
$$F_X(x):=\mathbb{P}(X\leq x)=\int _{-\infty}^x f(z)\mathrm{d}z \quad \text{for all} \quad x\in R$$

#### Examples
Random variables with uniform distributions.(分布均匀的随机变量)
For given $a,b \in \mathbb{R}$, define a function
$$f_X(x):=\dfrac{1}{b-a} \mathbb{1}_{[a,b]}(x)=\begin{cases}
\dfrac{1}{b-a},&\quad \text{if }x\in [a,b],\\
0. &\quad \text{otherwise}.
\end{cases}$$

>[!warning] Note
>$f_X$ is a **well-defined probability density** function because $\int _{-\infty}^\infty f_X(x)\mathrm{d}x=1$.

Let $X:\Omega \in \mathbb{R}$ be a random variable satisfying for any $c,d$:
$$P(X\in [c,d])=\int_c^df_X(x)\mathrm{}dx=\dfrac{1}{b-a}\cdot \mathrm{length}([c,d]\cap [a,b])$$
So $X$ is a continuous random variable, and $X$ is said to follow a uniform distribution on $[a,b]$.

---

### Expectation for continuous random variables
#### Definition
>[!note] The expectation for continuous random variables
>The **expectation** of **a continuous random variable** $X$ is defined by
>$$\mathbb{E}(x):=\int_{-\infty}^{\infty} xf(x)\mathrm{d}x$$

#### Example
Let $X$ be a random variable with **uniform distribution** on $[a,b]$, then
$$\mathbb{E}(X)=\int_{-\infty}^\infty xf_X(x)\mathrm{d}x=\int_a^b x \dfrac{1}{b-a}\mathrm{d}x=\dfrac{b+a}{2}$$
#### Expectation is linear
Expectation is <u>linear</u> in the following sense:
Given random variables $X_1,X_2,...,X_K:\Omega\to R$ and numbers $\alpha_1,\alpha_2,...,\alpha_K \in R$, we have
$$\mathbb{E}(\sum_{i=1}^{K}\alpha_iX_i)=\sum_{i=1}^{K}\alpha_i \mathbb{E}(X_i)$$

---

### Variance and standard deviation
#### Definition
>[!note] Variance and standard deviation
>The **variance** of a continuous random variable is given by
>$$\mathrm{Var}(X):=\mathbb{E}[(X-\mathbb{E}(X))^2]=\int_{-\infty}^{\infty}(X-\mathbb{E}(X))^2 f_X(x) \mathrm{d}x$$
>The **standard deviation** of a random variable is defined by
>$$\sigma(X)=\sqrt{\mathrm{Var}(X)}$$

The variance can also **be computed by:**
$$\mathrm{Var}(X):=\mathbb{E}[(X-\mathbb{E}(X))^2]=\mathbb{E}[X^2-2X\cdot \mathbb{E}(X)+(\mathbb{E}(X))^2]=\mathbb{E}(X^2)-[\mathbb{E}(X)]^2$$

#### Example
Let $X$ be a random variable with uniform distribution on $[a,b]$, then
$$\mathrm{Var}(X)=\mathbb{E}(X^2)-[\mathbb{E}(X)]^2=\int_a^b \dfrac{x^2}{b-a}\mathrm{d}x-(\dfrac{b+a}{2})^2=\dfrac{1}{12}(b-a)^2$$

---

### Covariance and correlation
>[!note] Covariance and correlation
>Given a pair of random variables $X,Y:\Omega\to R$,we define the covariance and correlation respectively by
>$$\mathrm{Cov}(X,Y)=E[(X-E(X))\cdot (Y-E(Y))]=E(X\cdot Y)-E(X)\cdot E(Y)$$
>$$\mathrm{Corr}(X,Y):=\dfrac{\mathrm{Cov}(X,Y)}{\sqrt {\mathrm{Var}(X)\mathrm{Var}(Y)}}$$

#### Note
>[!info] Note
>$\mathrm{Cov}(X,X)=\mathrm{Var}(X)$
>$\mathrm{Corr}(X,X)=1$
>if $X,Y$ are independent, then $\mathrm{Cov}(X,Y)=\mathrm{Corr}(X,Y)=0$. 


---

### Variance of linear combination of random variables
> 随机变量线性组合的方差

>[!note] Lemma（辅助定理）
>Given random variables $X_1,X_2,...,X_K:\Omega\to R$ and $\alpha_1,\alpha_2,...,\alpha_K \in R$, we have
>$$\mathrm{Var}(\sum_{i=1}^{K}\alpha_i X_i)=\sum_{i=1}^{K}\alpha_i^2 \mathrm{Var}(Xi)+2\sum_{1\leq i\leq j\leq k}\alpha_i\cdot \alpha_j \mathrm{Cov}(X_i,X_j)$$


---

## Gaussian random variables
> 高斯随机变量

### Definition
>[!note] Gaussian random variables
>A **Gaussian random** variable is a continuous random variable $X$ with the probability density function $f_{\mu,\sigma}:\mathbb{R}\to [0,\infty)$ defined by
>$$f_{\mu,\sigma}(x):=\dfrac{1}{\sigma \sqrt{2\pi}}\mathrm{exp}\left(-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2 \right) \quad \text{for all } x\in R\\=$$
>$$f_{\mu,\sigma}(x):=\dfrac{1}{\sigma \sqrt{2\pi}}e^{\left(-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2 \right) }\quad \text{for all } x\in R$$

^cb670b

>[!info]- Note
>- Here $(\mu,\sigma)$ are **parameters**.
>- $exp(x)$ means **exponent**(指数) =$e^{x}$
> - A **Gaussian random variable** is often referred to as a normal random variable.
> - The distribution of a Gaussian random variable is often referred to as a Gaussian distribution or a normal distribution.
> ![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1668270219278-21488489-eefa-422d-af33-14899fdfd8ac.jpeg)
> - We often write $X \sim \mathcal{N}(\mu,\sigma ^2)$ to mean $X$ is Gaussian with parameters $\mu,\sigma$.
> 	- If $\mu=0$ and $\sigma=1$: the ==**standard Gaussian random variable**== and the **standard Gaussian distribution**. 

^f740fd




#### Proof
To make sure that $f_{\mu,\sigma}$ is a well-defined density we must have $\int_{-\infty}^{\infty}f_{\mu,\sigma}(x)\mathrm{d}x=1$.

To prove this, let's start with the Gaussian integral(高斯积分) $\color{red}\int_{-\infty}^{\infty}e^{-z^2}\mathrm{d}z=\sqrt{\pi}$ and then apply a change of variables $z=\dfrac{x-\mu}{\sigma \sqrt{2}}$ with **derivative(导数)** $\dfrac{\mathrm{d}z}{\mathrm{d}x}=\dfrac{1}{\sigma \sqrt{2}}$,
$$\begin{aligned}\int _{-\infty}^{\infty} f_{\mu,\sigma}(x)\mathrm{d}x=\int_{-\infty}^{\infty}\dfrac{1}{\sigma \sqrt{2\pi}} \mathrm{exp}\left(-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2 \right)\mathrm{d}x
\\
=\dfrac{1}{\sigma \sqrt{2\pi}}\int_{-\infty}^{\infty}\mathrm{exp}(-z^2)(\dfrac{\mathrm{d}z}{\mathrm{d}x})^{-1}\mathrm{d}z
\\
=\dfrac{1}{\sigma \sqrt{2\pi}}\int_{-\infty}^{\infty}e^{-z^2}\cdot (\sigma\sqrt{2})\mathrm{d}z=1\end{aligned}$$

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668276235563-85c9a63f-155e-41f2-86a1-8ed83a6dcfe7.png#averageHue=%23fcfbfb&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=377&id=uf68c168f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=754&originWidth=900&originalType=binary&ratio=1&rotation=0&showTitle=true&size=184793&status=done&style=none&taskId=ud1ec7687-5c45-4cab-8586-080d2589a3f&title=Gaussian%20random%20variables%20distribution&width=450 "Gaussian random variables distribution")
<center>Gaussian random variables distribution</center>


### Expectation of Gaussian random variables
#### Prerequisites

- Recall that the **expectation** of a continuous random variable is defined by 

$E(x):=\int_{-\infty}^{\infty} xf(x)\mathrm{d}x$.

- $f_{\mu,\sigma}(x):=\dfrac{1}{\sigma \sqrt{2\pi}}\mathrm{exp}\left(-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2 \right)$
- $\int_{-\infty}^{\infty}f_{\mu,\sigma}(x)\mathrm{d}x=1$
#### Definition

- **Proof**:
   - $E(X)=\int_{-\infty}^{\infty}xf_{\mu,\sigma}(x)\mathrm{d}x=\int_{-\infty}^{\infty}\mu f_{\mu,\sigma}(x)+(x-\mu)f_{\mu,\sigma}(x)\mathrm{d}x\\=\mu+\int_{-\infty}^{\infty}(x-\mu)f_{\mu,\sigma}(x)\mathrm{d}x$
   - $$\begin{aligned}\int_{-\infty}^{\infty}(x-\mu)f_{\mu,\sigma}(x)\mathrm{d}x=\int _{-\infty}^{\infty}(x-\mu)\cdot \dfrac{1}{\sigma\sqrt{2\pi}}e^{-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2}\mathrm{d}x
\\=[\dfrac{1}{\sigma \sqrt{2\pi}}e^{-\dfrac{1}{2}(\dfrac{x-\mu}{\sigma})^2}\cdot (-\sigma)]_{-\infty}^{\infty}=0-0=0\end{aligned}$$

>[!conclusion] 
>So the **expectation** of the Gaussian random variable is $E(X)=\mu$

---

### The variance of Gaussian random variables

#### Proof
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668290280933-737c6363-4c57-459f-9071-1ba2bec70f32.png#averageHue=%23f8f8f8&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=233&id=u16420e51&margin=%5Bobject%20Object%5D&name=image.png&originHeight=466&originWidth=1184&originalType=binary&ratio=1&rotation=0&showTitle=false&size=128068&status=done&style=none&taskId=u9726c9a0-6816-47c0-9867-0dd4108c8f9&title=&width=592)
#### Definition
>[!note] Variance of Gaussian random variable
>Therefore, the **variance** of a **Gaussian random variable** is
>$$\mathrm{Var}(X)=\sigma^2 \dfrac{1}{\sqrt{\pi}}\int _{-\infty}^{\infty}2z^2e^{-z^2}\mathrm{d}z=\sigma^2$$

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668290334857-a8500f7a-d833-451b-bfbc-0995eb81f7a6.png#averageHue=%23fcfbfb&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=369&id=u95250db5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=738&originWidth=916&originalType=binary&ratio=1&rotation=0&showTitle=false&size=184276&status=done&style=none&taskId=u4f932546-0731-4b66-ba1e-b0c3b952e7c&title=&width=458)

---

### Chi-squared distribution(卡方分布,卡方检验)
A random variable $Q$ is said to be chi-squared with $\color{red}k$ degrees of freedom if $Q=\sum_{i=1}^{k}Z_{i}^2$ with independent $Z_1,Z_2,...,Z_k\sim \mathcal{N}(0,1)$ ([[#^f740fd|Standard Gaussian random variables]]).
We write $Q\sim \chi^2(k)$.
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668290679500-ac540dde-ec3b-4d36-abb3-2e107f5e5cb4.png#averageHue=%23fbfbfa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=277&id=uc0918dd2&margin=%5Bobject%20Object%5D&name=image.png&originHeight=554&originWidth=782&originalType=binary&ratio=1&rotation=0&showTitle=false&size=211451&status=done&style=none&taskId=uf957830f-3b5d-4aa6-9fbc-cf635dfe6ec&title=&width=391)
>[!info]
>Expectation $E(Q)=\sum_{i=1}^{k}E(Z_{i}^{2})=k$

[【统计科普】七分钟轻松掌握卡方检验 - 卡方拟合度检验、卡方独立性检验](https://b23.tv/lbCsqdx?share_source=more&share_medium=ipad&bbid=ZF4349FC8E21FB50478BB149F1339EA6F4F4&ts=1668358647)

---

### Student's t distribution
A random variable $T$ is said to be **t distributed** with $\color{red}k$ degrees of freedom if $T=\dfrac{Z}{\sqrt{Q/k}}$ for two independent random variables $Z\sim \mathcal{N}(0,1)$ and $Q\sim \chi^2(k)$.([[#Chi-squared distribution(卡方分布,卡方检验)|Chi-squared distribution]])
The distribution of $T$ is called a **Student's t distribution**.

- A **t-distributed** random variable has a single parameter $k$.
- The **t distribution** is **symmetric(对称的)**。

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668291014671-57fee5a6-edff-400a-b651-2d1a7054178d.png#averageHue=%23fbfbfa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=279&id=ua017f6ce&margin=%5Bobject%20Object%5D&name=image.png&originHeight=558&originWidth=784&originalType=binary&ratio=1&rotation=0&showTitle=false&size=154585&status=done&style=none&taskId=u5ca4b09e-2f7a-47c2-9446-c01501b2108&title=&width=392)

---

### The cumulative distribution function of a continuous random variables
#### Definition of the Cumulative distribution function
>[!note] Cumulative distribution function
>The **cumulative [[12 Random variables#Distribution functions（分布函数）|distribution function]]** of a **continuous random variable** is given by
>$$F_X(x)=P(X\leq x)=\int _{-\infty}^{x}f(z)\mathrm{d}z$$


For all $z\in R$, we have $f_X(z)=\dfrac{\mathrm{d}F_X(x)}{\mathrm{d}x}|_{z}$
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668291517170-c7ed8a23-a2c6-4869-899d-9f49753de598.png#averageHue=%23fbfbfb&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=193&id=u55c2ccea&margin=%5Bobject%20Object%5D&name=image.png&originHeight=386&originWidth=1298&originalType=binary&ratio=1&rotation=0&showTitle=false&size=82135&status=done&style=none&taskId=ub93213ca-012d-4652-9d15-a2a8ec918a1&title=&width=649)

---

### Quantile function
#### Definition of Quantile function

^b6092a

>[!note] Quantile function
>The **quantile function** $F_X^{-1}:[0,1]\to \mathbb{R}$ is defined by
>$$F_X^{-1}(p):= \mathrm{inf}\{x\in R: F_X(x)=\mathbb{P}(X\leq x)\geq p\} \text{ for } p\in [0,1]$$

- We refer to the values $F_X^{-1}(p)$ for given $p$ as **population quantiles**.
- In particular, $F_X^{-1}(0.5)$ is the **population median** of the **distribution** of $X$

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668291858955-378e7042-26ec-4884-8e57-19e8a3c3c1ea.png#averageHue=%23fcfcfc&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=223&id=u297e3b9d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=446&originWidth=1386&originalType=binary&ratio=1&rotation=0&showTitle=false&size=86073&status=done&style=none&taskId=u8547d82c-25ba-4475-95c1-3249d349cd3&title=&width=693)
>[!question] Questions:
>❓What is $\mathrm{inf}$

---

## The law of large numbers and the central limit theorem
> 大数定律和中心极限定律

![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1668293018373-5f423559-7a3a-460c-b01b-ace7cb1d61e5.jpeg)

- We model reality via the distribution $P_X$ of a random variable $X∶\Omega \to \mathbb{R}$.
- We model our sample as a sequence of random variables $X_1,\cdots,X_n$ (independent copies of $X$).
### Independent and identically distributed random variables
> 独立同分布随机变量

#### Definition
Recall that the distribution is $\mathbb{P}_{X}(S)=\mathbb{P}(X \in S)$ for a reasonable subset $S$ of $\mathbb{R}$. Also the cumulative distribution function is $F_{X}(x)=\mathbb{P}(X\leq x) \text{ for } x \in R$.

>[!note] i.i.d random variables
>We say that $X_1,...,X_n$ are **independent and identically distributed (i.i.d.)** if
>1. The sequence $X_1,…,X_n$ consists of mutually **independent random variables**
>2. For all $x\in R$, we have $F_{X_1}(x)=F_{X_2}(x)=\cdots =F_{X_n}(x)$.

Note that the condition 2. is equivalent to $P_{X_1}=P_{X_2}=...=P_{X_n}$.
In particular, we refer to $X_1,...,X_n$ as **independent copies** of $X$ if $$P_{X}=P_{X_1}=P_{X_2}=...=P_{X_n}$$
### The law of large numbers
Sequences of i.i.d. random variables are surprisingly well-behaved.
Given the roll of a single fair dice the outcome $X$ is highly unpredictable.
However, suppose we take **a very large number of independent dolls** of a fair dice rolls $X_1,…,X_n$, and then compute the sample average of the sequence $\dfrac{1}{n}\sum_{i=1}^{n}X_i$.
Then we expect the sample average $\dfrac{1}{n}\sum_{i=1}^{n}X_i$ to be close to $\mathbb{E}(X)=\dfrac{7}{2}$ for large $n$.

>[!question] Question
>❓Why the outcome is $\mathbb{E}(X)=\dfrac{7}{2}$?

This is an example of a law large numbers

#### Definition
>[!note] **Law of large numbers**
>the sample mean approaches the population mean in some sense when the sample size is large.

#### Sample mean of dice rolls
The sample average of the sequence $\dfrac{1}{n}\sum_{i=1}^{n}X_i$ of independent dice rolls.
```r
num_trials<-1000000 #set the number of trials
set.seed(0) #set the random seed
sample_size<-2 # set the sample size

# simulate the sample average of a dice roll:
# add columns dice_sample(1...6) and sample_avg(sample average)

dice_sample_average_simulation<-data.frame(trial=1:num_trials)%>% 
mutate(dice_sample=map(.x=trial,~sample(6,sample_size,replace=TRUE)))%>%
mutate(sample_avg=map_dbl(.x=dice_sample,~mean(.x)))

# plot a histogram to display the results
dice_sample_average_simulation%>%
ggplot(aes(x=sample_avg))+
geom_histogram(aes(y=..count../sum(..count..)),
                 binwidth=1/sample_size,fill="blue",color="blue")+
theme_bw()+xlim(c(1,6))+
xlab("Sample average")+ylab("Proportion")
```
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668332599703-cf5a4299-c4f4-48c5-bf22-affefceec23d.png#averageHue=%23f6f6f6&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=292&id=u117e9672&margin=%5Bobject%20Object%5D&name=image.png&originHeight=584&originWidth=856&originalType=binary&ratio=1&rotation=0&showTitle=true&size=56019&status=done&style=none&taskId=u8554e6e9-adfc-4a7d-8979-ca0d3529e36&title=dice_sample_average_simulation&width=428 "dice_sample_average_simulation")

| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668332354033-e124ddea-8d4d-4a0e-9bce-8167777f425f.png#averageHue=%23a6a6fb&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=258&id=nXGxw&margin=%5Bobject%20Object%5D&name=image.png&originHeight=516&originWidth=836&originalType=binary&ratio=1&rotation=0&showTitle=true&size=27691&status=done&style=none&taskId=u864097b2-be9c-4540-95cc-eed877fca76&title=Sample%20size%20n%3D2&width=418 "Sample size n=2") | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668332867517-d7bea62c-47a1-4711-ae3b-10c6e9d53e39.png#averageHue=%23bfbffa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=u0363a4fe&margin=%5Bobject%20Object%5D&name=image.png&originHeight=526&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=true&size=30995&status=done&style=none&taskId=ua62cfcc6-8af3-45b0-8391-ed83a1963bb&title=Sample%20size%20n%3D5&width=426 "Sample size n=5") | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668332919626-2c353f12-b6ce-4f77-aee6-5b2f3f823524.png#averageHue=%23fafafa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=u4c986b54&margin=%5Bobject%20Object%5D&name=image.png&originHeight=526&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=true&size=29924&status=done&style=none&taskId=u72cc00e8-e28a-40b9-9e8e-f5505c59342&title=Sample%20size%20n%3D10&width=426 "Sample size n=10") |
| --- | --- | --- |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668333037341-e45d13ab-77fd-46c0-a002-56d2fa8d8003.png#averageHue=%23f9f9f9&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=u9133e5d0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=526&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=true&size=32524&status=done&style=none&taskId=uc4fd5078-e532-4332-9e00-92c8551ad80&title=Sample%20size%20n%3D25&width=426 "Sample size n=25") | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668333065320-f2efe099-ed88-4960-8b3d-5853f0ea9ea4.png#averageHue=%23fafafa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=uaf120992&margin=%5Bobject%20Object%5D&name=image.png&originHeight=526&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=true&size=34588&status=done&style=none&taskId=u74bb6423-a8c2-494f-a28b-92c92aae0c6&title=Sample%20size%20n%3D100&width=426 "Sample size n=100") | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668333268469-019743bb-24cf-44ac-9473-6234dec66ed6.png#averageHue=%23fafafa&clientId=u358df708-67bc-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=263&id=u0e34040b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=526&originWidth=852&originalType=binary&ratio=1&rotation=0&showTitle=true&size=28231&status=done&style=none&taskId=u23cae798-de6b-43ee-98b9-c251f534a5c&title=Sample%20size%20n%3D1000&width=426 "Sample size n=1000") |

#### Theorem
The law of large numbers tells us that the sample average **converges** towards the expectation, for sequences of independent and identically distributed random variables.
>[!info] Theorem (Bernoulli, circa. 1700, the weak laws of large numbers)
> Let $X:\Omega\to \mathbb{R}$ be a random variable with a well-defined expectation $\mu=E(X)$.
> Let $X_1,...,X_n:\Omega\to \mathbb{R}$ be a sequence of independent copies of $X$. Then for all $\epsilon >0$,
> $$\lim_{n\to \infty} \mathbb{P}\left(\, \middle| \dfrac{1}{n}\sum X_i-\mu \middle| \geq \epsilon \,\right)=0$$

^1b582b

The probability of the event that the distance between the sample mean $\dfrac{1}{n}\sum_{i=1}^{n}X_i$; and the population mean bigger than a small number $\epsilon$ can be arbitrarily small (if n is large enough). And we say that the sample mean converges to the population mean in probability.

#### Intuition:
Suppose that $X$ has expectation $E(X)=\mu$ and variance $\mathrm{Var}(X)=\sigma^2$.
Since $X_1,...,X_n$ are independent copies of $X$, we have $E(X_i)=\mu$ and $\mathrm{Var}(X)=\sigma^2$. So
$$E(\dfrac{1}{n}\sum_{i=1}^{n}X_i)=\dfrac{1}{n}\sum_{i=1}^{n}E(X_i)=\dfrac{1}{n}\sum_{i=1}^{n}\mu=\mu
$$
$$
\mathrm{Var}(\dfrac{1}{n}\sum_{i=1}^{n}X_i)=(\dfrac{1}{n})^2\sum_{i=1}^{n}\mathrm{Var}(X_i)=(\dfrac{1}{n})^2(n\cdot \sigma^2)=\dfrac{\sigma^2}{n}$$

This suggests that $\color{red}\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu$ is a random variable which shrink to zero as $n$ goes to infinity.

---

Looking into the distribution of $\color{red}\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu$
>[!tip]
>To gain further insight we can **zoom in(放大)** and consider the **renormalised deviations**
>$$G_n=\sqrt{\dfrac{n}{\sigma^2}}\left(\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu\right)$$
>Hence $\mathrm{Var}(G_n)=1 \text{ for all } n\in \mathbb{N}$

#### The central limit theorem

> [!info] $\text{Theorem(Lindeberg-Levy) The central limit theorem}$
> Let $X:\Omega \to \mathbb{R}$ be a random variable with expectation $\mu=E(X)$ and variance $\sigma^2=\mathrm{Var}(x)$. Let $X_1,\cdots,X_n:\Omega \to \mathbb{R}$ be a sequence of independent copies of $X$. Let $Z\sim \mathcal{N}(0,1)$ be a standard Gaussian random variable. Then for all $x\in \mathbb{R}$,
> $$\lim_{n\to \infty}\mathbb{P} \left\{ \sqrt{\dfrac{n}{\sigma^2}}\left(\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu\right)\leq x\right\}=\mathbb{P}(Z\leq x)$$

^ef9bb0

The distribution of $G_n=\sqrt{\dfrac{n}{\sigma^2}}\left(\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu\right)$converges to the standard Gaussian distribution $\mathcal{N}(0,1)$.
#### Sample mean of dice rolls(renormalized)
Renormalised sample average of independent dice rolls: $G_n=\sqrt{\dfrac{n}{\sigma^2}}\left(\dfrac{1}{n}\sum_{i=1}^{n}X_i-\mu\right)$

| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338652272-e6710a37-682f-4770-a9a8-ff51cbea2f72.png#averageHue=%23f5f4ef&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=320&id=u3ccee510&margin=%5Bobject%20Object%5D&name=image.png&originHeight=640&originWidth=704&originalType=binary&ratio=1&rotation=0&showTitle=false&size=57577&status=done&style=none&taskId=ub6fc24e1-fed2-41d8-bf41-c441a24d7b9&title=&width=352) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338686364-cfbb4c24-652b-4255-b7c8-0bdd9be3d2de.png#averageHue=%23f0efe8&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=179&id=u8a4c06f1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=636&originWidth=808&originalType=binary&ratio=1&rotation=0&showTitle=false&size=120322&status=done&style=none&taskId=ucd00082e-e24e-40e8-a75a-d4ad0e60217&title=&width=228) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338717927-7e62b71d-4470-4e95-8603-d6419b041f7b.png#averageHue=%23fbfbfb&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=334&id=u74653d86&margin=%5Bobject%20Object%5D&name=image.png&originHeight=668&originWidth=818&originalType=binary&ratio=1&rotation=0&showTitle=false&size=82008&status=done&style=none&taskId=uffc4a5af-ac21-4a0a-a68e-c8cb730cba0&title=&width=409) |
| --- | --- | --- |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338729063-6cc9aee6-4c5e-43bf-ab67-1f5e36ff0674.png#averageHue=%23fbfbfb&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=318&id=u4af6a3b5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=636&originWidth=806&originalType=binary&ratio=1&rotation=0&showTitle=false&size=111400&status=done&style=none&taskId=u1a4ced07-248d-4e61-b199-d5d6e8b58ab&title=&width=403) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338745882-460014c1-a9c0-4496-91e0-e0d3190c672b.png#averageHue=%23fbfbfb&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=331&id=u852180e8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=662&originWidth=816&originalType=binary&ratio=1&rotation=0&showTitle=false&size=119284&status=done&style=none&taskId=u132cfecf-0b70-48dd-8342-25ca732c2d6&title=&width=408) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668338758146-affe1e94-87f4-418b-9e85-bccf5ec3ba4e.png#averageHue=%23fbfbfb&clientId=ub641eda7-b8e8-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=320&id=uac53ffc0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=640&originWidth=812&originalType=binary&ratio=1&rotation=0&showTitle=false&size=117640&status=done&style=none&taskId=u0427d95e-fecb-4c8d-9650-d907c00382b&title=&width=406) |

>[!question] 
>How to ==get this diagram==?






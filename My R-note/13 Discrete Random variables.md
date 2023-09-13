---
tags: R
Week: 5
type: lecture
---

Lecture: 13
---

(离散型随机变量)

>[!important] Relevant concepts
>[[10 Finite probability spaces#Finite probability spaces|Probability space]]
>![[11 Conditional probability, Bayes rule and independence#^9bce10|Independent and dependent]]
>![[12 Random variables#^b370ee|Random variables]]
>![[12 Random variables#Distribution Definition|Distribution function]]


---

## Discrete random variables
### Discrete random variables definition
**Support of a distribution:** We say that the distribution of a random variable $X:\Omega\to \mathbb{R}$ is supported on a set $A\subseteq \mathbb{R}$ if $P_X(A):=\mathbb{P}(X\in A)=1$
>[!info]
A **discrete random variable** is a random variable $X:\Omega\to \mathbb{R}$ who's distribution is supported on a discrete(and hence finite or countably infinite)set $A\subseteq \mathbb{R}$

### Examples:

1. The distribution of a Bernoulli random variable $X$ is supported on $\{0,1\}$, hence a discrete random variable.
2. The distribution of a random dice roll $Z$ is supported on $\{1,2,…,6\}$,hence a discrete random variable.

---

## Probability mass function
Let $X∶\Omega \to \mathbb{R}$ be a random variable with distribution supported on **a finite or countably infinite set**  (e.g. a discrete random variable).
### PMF Definition
>[!note] PMF definition
>The probability mass function of $X$ is the function $p_X:\mathbb{R}\to[0,1]$ defined by 
>$$p_X(x):=P_X({x})=\mathbb{P}(X=x),$$
>where $P_X$ is the distribution of $X$.

#### Key features

1. For all $x\in \mathbb{R}, p_X(x)\geq 0.$
2. The values of the probability mass function sum to unity $\sum _{x\in \mathbb{R}}p_X(x)=1$

A probability mass function is a function on $\mathbb{R}$, while a probability vector （in a finite probability space）"maps" elements in $\Omega$ to their probability.

### Expectation of a random variable
>[!note] Expectation of a random variable
The **expectation** $E(X)$ of the [[12 Random variables#Random variables|random variable]] $X$ is defined by 
$$E(X):=\sum _{x\in \mathbb{R}}x\cdot p_X(x)$$

**Note**：
1. The expectation is often referred to as the **population average** or **population mean**.
2. We can view the expectation of a random variable as the long-run sample average obtained by repeatedly sampling independent copies of $X$.
>[!info]- Sample mean
>![[07 Exploratory data analysis^]]


### Variance and standard deviation

>[!note] Variance and standard deviation
The **variance** $\mathrm{Var}(X)$ of the random variable $X$ is defined by
$$\mathrm{Var}(X):=\mathrm{E}[(X-\mathrm{E}(X))^2].$$
The standard deviation of $X$ is defined by 
$$\sigma (X)=\sqrt {\mathrm{Var}(X)}.$$

**Note**:

1. We can view the variance of a random variable as measuring how much it typically **fluctuates around its expectation** $E(X)$ upon repeatedly sampling independent copies of $X$.
2. The variance of a random variable is often referred to as the population variance. 100%
3. The **population variance and sample variance** are closely connected, as we shall see.
>[!info]- Variance and standard deviation for sample mean
>![[07 Exploratory data analysis#6. Sample variance and sample standard deviation|Variance and standard deviation]]

#### PMF,Expectation,Variance:examples

>[!example] **Example1**
Example. Let $Z$ be the random variable of a dice roll. The probability mass function is given by
$$p_Z(x)=\begin{cases}\dfrac{1}{6},\quad \text{if x}\in \{1,2,...6\}.\\0,\quad\text{otherwise.} \end{cases}$$

- **The expectation:**

$$\mathbb{E}(Z):=(1+2+...+6)\times \dfrac{1}{6}+\underbrace{\sum_{x\in \mathbb{R}\setminus 0,1}x\cdot p_Z(x)}=\dfrac{7}{2}$$

- **The variance:**

$$\mathrm{Var}(Z):=\mathbb{E}[(Z-\mathbb{E}[Z])^2]=\dfrac{1}{6}\sum_{i=1}^{6}(x-\dfrac{7}{2})^2=\dfrac{35}{12}$$

>[!example] **Example2**
>Example. Let $X\sim \mathcal{B}(q)$ be a **Bernoulli random variable**. The probability mass function is given by
>$$p_X(x)=\begin{cases}
1-q & \quad\text{if }x=0,
\\q & \quad\text{if }x=1,
\\0 & \quad\text{otherwise}.\end{cases}$$

![[12 Random variables#Bernoulli distribution and Bernoulli random variables|Bernoulli random variable]]


- **The expectation of Bernoulli distribution:**
	$$\mathbb{E}(X)=(1-q)\times 0+q\times 1+\sum_{x\in \mathbb{R}\setminus 0,1}x\cdot p_X(x)=q$$ ^abe903
- **The variance of Bernoulli distribution:**
	$$\mathrm{Var}(X)=\mathbb{E}[(X-\mathbb{E}[X])^2]=\sum_{x\in \mathbb{R}}p_X(x)\cdot (x-q)^2=(1-q)\cdot q^2+q\cdot (1-q)^2=q(1-q)$$ ^5431bb

---

### Covariance(population)

- Suppose that $X:\Omega\to \mathbb{R}$ and $Y:\Omega\to \mathbb{R}$ are random variables.
>[!note] Covariance
>The covariance between $X$ and $Y$ is defined by
>$$\mathrm{Cov}(X,Y):=E[(X-\bar X)\cdot (Y-\bar Y)]$$
>where $\bar X$ and $\bar Y$ are the expectations of $X$ and $Y$,respectively.

#### Note:

1. $\mathrm{Cov}(X,X)=\mathrm{Var}(X)$
2. The covariance between random variables is a **population analogue** of the sample covariance.
>[!info]- Sample Covariance
>![[07 Exploratory data analysis#Sample covariance]]

---

### Correlation(population)
#### Definition:
>[!note] Corraltion:
>The (population) correlation is given by
>$$\mathrm{Corr}(X,Y)=\dfrac{\mathrm{Cov}(X,Y)}{\sqrt{\mathrm{Var}(X)\cdot \mathrm{Var}(Y)}}$$

The correlation gives a scale-invariant quantification of the linear relation between $X$ and $Y$.

#### Key facts:

1. If $X$ and $Y$ are **independent** random variable, then $\mathrm{Corr}(X,Y)=\mathrm{Cov}(X,Y)=0$.
2. However, $\mathrm{Cov}(X,Y)=0$ <font color=#c10b26>doesn't</font> necessarily mean that $X$ and $Y$ are independent.

>[!info]- Sample Correlation
>![[07 Exploratory data analysis#Sample correlation]]
>



---

### The variance of a linear combination of random variables
Let $X∶\Omega \to \mathbb{R}$ be a random variable with distribution supported on **a finite or countably infinite set**  (e.g. a discrete random variable).
> **The variance of a linear combination of random variables** $\sum_{i=1}^K \alpha_iX_i$
> Given random variables $X_1,…,X_k:\Omega \to \mathbb{R}$ and $\alpha_1,...\alpha_k\in \mathbb{R}$,we have
> $$\mathrm{Var}(\sum_{i=1}^K \alpha_iX_i)=\sum_{i=1}^K \alpha_i^2 \mathrm{Var}(X_i)+2\sum _{a\leq i\leq j\leq K}\alpha_i \alpha_j \mathrm{Cov}(X_i,X_j)$$

#### Note:
In particular, if $X_1,...,X_k$ are **independent**, then
$$\mathrm{Var}(\sum_{i=1}^K \alpha_iX_i)=\sum_{i=1}^K \alpha_i^2 \mathrm{Var}(X_i)$$


---

## Independent and dependent random variables
### Definition:
- Suppose that $X_1,…,X_k:\Omega \to \mathbb{R}$ are random variables, with distributions $F_{X_1},…,F_{X_k}:\mathbb{R}\to [0,1]$ defined by $F_{X_k}(x_k):=P(X_k\leq x_k)$ for all $x$ in $\mathbb{R}$.
- We define the **joint cumulative distribution** function $F_{{X_1},...,X_k}:\mathbb{R}^k\to \mathbb{R}$by $F_{{X_1},...,X_k}(x_1,…,x_k)=P(\{X_1\leq x_1\}\cap...\cap\{X_k\leq x_k\})$for all$(x_i,...,x_k)\in \mathbb{R}^k.$

>[!note] Definition: Independent random variables
>We say that $X_1,…X_k$ are (mutually) independent if for all $x_1,...x_k\in \mathbb{R}$ we have
>$$F_{{X_1},...,X_k}(x_1,…,x_k)=F_{X_1}(x_1)\times...\times F_{X_k}(x_k)$$

Equivalently, $X_1,…,X_k$ are independent if for all $x_1,...,x_k\in \R$ the sequence of events $\{X_1\leq x_1\},...,\{X_k\leq x_k\}$ are (mutually) independent, i.e,
$$P(\{X_1\leq x_1\}\cap,...,\cap \{X_k\leq x_k\})=P(X_1\leq x_1)\cdot P(X_2\leq x_2)...P(X_k\leq x_k)$$

We say that $X_1,...,X_k$ are **dependent** if they are **not independent**.

### Examples:
#### Example-Independence
Suppose that I roll $k$ **dice** and let $X$; correspond to the results of the $i$-th dice.
Hence, we can model $X_1,...X_k$ as a sequence of independent random variables.
#### Example-dependence
Suppose that we flip coins and let $Z_j$be 1 if the $j-th$coin was a head and 0 otherwise.
For each $i=1,...,k$ let $X_i=Z_1+Z_2+...+Z_i$,the accumulated total.
The sequence $X_1,...X_k,$is a dependent sequence of random variables.
### An alternative perspective on independence
> Let $X_1,…,X_k:\Omega \to \mathbb{R}$ be a sequence of random variables.Then $X_1,…,X_k$ are independent if and only if the following relationship holds for every sequence of well-behaved function $(\dagger) f_1,f_2,...,f_k$,
> $$E(f_1(X_1)...f_k(X_k))=E(f_1(X_1))...E(f_k(X_k)).$$

---

## Binomial distributions（二项分布）
### Definition
The Binomial distribution allows us to model the number of successes out of $n$ **independent** trials, where each trial has a success probability $p$.
>[!note] Binomial distributions
>Suppose that $X_1,…,X_n$ are independent random variables where each $X_i \sim \mathcal{B}(p)$ has Bernoulli distribution with $E(X_i)=p$.
>Then the sum $Z= X_{1}+\cdots +X_n$ is a Binomial random variable with parameters $n$ and $p$.

#### Examples:

1. The number of red balls drawn from a bag whilst sampling with replacement. 
2. The number of patients who recover following treatment in a clinical trial. 
3. The number of customers who decide to buy a car following a test drive.

###  PMF,Expectation,Variance of Binomial distributions

- Recall that for $X_i \sim \mathcal{B}(p)$, we have $E(X_i)=p$ and $\mathrm{Var}(X)=p(1-p)$.
- Recall that given$X_i\sim \mathcal{B}(p)$,the sum $Z= X_{1}+\cdots+X_n$ is a Binomial random variable with parameters $n$ and $p$.
#### Probability mass function
$$p_Z(r)=\begin{cases}
P(Z=r)=(_r^n)\cdot p^r\cdot (1-p)^{n-r}&\quad \text{for }r\in\{0,1,...,n\}\\
0 &\quad \text{for }r\notin \{0,1,...,n\}
\end{cases}$$
#### Expectation
$$E(Z)=E(X_1+X_2+...+X_n)=E(X_1)+...+E(X_n)=np$$

#### Variance
$$\mathrm{Var}(Z)=\mathrm{Var}(X_1+X_2+...+X_n)=\mathrm{Var}(X_1)+\mathrm{Var}(X_2)+...+\mathrm{Var}(X_n)=n\cdot p\cdot (1-p)$$

#### Examples:

- Probability mass function $p_Z$ with $p=\dfrac{1}{3}$ and $n=5$
 ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666955382949-a0a21226-4c3e-4962-87e1-ced97599e8be.png#averageHue=%23fcfdf6&clientId=u3b79aa64-b9f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=295&id=u9217387c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=590&originWidth=886&originalType=binary&ratio=1&rotation=0&showTitle=true&size=107231&status=done&style=none&taskId=u7dce6f52-a3d5-4104-b886-ae54080baf4&title=%E5%85%B1%E5%AE%9E%E9%AA%8C5%E6%AC%A1%EF%BC%8C%E5%85%B6%E4%B8%AD%E6%88%90%E5%8A%9F%E7%9A%84%E6%AC%A1%E6%95%B0%E7%9A%84%E6%A6%82%E7%8E%87%E3%80%82%E6%9C%89%E5%9B%BE%E5%8F%AF%E7%9F%A5%EF%BC%8C5%E6%AC%A1%E5%AE%9E%E9%AA%8C%E5%86%85%E6%88%90%E5%8A%9F1%E6%AC%A1%E5%92%8C2%E6%AC%A1%E7%9A%84%E6%A6%82%E7%8E%87%E6%9C%80%E9%AB%98&width=443 "共实验5次，其中成功的次数的概率。有图可知，5次实验内成功1次和2次的概率最高")
<center>共实验5次，其中成功的次数的概率。有图可知，5次实验内成功1次和2次的概率最高</center>

- Probability mass function with $p_Z$ with $p=\dfrac{1}{3}$

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666955418106-cbc615e1-9f65-46b7-9923-076c68878cc1.png#averageHue=%23fbfbfb&clientId=u3b79aa64-b9f3-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=392&id=u21b8bc1a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=784&originWidth=1368&originalType=binary&ratio=1&rotation=0&showTitle=false&size=181636&status=done&style=none&taskId=u4975dd18-2648-4181-a546-97b391e25c6&title=&width=684)


---
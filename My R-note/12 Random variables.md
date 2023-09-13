---
tags: R
Week: 5
type: lecture
Lecture: 12
---
## Random variables
### Definition
>[!note] Random variables
>Suppose we have a probability space $(\Omega,\xi,\mathbb{P})$. A random variable is a mapping $X:\Omega\to \mathbb{R}$, such that
>$\text{for\:every}\:a,b\in \mathbb{R},\{w\in\Omega:X(w)\in[a,b]\}$ is an event in $\xi$

^b370ee


![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666772384885-71b3a9ef-57c5-4586-87dd-e1a61c327655.png#averageHue=%23fafbf9&clientId=ud6e6e554-0a5b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=198&id=u296ea987&margin=%5Bobject%20Object%5D&name=image.png&originHeight=396&originWidth=956&originalType=binary&ratio=1&rotation=0&showTitle=false&size=181372&status=done&style=none&taskId=u604ea555-a075-40ab-a997-2933fafca29&title=&width=478)

#### Remark
The condition that "$\text{for\:every}\:a,b\in \mathbb{R},\{w\in\Omega:X(w)\in[a,b]\}$ is an event in $\xi$" is essential. 
With this definition, we can describe events efficiently with the values of $X$:
- $\{w\in\Omega:X(w)\in[a,b]\}$ always represent an event. 
- $P(\{w\in\Omega:X(w)\in[a,b]\})$ is always well defined.

### Examples
#### Example1
>[!example] We roll 5 dices in a row and record each of the results.
>The sample space is $\Omega=\{1,2,...,6\}^5=\{(x_1,...,x_5):x_i\in\{1,...,6\}\}$.
>We can define a random variable as the result of the final dice roll, $X((x_1,x_2,...,x_5))=x_5$.
>$\{w\in\Omega:X(w)\in[1,1]\}=\{(x_1,...,x_4,1):x_i\in \{1,...,6\}\}$ is an event.

#### Example2
>[!example] sampling with replacement: We sample 10 balls with replacement from a bag of 100 balls, 50 of which are red.
>The sample space is $\Omega=\{1,...,100\}^{10}=\{(x_1,...x_{10}):x_i\in\{1,...,100\}\}.$ The numbers $1,\cdots,50$ represent red balls.
>We can define a random variable as the number of **red balls sampled** $X((x_1,..x_{10}))=\sum _{i=1}^{10}1_{(1,...,50)}(x_i)$

### Notations related to random variables
#### Events
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666774623375-82da53c0-8138-4c4e-862d-aed3005d5871.png#averageHue=%23f1f1ef&clientId=ud6e6e554-0a5b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=141&id=ud637d307&margin=%5Bobject%20Object%5D&name=image.png&originHeight=282&originWidth=1246&originalType=binary&ratio=1&rotation=0&showTitle=false&size=276585&status=done&style=none&taskId=ue0dd8c2e-bec9-4444-a030-8f14dca2964&title=&width=623)
#### Probability
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666774604114-8dc1e3fa-64c3-418e-8f7e-cbcf3931fb5d.png#averageHue=%23f1f1f1&clientId=ud6e6e554-0a5b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=141&id=ua4098420&margin=%5Bobject%20Object%5D&name=image.png&originHeight=282&originWidth=1292&originalType=binary&ratio=1&rotation=0&showTitle=false&size=104010&status=done&style=none&taskId=u01bf3dff-102d-46b1-8085-d48c30cfb26&title=&width=646)
## Distribution
### Distribution Definition
>The distribution of a random variable $X$ is a function given by
>$$S\to P_X(S):=\mathbb{P}(X\in S)=\mathbb{P}(\{w\in\Omega:X(w)\in S\})$$
>for any $S\subseteq \mathbb{R}$ in a well-behaved collection of subsets of $\mathbb{R}(\dagger)$.

>[!note] About notations $\dagger$
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666775293863-a2e6fcf7-5eab-411d-b27b-2a843b1cb0b8.png#averageHue=%23e9e9e8&clientId=ud6e6e554-0a5b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=71&id=u64795a09&margin=%5Bobject%20Object%5D&name=image.png&originHeight=150&originWidth=1278&originalType=binary&ratio=1&rotation=0&showTitle=false&size=216330&status=done&style=none&taskId=ue03c8dee-876d-4c32-ab7c-7c1f30530b1&title=&width=603)

>[!note] About notation $P_X$
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666775499718-40f4f224-1d3d-46e7-a2d3-07683faac9a6.png#averageHue=%23ebebe9&clientId=ud6e6e554-0a5b-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=69&id=u8e50eb47&margin=%5Bobject%20Object%5D&name=image.png&originHeight=138&originWidth=1188&originalType=binary&ratio=1&rotation=0&showTitle=false&size=169235&status=done&style=none&taskId=u240e1702-c53f-4df1-9dbd-d48704ceaa2&title=&width=594)

> [!info] Theorem (Distribution of random variables)
> Suppose we have a probability space $(\Omega, \xi, \mathbb{P})$ along with a random variable $X：\Omega \to \mathbb{R}$. The distribution $P_X$ defined by $P_X(S) = P(X \in S)$ for $S \in \mathcal{B}(\mathbb{R})$ satisfies
> 1. For all $S \in \mathcal{B}(\mathbb{R})$, we have $P_X(S)=P(X\in S)\geq 0$.
> 2. We have $P_X(\mathbb{R}) = \mathbb{P}(X \in \mathbb{R}) = 1$
> 3. Given a sequence of disjoint sets $A_1, A_2,…\in \mathcal{B}(R)$, we have $P_X(\cup _{j} A_j)= \sum _{j} P_{X}(A_j)$.


### Distribution functions（分布函数）
#### Definition
>[!info] Distribution functions
>The distribution function of a random variable $X$ is the map $F_X:\mathbb{R} \to [0,1]$ defined by
>$$F_X(x)=\mathbb{P}(X\leq x) \:\text{for} \:x\in \mathbb{R}$$

#### Note
- The distribution function $F_X$ is also referred to as the **probability distribution** **function** or the **cumulative distribution function**.(累加分布函数) ^d7d3d1
- The distribution function $F_x$ is a **non-decreasing function** on $\mathbb{R}$
- Equivalently, the distribution function is given by $F_X(x)=P_X((-\infty,x])$.

#### Examples
##### Example1: Rolling a fair dice
<u>Sample space</u> $\Omega=\{\omega_1,...,\omega_6\}$ where $w_i$ corresponds the $i-th$ face lands face-up.
<u>Random variable</u> $(\Omega\to \mathbb{R})$: $Z(\omega_i)=i$
<u>Distribution</u> $(\mathcal{B}(\mathbb{R})\to \mathbb{R})$: $$P_Z(S)=\mathbb{P}(Z\in S)=\mathbb{P}(Z\in S \cap \{1,...,6\})=\dfrac{|S\cap \{1,...,6\}|}{6}=\dfrac{1}{6}\sum_{x\in \{1,...,6\}}\mathbb{1}_S(x)$$
<u>Distribution function</u> $(\mathbb{R}\to [0,1])$: $F_Z(x)=\mathbb{P}(Z\leq x)$
$$F_Z(X)=\begin{cases}
0 & \quad \text{if } x<1,\\
\dfrac{1}{6} &\quad \text{if } 1\leq x<1,\\
\vdots\\
\dfrac{5}{6} &\quad \text{if } 5\leq x<6,\\
1 &\quad \text{if } 6\leq x.
\end{cases}$$

##### Example2: A customer in a dealership either buys a car or doesn't buy a car
<u>Sample space</u> $\Omega=\{\omega_0,\omega_1\}$ for outcomes $w_1$ (buy a car, with probability $q$) and $\omega_0$ (doesn't buy a car).
<u>Random variable</u>  $(\Omega\to \mathbb{R})$: $X(\omega_i)=i$ for $i=0.1$ 
<u>Distribution</u> $(\mathcal{B}(\mathbb{R})\to \mathbb{R})$: $P_X(S)=\mathbb{P}(X\in S)=(1-q)\mathbb{1}_S(0)+q\mathbb{1}_S(1)$
<u>Distribution function</u> $(\mathbb{R}\to [0,1])$: $F_X(x)=\mathbb{P}(X\leq x)$
$$F_X(X)=\begin{cases}
0 &\quad \text{if } x<0,\\
1-q &\quad \text{if } 1\leq x<1,\\
1 &\quad \text{if } 1\leq x.
\end{cases}$$


[Lecture12.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1666817875641-b8d66709-16fd-4fb3-823d-abf88138b75a.pdf)

### Bernoulli distribution and Bernoulli random variables

#### Definition: Bernoulli distribution 
>[!important] **Bernoulli distribution**. 
>A distribution $P_X$ is called a [[10 Finite probability spaces#Bernoulli distribution|Bernoulli distribution]] if there exist some $q\in [0,1]$,such that
>$$P_X(S)=\mathbb{P}(X\in S)=(1-q)\mathbb{1}_S(0)+q\mathbb{1}_S(1)$$
>We say a random variable $X:\Omega\to \mathbb{R}$ is Bernoulli if $P_X$ is a Bernoulli distribution.

**伯努利分布就是n重二项分布**

#### Bernoulli random variable:
- We write $X \sim \mathcal{B}(q)$ for a Bernoulli random variable $X$ with $\mathbb{P}(X=1)=q$.

#### Example:
1. A customer in a dealership either buys a car (X=1) or doesn't buy a car (X=0)
2. A patient either tests positive (X=1) or negative(X=0)

## Creating new random variables from old
### Definition
>[!info] Creating new random variables from old
>Given random variable $X_1,..,X_k:\Omega\to \mathbb{R}$ and a reasonable $(\dagger)$ function $f:\mathbb{R}^k\to \mathbb{R}$. We can define a random variable $Y:\Omega \to \mathbb{R}$ as a function of $X_1,...,X_k$, given by
>$$Y(w)=f(X_1(w),X_2(w),...,X_k(w))\:\text{for}\: w\in \Omega$$

### Remark: 

(Optional technical remark $\dagger$): Here ”reasonable” functions can be described by the collection $\mathcal{B}(\mathbb{R}^k,\mathbb{R})$, which consists of all Borel-measurable functions.
These are functions
$$f: \mathbb{R}^k\to \mathbb{R} \quad \text{such that} \quad f^{-1}(A) \in \mathcal{B}(\mathbb{R}^k) \quad \text{whenever } A\in \mathcal{B}(\mathbb{R})$$
Here $\mathcal{B}(\mathbb{R}^k)$ is the smallest $\sigma$-algebra containing all sets of the form $\prod_{i=1}^k [a_i,b_i]$.

### Example
Let $Z_1,Z_2\:and\:Z_3$ be the outcomes of 3 dice rolls. Then $Y=Z_1+Z_2+Z_3$ defines a new variable(meaning the total accumulated score).
More precisely, we take $\mathbb{R}^3\to \mathbb{R}$ by $f(x_1,x_2,x_3)=x_1+x_2+x_3$. So $Y(w)=f(Z_1(w),Z_2(w),Z_3(w))$ for all $w\in \Omega$.






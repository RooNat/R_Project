---
tags: R
Week: 4
type: lecture
Lecture: 10
---

![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1666119591378-07d37995-de46-4039-a1fb-e119b51b99c8.jpeg)
[Lecture10.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1667993565464-3e677a95-14b7-4b45-9918-9a12e0f143f3.pdf)
### This chapter's focus
1. <font color=#c10b26>finite probability spaces</font>
2. the special case of <font color=#c10b26>simple probability spaces</font>
3. consider <font color=#c10b26>products, permutations(排列) and combinations</font>.
>[!important] Relevant knowledges
>[[08 Population,random samples and elementary set theory#Random experiments|Random experiments]]
>[[08 Population,random samples and elementary set theory#Events|events]]
>[[08 Population,random samples and elementary set theory#Sample space|sample spaces]]
>[[09 Introduction to probability theory#Summary|Definition of probability]]

## Finite probability spaces

### Definition of Finite probability spaces

>[!note] Finite probability spaces
>A finite probability space consists of a triple $(\Omega,\xi,\mathbb{P})$ where
>1. $\Omega=\{\omega_1,\omega_2,...,\omega_k\}$ is a finite sample space.
>2. $\xi$ is given by $\{A\subseteq \Omega\}$,i.e. the collection of all subsets of $\Omega$.
>3. The probability $\mathbb{P}$ on $\Omega$ is constructed in the following way.
>Specify a vector $\mathrm{p}={(p_1,p_2,...,p_k)}$ that satisfying
>(1) $p_i \geq 0 \text{ for } i=1,2,...,k.$ and (2). $\sum_{i=1}^k p_i =1$
>Define a probability $\mathbb{P}$ based on $\mathrm{p}$ by
>$$\mathbb{P}(A):= \sum_{i=1}^k p_i \cdot \mathbb{1}_A (\omega_i) \quad\text{for} \quad A\subseteq \Omega$$ 

- By definition, we have $\mathbb{P}(\omega_i)=p_i$ for any $\omega_i \in \Omega$ 
- The vector $\mathrm{p}=(p_1,...,p_k)$ is called a <font color=#c10b26>probability vector</font>

### Three key rules
To make sure $\mathbb{P}$ is probability, we must show that the fundamental rules of probability are satisfied.
![[09 Introduction to probability theory#^019937|The three key rules]]
<font color=#c10b26>Rule 1</font>: $\mathbb{P}(A)\geq 0$ for any event $A \in \xi$
>[!note]- Proof
>Since $p_i\geq 0$ for all $i=1,2,...,k$, we have
>$$\mathbb{P}(A):= \sum_{i=1}^k p_i \cdot \mathbb{1}_A (\omega_i) \geq 0$$

<font color=#c10b26>Rule2</font>: $\mathbb{P}(\Omega) =1$ for sample space $\Omega$
>[!note]- Proof
>![upgit_20221129_1669714618.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669714618.png)

<font color=#c10b26>Rule 3</font>: For a countable sequence of pairwise disjoint events $A_1,A_2,...,$ we have  $$\mathbb{P}(\cup _{i=1}^\infty A_i)=\sum_{i=1}^\infty \mathbb{P}(A_i)$$
>[!note]- Proof
>![upgit_20221129_1669714799.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221129_1669714799.png)

### Examples
#### Example1

![[09 Introduction to probability theory#^cfcd40]]
This is a finite space. The probability $\mathbb{P}$ has a corresponding probability vector: $\mathbb{p}=(1/6,1/6,1/6,1/6,1/6,1/6)$ ,and $$\mathbb{P}(A):= \sum_{i=1}^k p_i \cdot \mathbb{1}_A (\omega_i)$$
Therefore $\mathbb{P}$ is a probability.

#### Example2
![[09 Introduction to probability theory#^f64960]]
This is a finite probability space. The probability $\mathbb{P}$ has a corresponding probability vector: $\mathrm{p}=(1-p,p)$
Therefore $\mathbb{P}$ is a probability.

#### Example3
>[!example] A patient either tests positive(1) or negative(0) for a virus
>Sample space $\Omega=\{0,1\}$
>Set of events $\xi=\{A \subseteq \Omega\}=\{\emptyset,\{0\},\{1\},\{0,1\}\}$
>Probability $\mathbb{P}(\emptyset)=0$, $\mathbb{P}(\{0\})=1-q$, $\mathbb{P}(\{1\})=q$, $\mathbb{P}(\{0,1\})=1$ (where $0\leq q\leq 1$)

This is a finite probability space. The probability $\mathbb{P}$ has a corresponding probability vector: $\mathrm{p}=(1-q,q)$
Therefore $\mathbb{P}$ is a probability.

### Bernoulli distribution
>[!note] Bernoulli distribution 
>The Bernoulli distribution refers to the probability distribution on a sample space $\{0,1\}$, in which the probability of outcome "1" is $q$, and the probability of outcome "0" is $1-q$ for some $q\in [0,1]$

> Bernoulli distributions are typical examples of probabilities in <font color=#c10b26>finite sample spaces</font>
#### Examples
<font color=#c10b26>Example2:</font> A customer in the dealership either buys a car(1) or doesn't buy a car(0)
<font color=#c10b26>Example3:</font> A patient either tests positive(1) or negative(0) for a virus


## Simple probability spaces
>special types of finite probability spaces

>[!note] Simple probability spaces
>A simple probability space is a finite probability space $(\Omega,\xi,\mathbb{P})$ with the probability vector given by $\mathrm{p}=(\dfrac{1}{k},\dfrac{1}{k},...,\dfrac{1}{k})$ where $k=|\Omega|$.
>Consequently, the probability of an event $A\in \xi$ is given by $$\mathbb{P}(A):= \sum_{i=1}^k p_i \cdot \mathbb{1}_A (\omega_i)=\dfrac{|A|}{|\Omega|}$$

<font color=#c10b26>Example</font>: rolling a fair dice $\mathrm{p}=(1/6,1/6,1/6,1/6,1/6,1/6)$
$$\mathbb{P}(\{2,4,6\})=\dfrac{|\{2,4,6\}|}{6}=\dfrac{1}{2}$$

## Simple product probability spaces
>Suppose that there is a set $\mathcal{X}$ and another set $\mathcal{Y}$

>[!note] Cartesian product (笛卡尔乘积)
>The cartesian product $\mathcal{X}\times \mathcal{Y}:=\{(x,y): x\in \mathcal{X},\: \text{and} \: y\in \mathcal{Y}\}$

^8ce3ac

1. Example: if $\mathcal{X}=\{1,2\},\mathcal{Y}=\{1,2,3\}$,then
$$\mathcal{X}\times \mathcal{Y}=\{(1,1),(1,2),(1,3),(2,1),(2,2),(2,3)\}$$
2. If $\mathcal{X}$ and $\mathcal{Y}$ have cardinalities $|\mathcal{X}|$ and $|\mathcal{Y}|$ respectively, then $|\mathcal{X}\times \mathcal{Y}|=|\mathcal{X}|\cdot |\mathcal{Y}|$

>[!note] A simple product probability space
>A simple product probability space is a simple probability space $(\Omega,\xi,\mathbb{P})$ in which $\Omega=\mathcal{X}\times \mathcal{Y}$.
#### Example:
<font color=#c10b26>Example4</font>: Suppose that I flip a coin and record "heads"(1) and "tails"(0) $(\mathcal{X}=\{0,1\})$, and I also roll a dice and record which face up $(\mathcal{Y}=\{1,2,3,4,5,6\})$.
The outcome can of the form (1,6).
Take a sample space $\Omega=\mathcal{X}\times \mathcal{Y}$ and for $A\subseteq \Omega$ ,we have $$\mathbb{P}(A)=\dfrac{|A|}{|\Omega|}$$
e.g., $\mathbb{P}(\{(1,2),(0,5),(1,3)\})=\dfrac{3}{12}=\dfrac{1}{4}$

## Simple K-fold product probability spaces
> Suppose that there is a sequence of $K$ set $\mathcal{X_1},\mathcal{X_2},...,\mathcal{X_K}$.

>[!note] The (K-fold) cartesian product
>The (K-fold) cartesian product is
>$\prod_{i=1}^{K}\mathcal{X_i}=\mathcal{X}_1 \times \mathcal{X}_2 \times ...\times \mathcal{X}_K=\{(x_1,x_2,...,x_K):x_i\in \mathcal{X}_i \: \text{for} \: i=1,2,...,K\}$
>When $\mathcal{X}_1=\mathcal{X}_2=...=\mathcal{X}_K=\mathcal{Z}$, we write $\mathcal{Z}^K=\prod_{i=1}^{K}\mathcal{X_i}$

The Cartesian product $\prod_{i=1}^{K} \mathcal{X}_i$ has cardinality $|\prod_{i=1}^K \mathcal{X}_i|=|\mathcal{X}_1| \cdot |\mathcal{X}_2| \cdots |\mathcal{X}_K|$.
#### Example
>[!example]- Roll a dice $K$ times
>Then $\mathcal{X}_i=\{1,2,3,4,5,6\}$ and $\Omega=\prod_{i=1}^K \mathcal{X}_i$. The probability of rolling all ones is $\mathbb{P}(\{1,1,...,1\})=\dfrac{1}{|\Omega|}=\dfrac{1}{|\prod_{i=1}^K \mathcal{X}_i|}=\dfrac{1}{6^K}$
>

## Permutations and Combinations for computing cardinality
### Permutations
> A <font color=#c10b26>permutation</font> is a set of a particular choice of ordering.

>[!example] Example
>Example: if we have a set {1,2,3}, then the different orderings are (1,2,3),(1,3,2),(2,1,3),(2,3,1),(3,1,2),(3,2,1).

>[!important]
>There are $k! := k\cdot (k-1)\cdots 2\cdot 1$ different permutations of a sequence of $k$ objects.

### Combinations
> Given $k \leq n$, we write $(_{k}^{n})$ for the number of subsets of size $k$ chosen from a set of $n$.

>[!example] Example
>For example, if we have a set of {1,2,3}, then $(_{2}^3)$ means the number of subsets of size $2: \{1,2\},\{1,3\},\{2,3\}$

>[!important]
>The number $(_k^n)$ is computed as $(_k^n)=\dfrac{n!}{(n-k)!k!}$.
>It is referred as to $C_{n}^k$

^0c7374

### Permutations and Combinations

>[!important] $A_{n}^k$
>所有排列的个数
>从n个元素中取出k个，并按一定顺序排列
>$$A_{n}^k=C_{n}^k \cdot k!=\dfrac{n!}{(n-k)!}$$

### Examples
> Suppose we have a collection of $n$ balls (with numbers $1, 2, 3, \cdot,n$）in a bag:
#### Example5 Sampling with replacement
We draw a ball randomly from the bag, record the number, and then return it to
bag. We <font color=#c10b26>repeat</font> this $k \leq n$ times. This is called <font color=#c10b26>sampling with replacement</font>.
>[!question] Question
>Let $A$ be the event that the set of $K$ balls drawn from the bag is exactly $\{1,2,\cdots ,k\}$. We are interested in the probability of $A$.

**Answer:**
- Since $A$ consists of permutations of $\{1,\cdots, k\}$, we have $|A|=k!$.
- $\mathcal{X}_i=\{1,2,\cdots,n\}$ and the sample space has cardinality $|\Omega|=|\prod_{i=1}^k \mathcal{X}_i|=n^k$
- This is a simple probability space, hence the probability of $A$ is $\mathbb{P}(A)=\dfrac{|A|}{|\Omega|}=\dfrac{k!}{n^k}$

#### Example6 Sampling without replacement
We draw a ball randomly from the bag, record the number, and then <font color=#c10b26>leave the ball outside the bag</font>. We repeat this $k \leq n$ times. This is called sampling without replacement.

>[!question] Question
>Let $A$ be the event that the set of $k$ balls drawn from the bag is exactly $\{1,2,…,k\}$. We are interested in the probability of $A$.

**Answer:** 
- The event $A$ consists of permutations of $\{1,\cdots, k\}$, we have $|A|=k!$.
- The sample space $\Omega$ consists of all sequences length $k$ such that the entries of the sequence are taken from $\{1,2,\cdots,n\}$ without repeating.
- We have $(_{k}^n)$ choices of the subset of size $k$ from the set $\{1, 2,\cdots,n\}$. Each choice is associated with $k!$ different sequences.
- So $|\Omega|=(_{k}^n)\cdot k!$, and $\mathbb{P}(A)=1/(_{k}^n)=\dfrac{k!(n-k)!}{n!}$

#### Example7 Combination for sampling replacement
Suppose we have a collection of $n$ balls (with numbers $1,2,3,\cdots,n$) in a bag.
Among these balls, $r$ balls are in <font color=#c10b26>red</font> (with numbers $1,2,\cdots,k$), and $n -r$ balls are in <font color=#1356dd>blue</font> (with numbers $k + 1,\cdots,n$)：<br>
We draw a ball randomly from the bag, <font color=#c10b26>record the colour</font> (but not the numbers)， and then <font color=#c10b26>return it to the bag</font>. We repeat this $k \leq n$ times (this is sampling with replacement).

>[!question] Question
>Given a number $q \leq k$, we are interested in the probability of $q$ of these $k$ balls being <font color=#c10b26>red</font>.

**Answer:**
- The sample space is $\Omega= \{1,2, \cdots,n\}^k$ ，which consists of outcomes of the form $(a_1,a_2,\cdots,a_k)$ for $a_i\in \{1,\cdots,n\}$.
- Let $A_{q,k}$ denote the event that $q$ of these $k$ balls are <font color=#c10b26>red</font>, i.e., with numbers in $(1,2,\cdots,r)$.
- We want to compute $\mathbb{P}(A_{q,k})=\dfrac{|A_{q,k}|}{|\Omega|}$. Here $|\Omega|=n^k$.
- Suppose that we have $k$ boxes, and given an outcome of $(a_1, a_2,\cdots,a_k)$, we put ball (with number of $a_i$) into the $i^{th}$ box. Then each element in $A_{q,k}$ corresponds to one way of having $q$ <font color=#c10b26>red</font> balls in the boxes.
To make sure there are $q$ <font color=#c10b26>red</font> balls in the boxes, we proceed as follows:
	1. We choose $q$ of the $k$ boxes to put in the red balls, therefore having $(_{q}^k)$ choices.
	2. Then we put <font color=#c10b26>red</font> balls in the $q$ boxes. Each box can have one of the <font color=#c10b26>red</font> balls (one <font color=#c10b26>red</font> ball can be in more than 1 box). So we have $r^q$ different ways of doing so.
	3. Next we put <font color=#0b20c1>blue</font> balls in the remaining $k-q$ boxes. Each box can have one of the $n-r$ <font color=#0b20c1>blue</font> balls, so we have $(n-r)^{(k一q)}$ different ways of doing so.
In total, we have $(_{q}^k)\cdot r^q \cdot (n-r)^{k-q}$ different ways of having $q$ <font color=#c10b26>red</font> balls in the boxes.
So we have $|A_{q,k}|=(_{q}^k)\cdot r^q \cdot (n-r)^{k-q}$ .
>[!conclusion] Conclusion
>Finally, we have $|\Omega|=n^k$. So $\mathbb{P}(A_{q,k})=\dfrac{|A_{q,k}|}{|\Omega|}=(_{q}^k)\cdot (\dfrac{r}{n})^q\cdot (\dfrac{n-r}{n})^{k-q}$

## Countable probability spaces
> similarly to finite probability spaces
> construct a probability for sample spaces with <font color=#c10b26>countably infinite numbers</font> of elements

>[!note] Countable probability spaces
>A countable probability space consists of a triple $(\Omega,\xi,\mathbb{P})$ where
>1. $\Omega=\{\omega_1,\omega_2,...,\omega_k\}$ is a **countably infinite** sample space.
>2. $\xi$ is given by $\{A\subseteq \Omega\}$,i.e. the collection of all subsets of $\Omega$.
>3. The probability $\mathbb{P}$ on $\Omega$ is constructed in the following way.
>Specify a vector $\mathrm{p}={(p_1,p_2,...,p_k)}$ that satisfying
>(1) $p_i \geq 0 \text{ for } i=1,2,...,k.$ and (2). $\sum_{i=1}^k p_i =1$
>Define a probability $\mathbb{P}$ based on $\mathrm{p}$ by
>$$\mathbb{P}(A):= \sum_{i=1}^k p_i \cdot \mathbb{1}_A (\omega_i) \quad\text{for} \quad A\subseteq \Omega$$ 




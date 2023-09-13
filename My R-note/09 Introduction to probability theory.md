---
tags: R
Week: 4
type: lecture
Lecture: 9
---

![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1668983917089-d052cacb-7ab9-4fd5-ab46-6062d6784c0d.jpeg)

>[!question] Question
> What is the difference between the Sample Space and Event?

[UTF-8''Lecture09.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1667993485407-14a2e01e-cbb7-47bb-bccf-f7711d892fcf.pdf)

### The chapter's focus
1. discuss the <font color=#c10b26>key role of probability theory</font> in understanding populations from data samples
2. introduce the <font color=#c10b26>formal concept of probability</font>
3. derive several important <font color=#c10b26>consequences of the rules of probability</font>.

## Statistical estimation and probability
We must think about how a finite sample reflects a larger population of interest (statistical estimation)

![upgit_20221128_1669671254.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669671254.png)
>[!important] Relevant knowledge
> [[08 Population,random samples and elementary set theory#Random experiments|Radom experiments]]
> [[08 Population,random samples and elementary set theory#Events|events]]
> [[08 Population,random samples and elementary set theory#Sample space|sample spaces]] 

## Definition of the probability

### Definition of the probability

>[!note] Definition: probability
>Given a sample space $\Omega$ along with a well-behaved collection of events $\xi$, a probability $\mathbb{P}$ is a function which assigns a number $\mathbb{P}(A)$ to each event $A\in \xi$, and satisfies rules 1,2, and 3:
> <font color=#c10b26>Rule 1</font>: $\mathbb{P}(A)\geq 0$ for any event $A$
> <font color=#c10b26>Rule 2</font>: $\mathbb{P}(\Omega) =1$ for sample space $\Omega$
> <font color=#c10b26>Rule 3</font>: For pairwise disjoint events $A_1,A_2,...,$ we have 
> $$\mathbb{P}(\cup _{i=1}^\infty A_i)=\sum_{i=1}^\infty \mathbb{P}(A_i)$$

^019937
### Examples

| Key elements            | Symbol   |
| ----------------------- | -------- |
| sample space            | $\Omega$ |
| set of events           | $\xi$    |
| function of probability | $\mathbb{P}$         |

#### Example1

>[!example] Consider the rolls of a fair dice
> **Sample space** $\Omega =\{1,2,3,4,5,6\}$
> **Set of events** $\xi=\{A \subseteq \Omega\}$
> **Probability** $\mathbb{P}(A)=\dfrac{|A|}{6}$ for any $A \in \xi$

^cfcd40

<font color=#c10b26>Rule 1</font>: $\mathbb{P}(A) \geq 0$  <font color=#81b326>satisfied  </font> ✅
<font color=#c10b26>Rule 2</font>: $\mathbb{P}(\Omega) =1$ for sample space $\Omega$  <font color=#81b326>satisfied</font> ✅
<font color=#c10b26>Rule 3</font>: $\mathbb{P}(A\cup B)=\dfrac{|A\cup B|}{6}=\dfrac{|A|+|B|}{6}=P(A)+P(B)$  <font color=#81b326>satisfied</font> ✅

#### Example2
>[!example] A customer in the dealership either buys a car(1) or doesn't buy a car(0)
>Sample space $\Omega=\{0,1\}$
>Set of events $\xi=\{A \subseteq \Omega\}=\{\emptyset,\{0\},\{1\},\{0,1\}\}$
>Probability $\mathbb{P}(\emptyset)=0$, $\mathbb{P}(\{0\})=1-p$, $\mathbb{P}(\{1\})=p$, $\mathbb{P}(\{0,1\})=1$ (where $0\leq p\leq 1$)

^f64960

<font color=#c10b26>Rule 1</font>: $\mathbb{P}(A) \geq 0$  <font color=#81b326>satisfied  </font> ✅
<font color=#c10b26>Rule 2</font>: $\mathbb{P}(\Omega) =1$ for sample space $\Omega$  <font color=#81b326>satisfied</font> ✅
<font color=#c10b26>Rule 3</font>: $\mathbb{P}(\{0,1\})=\mathbb{P}(\{0\})+\mathbb{P}(\{1\})$ , $\mathbb{P}(\{0\}\cup \emptyset)=\mathbb{P}(\{0\})+\mathbb{P}(\emptyset)$...   <font color=#81b326>satisfied</font> ✅

### Relevant consequences
1. $\mathbb{P}(\emptyset)=0$
>[!proof] Proof:
>$\mathbb{P}(\Omega)=\mathbb{P}(\Omega)+\mathbb{P}(\emptyset)$
>Therefore $\mathbb{P}(\emptyset)=0$

2. if $A,B \in \xi$ are events and $A\subseteq B$ (i.e., $B$ implies $A$), then $\mathbb{P}(A) \leq \mathbb{P}(B)$.
>[!note] Proof:
>Clearly, $B$ and $A \setminus B$ are disjoint. So
>$$\mathbb{P}(A)=\mathbb{P}(B\cup (A\setminus B))=\mathbb{P}(B)+\mathbb{P}(A\setminus B)\leq \mathbb{P}(B) $$


3. For any event $A\in \xi$ .we have $0\leq \mathbb{P}(A) \leq 1$
>[!note] Proof:
>Firstly, we have $\mathbb{P}(A)\geq =0$
>Secondly, since $A \subseteq \Omega$ 
>$$\mathbb{P}(A) \leq \mathbb{P}(\Omega)\\ =1$$


4. Given any sequence of events $S_1,S_2,..,$ we have $\mathbb{P}(\cup_{i=1}^\infty S_i) \leq \sum_{i=1}^\infty \mathbb{P}(S_i)$
>[!note] Proof:
>![upgit_20221128_1669677318.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221128_1669677318.png)

## Summary

>[!important] Summary
>[[09 Introduction to probability theory#Definition of the probability|Definition of probability]]
>Relevant consequences:
>>1. $\mathbb{P}(\emptyset)=0$
>>2. if $A,B \in \xi$ are events and $A\subseteq B$ (i.e., $B$ implies $A$), then $\mathbb{P}(A) \subseteq \mathbb{P}(B)$.
>>3. For any event $A\in \xi$ .we have $0\leq \mathbb{P}(A) \leq 1$
>>4. Given any sequence of events $S_1,S_2,..,$ we have $\mathbb{P}(\cup_{i=1}^\infty S_i) \leq \sum_{i=1}^\infty \mathbb{P}(S_i)$


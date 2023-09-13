---
tags: R
Week: 3
type: lecture
Lecture: 8
---

Problems
Our data sets are **samples（样本）** from a much larger **population（总体）** of penguins
theory of probability
stochastic variation 随机变异
## Random experiments
### Definition
A random experiment is **a procedure**(real or imagined which):
1. has a **well-defined set** of **possible outcomes**
2. could(at least in principle) be repeated arbitrarily(任意地) many times
### Examples
1. A coin flip for a coin
2. Roll of a dice
3. A customer goes into a shop and decides whether to buy coffee or tea

>[!note]
>This is a very broad definition of experiments. There is no suggestion that the experiment is designed or controlled, although this connotation(内涵意义) is typical in the natural sciences
## Events & sample space
### Events
#### Definition
An event is a set (i.e. a collection) of possible outcomes of an experiment
#### Example
| **Random experiment** | **An event** |
| --- | --- |
| A coin flip for a coin| Heads up or tails up |
| Rolling a dice| One or a few of  {1,2,3,4,5,6} |
| A customer goes into a shop| Buy coffee or buy tea or both |

### Sample space
#### Definition
A sample space is the set of all possible outcomes of interest for a random experiment
#### Example
| **Random experiment** | **An event** |
| --- | --- |
| A coin flip for a coin| Two ways of landing heads "&tails" |
| Rolling a dice| The whole set {1,2,3,4,5,6} |
| A customer goes into a shop| All possible purchases (and no purchases) |

## Elementary set theory(基本集合理论)-definition
### Set
A set is just a collection of objects of interest (our interest is in sets of possible outcomes).
#### Examples

1. The set $\mathbb{N}$ consists of all **positive** whole numbers
2. The set $\mathbb{R}$ consists of all **real** numbers
3. The set $[0,1]$ consists of all **real numbers** between zero and one;
4. The empty set $\emptyset$ doesn't contain any objects

### Common set notations
| curly braces {...} | denote finite sets of objects |
| --- | --- |
| $x \in A$ | denote that x is an element of the set A |
| $x \notin A$ | denote x which is not an element of the set A |
| $\{x\in A:F(x)\}$ | the set of all element x in the set A which satisfy the property F |

### Finite & infinite sets
| **Type of sets** | **Definition** | **Examples** |
| --- | --- | --- |
| Finite | A set $A$ is finite if the **cardinality(基数)** of $A$ is a **non-negative** integer. | The empty set $\emptyset$ is finite with cardinality zero <br> The set $B=\{2,4,6,8,10\}$ have cardinality 5 |
| Infinite | A set is infinite if it is not a finite set | The set $\mathbb{N}$ consisting of all natural numbers <br> The set $\mathbb{Q}$ consisting of all rational numbers <br> The set $\mathbb{R}$ consisting of all real numbers|

### Countably & uncountably infinite sets
| Type of sets           | Defintion                                                                                                                                                     | Examples |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Countably infinite set | An infinite set $A$ is countably infinite if there exists an enumeration(列举)  $a_1,a_2,...,a_n,a_{n+1}$, such that $A=\{a_1,a_2,...,a_n,a_{n+1}\}={a_n:n\in N}$ |  The set $N$ <br> The set of all even numbers {2,4,6,8,...} <br> The set $\mathbb{Q}:={\pm m/n:m,n\in \mathbb{N}\cup\{0\}}$|
| Uncountably infinite set | A set $A$ is uncountably infinite whenever $A$ is infinite but not countably infinite. |The set consisting of all real numbers <br> Intervals(区间) $[a,b]$ for real numbers $a \neq b$ |

## Relationship among sets
### Equal sets
#### Definition:
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666171676150-27a26c00-627c-4534-afd0-c983b59145d5.png#averageHue=%23f0f0f0&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=132&id=u4c6d6f6e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=263&originWidth=2216&originalType=binary&ratio=1&rotation=0&showTitle=false&size=153356&status=done&style=none&taskId=u7a83f890-a4df-42c1-b3f2-b97337ab6ce&title=&width=1108)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666171939567-4342033a-e600-412e-9ee0-fab8ccf2df98.png#averageHue=%23fafcf7&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=167&id=u010903a3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=334&originWidth=510&originalType=binary&ratio=1&rotation=0&showTitle=false&size=114070&status=done&style=none&taskId=u676f88fe-4d7e-46bf-8585-6fbf86d0adc&title=&width=255)
**Order of elements** doesn't matter: {1,2,3}={3,2,1}
**Multiplicity of elements** doesn't matter:{1,2,2,3}={1,2,3}
### Subsets
#### Definition

- We say that A is a subset of B if every element of A is also an element of B
- If A is a subset of B, then we write $A\subseteq B$
- If A is a subset of B, then the event A implies the event B
#### Examples
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666171919923-2107d304-fbff-4d79-8495-b0466f47538b.png#averageHue=%23f4f4f4&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=224&id=ue3d69c2f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=448&originWidth=2212&originalType=binary&ratio=1&rotation=0&showTitle=false&size=213259&status=done&style=none&taskId=u11c2955f-02cd-459b-9172-ddb1a6ed4de&title=&width=1106)
### Complement of a set
#### Definition
The complement of B in A is
 $$A\setminus B :=\{x\in A | x \notin B\}$$
that is, the complement of B in A consists of all elements in A but not in B
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172281276-5d4aa707-635d-4646-a987-b718612bf586.png#averageHue=%23fbfdfb&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=139&id=uc268e491&margin=%5Bobject%20Object%5D&name=image.png&originHeight=278&originWidth=426&originalType=binary&ratio=1&rotation=0&showTitle=false&size=134660&status=done&style=none&taskId=u6dff3583-2ad6-491b-9130-51d65eb277a&title=&width=213)
#### Example
{1,2,3,4,5}\{0,1,2,3}={4,5}
#### Complement of an event
$A^c$: For an event A in the sample space $\Omega$, $\Omega \setminus A$ is the complement event in which A does not occur.
### Intersection and union of sets
| **Type of sets** | **Definition** |  | **Examples** |
| --- | --- | --- | --- |
| Intersections of sets | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172572436-96e30526-430d-4fa7-a4a9-5b10a1bf3a63.png#averageHue=%23f0f0ee&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=90&id=u02738972&margin=%5Bobject%20Object%5D&name=image.png&originHeight=180&originWidth=1004&originalType=binary&ratio=1&rotation=0&showTitle=false&size=153804&status=done&style=none&taskId=uef85ce5b-86af-4785-99ab-9928ad772eb&title=&width=502) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172609189-8aaa22cc-89aa-459a-9dfb-c6cb39742b68.png#averageHue=%23fdfdfb&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=119&id=u439be4a5&margin=%5Bobject%20Object%5D&name=image.png&originHeight=238&originWidth=418&originalType=binary&ratio=1&rotation=0&showTitle=false&size=107311&status=done&style=none&taskId=u1b0e5514-f4c0-4459-a5cb-fb56c7d46fa&title=&width=209) | $\{3\}=\{1,2,3\}\cap\{3,4,5\}$ |
| Unions of sets | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172581994-f8b48df3-abde-4838-8d3e-67c51b130a00.png#averageHue=%23f2f2f0&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=99&id=uf2b00550&margin=%5Bobject%20Object%5D&name=image.png&originHeight=198&originWidth=950&originalType=binary&ratio=1&rotation=0&showTitle=false&size=147186&status=done&style=none&taskId=u1182a30a-98b3-4032-81ab-605c3a886f0&title=&width=475) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172615792-a4c19c1c-5f4d-4696-bdf8-0bbe853294a5.png#averageHue=%23fafcfd&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=129&id=uc84ad53e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=258&originWidth=420&originalType=binary&ratio=1&rotation=0&showTitle=false&size=105200&status=done&style=none&taskId=u483c8fa4-8b75-4a77-ab2f-306aeaab274&title=&width=210) | $\{1,2,3,4,5\}=\{1,2,3\}\cup\{3,4,5\}$ |

#### Intersections and unions of many sets
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666172944756-250983d5-40ce-4924-85fb-8469cd9cd283.png#averageHue=%23f7f7f6&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=274&id=u7579c360&margin=%5Bobject%20Object%5D&name=image.png&originHeight=548&originWidth=1318&originalType=binary&ratio=1&rotation=0&showTitle=false&size=357716&status=done&style=none&taskId=u703d79ee-e3c3-4ba5-9a68-2be9fd7511c&title=&width=659)
### Disjoint sets and partitions
| Types of sets | Definition |  | Examples |
| --- | --- | --- | --- |
| Disjoint sets | two sets $A$ and $B$ are disjoint if $A \cap B=\emptyset$ | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666173300433-830da0b9-8426-490f-9317-4459881a58bd.png#averageHue=%23edf3f7&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=101&id=u87fc41c7&margin=%5Bobject%20Object%5D&name=image.png&originHeight=202&originWidth=520&originalType=binary&ratio=1&rotation=0&showTitle=false&size=113048&status=done&style=none&taskId=uacb8fad1-9aac-4bc2-8767-46fcffd4242&title=&width=260) | {1,2,3} and {4,5} are disjoints |
| Pairwise disjoints | For sets $A_1,A_2,...,A_k$ is pairwise disjoint if $A_i \cap A_j =\emptyset$ for any $i \neq j$ |  |  |
| Partitions | A partition of set $X$ is a family of $A_1,A_2,...,A_k$ which are pair-wise disjoint and $X=\cup_{\{k\in1,2,3,...,K\}}A_k$ | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666173306529-afa6e41b-e5a8-4e58-b5eb-24cc8ebeaccc.png#averageHue=%23f9fdfc&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=105&id=udb2649e8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=210&originWidth=542&originalType=binary&ratio=1&rotation=0&showTitle=false&size=57978&status=done&style=none&taskId=ufe97c814-bf74-4ff2-a899-0919bf60632&title=&width=271) | {1,2},{3},{4,5} are a partition of {1,2,3,4,5} |

## Indicator functions
### Definition
Let $A\subseteq \Omega$ be a set (or event). We can associate A with a binary function $\mathbb{1}_A:\Omega \to \{0,1\}$ by
$$\mathbb{1}_A(\omega)= \begin{cases}
1 & \text{if}\:\omega \in A \\
0 & \text{if} \:\omega \notin A \\
\end{cases}$$
The function $\mathbb{1}_{A}$ <font color=#c10b26>is referred to as the indicator function of A</font>
### Consequences
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666171465884-eb09e977-921b-4953-b500-7473444b671e.png#averageHue=%23ededed&clientId=uffdd2510-a362-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=184&id=uf8ea0410&margin=%5Bobject%20Object%5D&name=image.png&originHeight=368&originWidth=1521&originalType=binary&ratio=1&rotation=0&showTitle=false&size=198467&status=done&style=none&taskId=u3f22ce6e-fec4-44db-a471-d0d6cfcd7a4&title=&width=760.5)


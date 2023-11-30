---
tags: R
Week: 5
type: lecture
Lecture: 11
---
## Conditional probability(条件概率)
### Definition:
>[!note] Conditional probability
Let $\{\Omega,\xi,\mathbb{P}\}$ be a probability space with sample space $\Omega$, a collection of events $\xi$ and probability function $\mathbb{P}:\Omega \to [0,1]$. Let $A,B\in\xi$ be events and $\mathbb{P}(B)>0$.
The conditional probability of A given B is given by
$\mathbb{P}(A|B)=\dfrac{\mathbb{P}(A\cap B)}{\mathbb{P}(B)}$

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666723020489-bfec0051-0358-4c72-906e-0f02167f6f54.png#averageHue=%23fefefd&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=173&id=u3e038b22&margin=%5Bobject%20Object%5D&name=image.png&originHeight=346&originWidth=684&originalType=binary&ratio=1&rotation=0&showTitle=false&size=82929&status=done&style=none&taskId=u852be3b8-c295-4d14-8511-036f542e7c1&title=&width=342)
### Example:Two bags of spheres
Two bags (each with 50 coloured spheres):
Bag1: 49 <font color=#c10b26>red</font> spheres + 1 <font color=#0b39c1>blue</font> sphere
Bag2: 1 <font color=#c10b26>red</font> sphere + 49 <font color=#0b39c1>blue</font> spheres 
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666723190025-f7b4269e-b6b5-43ff-81ff-e6b45328546f.png#averageHue=%23f5f0ed&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=141&id=ua39858a6&margin=%5Bobject%20Object%5D&name=image.png&originHeight=282&originWidth=777&originalType=binary&ratio=1&rotation=0&showTitle=false&size=105718&status=done&style=none&taskId=u08d6575f-4517-40aa-b9ae-7ed056ee87a&title=&width=388.5)
>[!question] Question: 
Given that the coin lands "**tails-up**", what is the probability that a red sphere is drawn?
$\mathbb{P}(\text{a\: red\: sphere\: is\: drawn}| \text{the\: coin\: landed\: "tails-up"})=1/50$
As the picture shows:
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666724236996-030e25be-10d0-4661-99d5-fec07fa23aaa.png#averageHue=%23f0f0f0&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=89&id=u860f02c0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=285&originWidth=1733&originalType=binary&ratio=1&rotation=0&showTitle=false&size=158390&status=done&style=none&taskId=u394faf22-d086-4960-a6a3-515a5f3be4a&title=&width=543)
A: the event that a red sphere is drawn={1,....,49,51}
B: the event that the coin landed "tails-up" + a red sphere is drawn={51}
Therefore, $A\cap B$: the coin landed "tails-up" +a red sphere is drawn={51}
$$\mathbb{P}(A|B)=\dfrac{\mathbb{P}(A\cap B)}{\mathbb{P}(B)}=\dfrac{\mathbb{P}(\{51\})}{\mathbb{P}(\{51,....,100\})}=\dfrac{1/100}{50/100}=1/50$$

### Conditional probability defines a new probability space
> [!note] Theorem1(Conditional probability defines a new probability space)
> Let $(\Omega,\xi,\mathbb{P})$ be a probability space.
> Given an event $B$ with $\mathbb{P}(B)>0$, we can define $\mathbb{Q}:=\mathbb{P}(\cdot |B)$, that is, 
> $$\mathbb{Q}(A)=\mathbb{P}(A|B) \quad \text{for\:any\:event}\:A\in \xi$$
> Then the conditional probability space $(\Omega,\xi,\mathbb{Q})$ defines a new probability spaces, where $\mathbb{Q}$ is the probability.

#### Properties of conditional probability
Since $\mathbb{Q}:=\mathbb{P}(\cdot |B)$ defines a probability, the following properties hold as consequences of the three key rules:
1. $\mathbb{P}(\emptyset |B)=0$
2. If $A,C\in \xi$ are events and $A\subseteq C$,then $\mathbb{P}(A|B) \leq \mathbb{P}(C|B)$.
3. For any event $A\in \xi$, we have $0\leq \mathbb{P}(A|B) \leq 1$.
4. For events $S_1,S_2,...,$ we have $\mathbb{P}(\cup_{i=1}^{\infty}S_i|B)\leq \sum_{i=1}^{\infty}\mathbb{P}(S_i|B)$
5. For any $A\in \xi$, we have $\mathbb{P}(A^c|B)=1-\mathbb{P}(A|B)$
6. For any $A,C\in\xi$, we have $\mathbb{P}(A\cup C|B)=\mathbb{P}(A|B)+\mathbb{P}(C|B)-\mathbb{P}(A\cap C|B)$

## Bayes theorem

> [!note] Theorem 2 (Bayes theorem,Bayes,circa.1760)
> Suppose we have a probability space $(\Omega,\xi,\mathbb{P})$,Given events $A,B\in\xi$ with $\mathbb{P}(A)>0$ and $\mathbb{P}(B)>0$, we have
> $$\mathbb{P}(B|A)=\dfrac{\mathbb{P}(B)\cdot \mathbb{P}(A|B)}{\mathbb{P}(A)}$$
#### Proof

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666729907264-1dff45d8-8250-47f9-a227-8948bc13f375.png#averageHue=%23f0f0f0&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=199&id=u63c0ed1a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=398&originWidth=2031&originalType=binary&ratio=1&rotation=0&showTitle=false&size=135842&status=done&style=none&taskId=u9e01acc3-7cda-4815-979d-cc8e3b615f8&title=&width=1015.5)

## The law of total probability
> [!note] Theorem 3 (The law of total probability)
> Suppose we have a probability space $(\Omega,\xi,\mathbb{P}),$and $A_1,A_2,...\in \xi$ forms a partition of $\Omega$. For any event $B\in \xi$, we have
> $$\mathbb{P}(B)=\sum_i \mathbb{P}(A_i \cap B)=\sum_{\{i:P(A_i)>0\}}\mathbb{P}(B|A_i)\cdot\mathbb{P}(A_i)$$

^a9eb1c


#### Proof
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666730701899-7dedb9c0-777c-48f2-bd71-51b5d98c062f.png#averageHue=%23e9e9e9&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=83&id=ufac43eb3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=299&originWidth=2093&originalType=binary&ratio=1&rotation=0&showTitle=false&size=147044&status=done&style=none&taskId=ue02b9aa8-bb8f-4ef5-94c7-bc0605d55b5&title=&width=581)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666730709673-67036d22-0bed-43e0-a033-43e62c5bcbaa.png#averageHue=%23f0f0f0&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=124&id=ue60f756c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=409&originWidth=1727&originalType=binary&ratio=1&rotation=0&showTitle=false&size=125989&status=done&style=none&taskId=u29a060e8-0945-437b-b2aa-b71c995614f&title=&width=523)
### Examples
#### Example1: Six bags of spheres
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666731286925-54a8b3d5-e0ed-4852-8ece-4d7d92930cbc.png#averageHue=%23eeeeed&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=126&id=ue80e671e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=453&originWidth=2219&originalType=binary&ratio=1&rotation=0&showTitle=false&size=319239&status=done&style=none&taskId=udff6ae73-70d1-4489-9853-322a3824898&title=&width=617)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734216404-4690106c-d179-4f72-93c6-1252fb517b55.png#averageHue=%23e5e5e5&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=37&id=u0c8891bd&margin=%5Bobject%20Object%5D&name=image.png&originHeight=133&originWidth=2205&originalType=binary&ratio=1&rotation=0&showTitle=false&size=78420&status=done&style=none&taskId=u657a945d-d603-40a4-9389-8663b209fd9&title=&width=615)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734231503-4682b484-1622-4a98-a37f-4044a3c115b1.png#averageHue=%23e9e9e9&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=36&id=u74de82b8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=131&originWidth=2165&originalType=binary&ratio=1&rotation=0&showTitle=false&size=66205&status=done&style=none&taskId=u3b3be00e-2f25-4f2a-ba14-5ecbf758869&title=&width=592)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734250241-fcf2fd41-4bc9-4bfd-bdd8-c345b84eb2ac.png#averageHue=%23e5e5e5&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=22&id=u819cf60e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=75&originWidth=2011&originalType=binary&ratio=1&rotation=0&showTitle=false&size=43860&status=done&style=none&taskId=u63346b78-cd6b-4a96-a8a1-4bddcb835e6&title=&width=594)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734263957-9221fcdb-89de-451f-b3d7-17b379fef5d8.png#averageHue=%23f2f2f2&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=65&id=u7dbe5e2b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=217&originWidth=1923&originalType=binary&ratio=1&rotation=0&showTitle=false&size=62963&status=done&style=none&taskId=u3bcdb8da-9792-4944-a0d7-8ac537416dc&title=&width=576)

#### Example2: A patient tests positive for a mediacal condition
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734286145-513a158a-462d-4d24-b1ef-6bfe8076aeb9.png#averageHue=%23e3e3e3&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=41&id=ud153011b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=130&originWidth=1567&originalType=binary&ratio=1&rotation=0&showTitle=false&size=56076&status=done&style=none&taskId=uc5141dc8-5beb-41f3-bd32-744fc4fabaf&title=&width=489)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666734943327-e257c7f5-9f88-4886-85d4-b0da6dd51174.png#averageHue=%23f1f1f0&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=201&id=u45879020&margin=%5Bobject%20Object%5D&name=image.png&originHeight=402&originWidth=1172&originalType=binary&ratio=1&rotation=0&showTitle=false&size=381319&status=done&style=none&taskId=u5bf5db02-52e1-416b-be15-25fe4bae08c&title=&width=586)
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666735004691-69e17047-75f6-4e1a-8a64-43825e528cd2.png#averageHue=%23e8e7e6&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=324&id=u9498557b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=648&originWidth=1194&originalType=binary&ratio=1&rotation=0&showTitle=false&size=527854&status=done&style=none&taskId=u2ce227bb-750b-4b3a-a30a-c510a01fecb&title=&width=597)

## Independence and dependence
Events in the real world often exhibit interesting dependencies upon another.
>[!note] Independence and dependence
>Let $(\Omega,\xi,\mathbb{P})$be a probability space.
>A pair of events $A,B\in \xi$ are said to be independent if $$\mathbb{P}(A \cap B)=\mathbb{P}(A)\cdot \mathbb{P}(B)$$
>A pair of events $A,B\in \xi$ are said to be dependent if $$\mathbb{P}(A \cap B)\neq \mathbb{P}(A)\cdot \mathbb{P}(B)$$

^9bce10

### Examples
#### Example1: Two bags of spheres
Two bags (each with 50 coloured spheres):
Bag1: 49 <font color=#c10b26>red</font> spheres + 1 <font color=#0b39c1>blue</font> sphere
Bag2: 1 <font color=#c10b26>red</font> sphere + 49 <font color=#0b39c1>blue</font> spheres 
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666723190025-f7b4269e-b6b5-43ff-81ff-e6b45328546f.png#averageHue=%23f5f0ed&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=141&id=kZo3v&margin=%5Bobject%20Object%5D&name=image.png&originHeight=282&originWidth=777&originalType=binary&ratio=1&rotation=0&showTitle=false&size=105718&status=done&style=none&taskId=u08d6575f-4517-40aa-b9ae-7ed056ee87a&title=&width=388.5)
A: the event that a red sphere is drawn={1,....,49,51}
B: the event that the coin landed "tails-up" + a red sphere is drawn={51}
Therefore, $A\cap B$:the coin landed "tails-up" +a red sphere is drawn={51}
$\mathbb{P}(A\cap B)=1/100\neq \mathbb{P}(A)\cdot \mathbb{P}(B)=\dfrac{50}{100}\cdot \dfrac{50}{100}=1/4$
So the events A and B are **dependent**

#### Example4: Rolling a dice and flipping a fair coin
Suppose we roll a dice and flip a fair coin
$\text{Sampel space}:$We model the scenario via a simple probability space with $\Omega=\{1,2,...,6\}\times \{H,T\},$ so $|\Omega|=12$.
Let A be the event that we roll a 6, so $A=\{(6,H),(6,T)\}$
Let B be the event that the coin lands "heads" up, so $B=\{(1,H),...,(6,H)\}$
Then $A$ and $B$ are independent, because
$$\mathbb{P}(A\cap B)=\mathbb{P}(\{(6,H)\})=\dfrac{1}{6}\cdot \dfrac{1}{2}=\dfrac{1}{12}$$
$$\mathbb{P}(A)=\dfrac{1}{6}\:\:\mathbb{P}(B)=\dfrac{1}{2}$$
$$\mathbb{P}(A)\cdot \mathbb{P}(B)=\dfrac{1}{12}=\mathbb{P}(A\cap B)$$

### Equivalent condition for independence
#### Lemma 1
> Let $A,B\in \xi$ be events with $P(B)>0$.Then A and B are independent if and only if $\mathbb{P}(A|B)=\mathbb{P}(A)$

#### Proof
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666736634857-2aa07e53-905f-46a6-9489-e008b00d45af.png#averageHue=%23f5f5f4&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=109&id=u6188a41e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=218&originWidth=1082&originalType=binary&ratio=1&rotation=0&showTitle=false&size=119155&status=done&style=none&taskId=u1e8ccd60-3f9f-40a1-83ae-1fe4d509948&title=&width=541)

#### Remark:
- if $A,B\in \xi$ and $\mathbb{P}(B)=0$,then $\mathbb{P}(A\cap B)=0=\mathbb{P}(A)\cdot \mathbb{P}(B)$, Therefore, if$\mathbb{P}(B)=0$,then $B$ is independent of any other events in $\xi$
- For any $A\in\xi$, $A$ and $\Omega$ are independent.

$$\mathbb{P}(A\cap \Omega)=\mathbb{P}(A)=\mathbb{P}(A)\cdot1=\mathbb{P}(A)\mathbb{P}(\Omega)$$

### Independence for a sequence of events

>[!note] Independence for a sequence of events
Let $(\Omega,\xi,\mathbb{P})$ be a probability space.
A sequence of events $A_1,A_2,...,A_n$ is said to be **mutually-independent**,if for any subset $\{i_1,i_2,...,i_n\}\subseteq\{1,...,n\}$ with $i_1<i_2<...<i_k$. we have
$$\mathbb{P}(A_{i_1}\cap A_{i_2}\cap...\cap A_{i_k})=\mathbb{P}(A_{i_1})\mathbb{P}(A_{i_2})...\mathbb{P}(A_{i_k})$$
A sequence of events $A_1,A_2,...A_n$ is said to be **pairwise-independent**,if for any subset $\{i_1,i_2\}\subseteq\{1,...,n\}$ with $i_1\neq i_2$. we have
$$\mathbb{P}(A_{i_1}\cap A_{i_2})=\mathbb{P}(A_{i_1})\mathbb{P}(A_{i_2})$$

#### Remarks
1. Mutual-independency implies pairwise-independency, but pairwise-independency does not imply mutual-independency.
2. For sequence $A_1,A_2,...,A_n$ independency typically refers to mutual-independency.
#### Example: Rolling a dice for three times
Suppose we roll a fair dice and record which faces land up
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666737607419-c7fc9904-b581-46fc-8366-7b7f23311582.png#averageHue=%23f1f1f1&clientId=u924a4e26-b8c6-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=255&id=ub4129acb&margin=%5Bobject%20Object%5D&name=image.png&originHeight=510&originWidth=1130&originalType=binary&ratio=1&rotation=0&showTitle=false&size=178366&status=done&style=none&taskId=u344e3b3a-a181-45c4-be3a-ae671750691&title=&width=565)




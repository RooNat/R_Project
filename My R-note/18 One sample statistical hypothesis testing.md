---
tags: R
Week: 7
type: lecture
Lecture: 18
---

> 单样本统计假设试验

[Lecture18.pdf](https://www.yuque.com/attachments/yuque/0/2022/pdf/25489537/1668606368261-6e1fbdb5-668c-4007-962d-12cd9e9d6096.pdf)
## Preface

### This chapter's focus
Suppose that $X_1,…,X_n$ are i.i.d.random variables. We are interested in the **population parameter**  $\theta \in \mathbb{R}$.
Given a sample, we can estimate the value of $\theta$ with $point \: estimates$（sample mean, sample variance, MLE, etc）,or provide a plausible range of values for $\theta$ by $confidence \:intervals$.
>[!tip] **Goal:**
>We want to decide if a statement about the parameter $\theta$ is reasonable or not. This is done by statistical procedures called [[18 One sample statistical hypothesis testing#Hypothesis testing|hypothesis testing]] (or just testing).


---

## Making inferences based on sample data
> 根据样本数据做推论

### Hypothesis testing
> 假设检验

**Hypothesis testing** is a systematic approach to drawing inferences from data.

1. A farmer wants to know if applying different types of soil treatment will modify their crop yield.
2. A pharmaceutical company wants to know if treatment for a medical condition is effective.
3. A physicist wants to know if their prior belief regarding the value of a physical constant is correct

>[!tip] 
>By combining **hypothesis testing** with an **appropriate experimental design** we can:
>- Justify our inferences from data.
>- Understand and control the role of statistical variation


#### Example(1)
Suppose that a chef is buying lots of bags of salt for their restaurant.
The bags are advertised as **1kg** in weight. But the chef is suspicious…

>[!tip]
>The chef weighs a sample of $n=30$ bags of salt:
>$$\text{Sample mean}: \bar X=989.06 \text{(grams)}$$
>$$\text{Sample standard deviation: } S=19.62 \text{(grams)}$$

>[!question] Questions
>Should the chef conclude that the true population mean $\mu$ differs from 1000 grams?
>Is it more reasonable to conclude that the difference between the sample and population mean is due to chance?


### Statistical hypotheses
> 统计假设

The **statistical hypothesis** frames the research question in terms of the **parameters of a statistical model**.
>[!important] There are two hypotheses:
>1. $H_0$ :The **null hypothesis** is our default position typically declaring an absence of an interesting phenomenon.
>2. $H_1$ :The **alternative hypothesis** is something interesting which differs from the null.

#### Example(2): Do the bags of salt differ from their advertised weight, on average?
![[#Example(1)]]

- **Statistical hypotheses**: We model the weights of the salt bags as i.i.d. $X_1,...,X_n \sim \mathcal{N}(\mu,\sigma^2)$.
- **Statistical hypotheses**: 
	- Null hypothesis $H_0:\mu=1000$ 
	- Alternative hypothesis $H_1:\mu \neq 1000$
- This is a **one-sample test**

---
## One sample t-test

### Test statistic

>[!note] Definition
>The **test statistic** is some function of the data which:
>1. has a known distribution under the null hypothesis $H_0$.
>2. often **takes on large or "extreme" values** under the alternative hypothesis $H_1$.

Then by looking at the value of the test statistic, we can draw conclusions on our test:
**Case1:** The test statistic takes on typical values for $H_0$ $\to$ we fail to reject the null hypothesis $H_0$.
**Case2**: The test statistic takes on non-typical values for $H_0$ $\to$ we reject the null & accept the alternative $H_1$.

---

#### Example(3):
![[#Example(2): Do the bags of salt differ from their advertised weight, on average?]]
**test statistics:** Define **test statistic**  $\hat T := \dfrac{\bar X -1000}{S/\sqrt{n}}$ ([[17 Confidence intervals#^de4328|Lemma]]) where $\bar X=\dfrac{1}{n}\sum _{i=1}^{n} X_i$ and $S^2:= \dfrac{1}{n-1} \sum_{i=1}^n(X_i-\bar X)^2$.
**Intuitions:**
- Under hypothesis $H_0$, $|\hat T|$ is typical small.
- Under hypothesis $H_1$, $|\hat T|$ can be large.
> ![[14 Continuous random variables and limit raws#Student's t distribution|Student's t distribution]]

Then if $H_0$ then $\hat T$ has **Student's t-distribution** with `n-1` degrees of freedom.
The next stage is to compute the numerical value of the test statistic $\hat T$ based upon the data.
```r
#sample_size<-length(salt_vect) #sample size
#sample_mean<-mean(salt_vect) #sample mean
#sample_sd<-sd(salt_vect) #standard deviation
sample_size<-30
sample_mean<-989.06
sample_sd<-19.62
test_statistic<-(sample_mean-1000)/(sample_sd/sqrt(sample_size)) # test statistic
test_statistic
```

```
[1] -3.05407
```

>[!question] 
>**Question**: is this number "-3.054554" big or small? At which value of $\hat T$ can we reject $H_0$? Can we say how likely $\hat T$ takes this value under $H_0$?


### The p-value

#### Definition of the p-value

>[!info] $\text{p-value}$
>Suppose that we have a test statistic $\hat T$ for a test, and given a sample, the numerical value of $\hat T$ is $\tau$. Then the p-value for this test is the probability that the test statistics $\hat T$ is at least as extreme as $\tau$ under the **null** $H_0$:
>$$p=\mathbb{P}(|\hat T|\geq |\tau|)$$

The p-value is a key quantity (probability) based on which we draw conclusions on the tests.

#### Example(4):

![[#Example(3):|Example]]

Now the test statistic $\hat T$ has a numerical value $\tau=\mathrm{-3.0546}$.
**p-value:** The p-value for this test is
$$\begin{aligned}
p=\mathbb{P}_{H_0}(|\hat T|\geq |\tau|)=\mathbb{P}_{H_0}(\hat T \geq |\tau|)+\mathbb{P}_{H_0}(\hat T\leq -|\tau|)=2\cdot \mathbb{P}_{H_0}(\hat T \geq |\tau|)\\=2\cdot (1-\mathbb{P}_{H_0}(\hat T\leq \tau))\\=2\cdot (1-F_{n-1}(|\tau|))  \quad \\\text{where }F_{n-1} \text{ is the cumulative distribution function}
\end{aligned}$$
#Rnote `pt()` gives the density distribution
```r
2*(1-pt(abs(test_statistic),df=sample_size-1))
```

```
[1] 0.004802932
```

**Note**：The $p-value\quad p=\mathbb{P}_{H_0}(|\hat T|\geq |\tau|)$ is very small.
Therefore, the value of the test statistic is very unlikely under the null hypothesis $H_0$.
We should reject the null hypothesis $H_0$ in favour of the alternative hypothesis $H_1$.

>[!question] 
>But how small a $p-value$ is small enough?


#### Different types of errors
There are **two types of errors** that can occur with hypothesis testing;
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668893592875-6a371358-0b41-4da7-b0d1-fe9052972b6e.png#averageHue=%23f6f6f6&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=121&id=u61d3116b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=242&originWidth=740&originalType=binary&ratio=1&rotation=0&showTitle=false&size=57213&status=done&style=none&taskId=ue5af75c4-2eed-46e9-bab9-06d850b8ae5&title=&width=370)

>[!tip] 
>- $\text{Type 1 error}$: We reject the null hypothesis when the null hypothesis is actually correct.
>- $\text{Type 2 error}$: We fail to reject the null hypothesis when the alternative hypothesis is correct.

**Note:** We are generally more cautious about $\text{Type 1 error}$ than $\text{Type 2 error}$ since the null hypothesis is our default.
This corresponds to being conservative with respect to declaring the existence of new phenomena.

#### Significance level

- The **test size** of a test $\alpha_{test}$ is the probability of $\text{Type I error}$ under the null hypothesis: ^3a9ff2

$$\alpha_{\text{test}}=\mathbb{P}(\text{Type 1 error}| H_0  \text{ is true}).$$

- The **power** of a test is $1-\beta_{\text{test}}$ where $\beta_{\text{test}}$ is the probability of $\text{Type II error}$ under the alternative:

$$\beta_{\text{test}}=\mathbb{P}(\text{Type 2 error}|H_1 \text{ is true})$$

>[!tip]
>The **significance level** of a test $\alpha$ is an upper bound on the test size $\alpha_{test}\leq \alpha$.

A valid hypothesis test requires that the significance level be chosen in advance of seeing the data.
There is an inevitable tradeoff here - the lower the significance $\alpha$ the lower the power $1-\beta_{\text{test}}$.
We usually opt for $\alpha=0.05$ but the optimal choice depends upon the application.

#### Statistical hypothesis testing

**Recall that** the [[18 One sample statistical hypothesis testing#Definition of the p-value|p-value]].

>[!tip]
>If the **p-value** is strictly less than the significance level we reject the null hypothesis, $\Longrightarrow H_1$
>If the **p-value** is greater than the significance level we do not reject the null hypothesis $\Longrightarrow H_0$.

#### Example(5):
![[#Example(4):|Example]]

We choose a significance level $\alpha=0.05$.
We apply the one-sample **t-test** to compute a p-value which is $0.004797$.

 **draw conclusion** :
   - We reject the null hypothesis and conclude that $H_1:\mu \neq 1000$

**Note:** for our conclusions to be reasonable our assumptions must be valid.

### One sample t-test with R
#### Example(6)
![[#Example(5):|Example]]

**Check model assumptions:**
- To check Gaussian model assumption:
```r
tibble(salt_vect)%>% ggplot(aes(x=salt_vect))+geom_density()+
  theme_bw()+labs(x="weight (grams)",y="density")
```
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937055305-e4208c60-5d3b-40e3-aa06-55225722975f.png#averageHue=%23fbfbfb&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=310&id=ud25e9163&margin=%5Bobject%20Object%5D&name=image.png&originHeight=620&originWidth=866&originalType=binary&ratio=1&rotation=0&showTitle=false&size=95971&status=done&style=none&taskId=ub697e2a1-440a-4977-8481-7d050ba0e79&title=&width=433)
```r
tibble(salt_vect)%>%
  ggplot(aes(sample=salt_vect))+stat_qq()+stat_qq_line(color="blue")+theme_bw()
```
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937065141-83018541-525f-45c9-a8f9-1f7d5e14038e.png#averageHue=%23fcfcfc&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=326&id=ua1f97135&margin=%5Bobject%20Object%5D&name=image.png&originHeight=652&originWidth=884&originalType=binary&ratio=1&rotation=0&showTitle=false&size=121246&status=done&style=none&taskId=u96029960-8b10-4cd6-a474-c61f753eb5a&title=&width=442)

- We choose a significance level $\alpha=0.05$.
   - We apply the **one-sample t-test**:
```r
t.test(x=salt_vect,mu=1000)
```
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937209493-5a84e153-a255-489d-9827-c322798d54f0.png#averageHue=%23f8f8f8&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=273&id=u825083a7&margin=%5Bobject%20Object%5D&name=image.png&originHeight=546&originWidth=1210&originalType=binary&ratio=1&rotation=0&showTitle=true&size=154260&status=done&style=none&taskId=u843dd5ff-5220-4fd1-bd53-bf14e1281de&title=Results&width=605 "Results")

   - The p-value 0.004797 is below the significance level $\alpha$.
   - We reject the null hypothesis and conclude that $H_1 :\mu \neq 1000$

#### A confidence interval approach

- Confidence intervals: $L_n,U_n$ such that $\mathbb{P}(L_n\leq \mu \leq U_n) \geq \alpha$.
```r
alpha<-0.05 #95%-level confidence intervals
sample_size<-length(salt_vect) # sample size
sample_mean<-mean(salt_vect) # sample mean
sample_sd<-sd(salt_vect) # sample deviation
t<-qt(1-alpha/2,df=sample_size-1) # (1-alpha/2)-quantile
confidence_interval_l<-sample_mean-t*sample_sd/sqrt(sample_size) #lower confidence bound
confidence_interval_u<-sample_mean+t*sample_sd/sqrt(sample_size)# upper confidence bound
confidence_interval<-c(confidence_interval_l,confidence_interval_u) #confidence interval
confidence_interval
```
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937553008-81433a81-248f-4048-96a4-61bf9806c784.png#averageHue=%23f4f4f4&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=52&id=uf251dd36&margin=%5Bobject%20Object%5D&name=image.png&originHeight=104&originWidth=950&originalType=binary&ratio=1&rotation=0&showTitle=false&size=17876&status=done&style=none&taskId=ub6dd7988-da28-46a8-9f8b-4238d56d0a2&title=&width=475)

>[!tip]
>The 95%-level confidence intervals: is $(L_n,U_n)=(981.37,996.38)$.
>We can test the hypothesis based on the confidence interval

- Confidence intervals: $L_n,U_n$ such that $\mathbb{P}(L_n\leq \mu \leq U_n) \geq 1-\alpha$.
   - If we truly had $\mu=1000$, then the probability of having such a low value of $U_n$ would be below $0.05$.
$$\mathbb{P}(L_n\leq \mu \leq U_n) \geq 1-\alpha \Longrightarrow \mathbb{P}(U_n \leq \mu)\leq \alpha =0.05$$ 
On these grounds, we can reasonably reject the hypothesis that $\mu=100$ and conclude that $\mu<1000$.
**Statistical hypothesis testing** allows us to make decisions, while confidence intervals provide a range of possible values.

### Statistical hypothesis testing: key stages
Suppose we have a clear research hypothesis and some high-quality data from a well designed experiment.
The **key stages** of **statistical hypothesis testing** are as follows:
1. Form our **statistical hypothesis** including a null hypothesis and an alternative hypothesis.
2. Apply model checking to validate any **modelling assumptions**. 
3. Choose our desired **significance level**. 
4. Select an **appropriate statistical test**. 
5. Compute the numerical value of the **test statistic** from the data.
6. Compute a **p-value** based on the test statistic.
7. Draw conclusions based on the relationship between the p-value and the significance level.

### Example: the one sample t-test
| Steps                                                                                                                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1. Form our **statistical hypothesis** including a null hypothesis and an alternative hypothesis.                               | The weights are modelled as i.i.d. Gaussian samples $X_1,…,X_n \sim \mathcal{N}(\mu,\sigma^2)$.<br> - Null hypothesis: $H_0: \mu =2.5 (kg)$ <br> - Alternative hypothesis: $H_1 : \mu \neq 2.5 (kg)$ <br> **Example:** Suppose **$X_1,…,X_n \sim \mathcal{N}(\mu,\sigma^2)$**, **$H_0: \mu=2.5 (kg) \quad and \quad H_1 : \mu \neq 2.5 (kg)$                                                                                                                           |
| 2. Apply model checking to validate any **modelling assumptions**.                                                              | We should be sure to check our modelling assumptions:It seems reasonable to proceed with an i.i.d. Gaussian model                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ```tibble(chicken_weights)%>%ggplot(aes(x=chicken_weights))+geom_density()+theme_bw()+labs(x="weight (grams)",y="density")``` | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937809330-c4a1742a-e751-4302-8e62-db62fb3b219b.png#averageHue=%23fbfbfb&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=311&id=u77ac0cec&margin=%5Bobject%20Object%5D&name=image.png&originHeight=622&originWidth=878&originalType=binary&ratio=1&rotation=0&showTitle=false&size=88490&status=done&style=none&taskId=u0d64ac8b-0c45-4f6d-a9b0-34eaa865f79&title=&width=439)  |
| ```tibble(chicken_weights)%>%ggplot(aes(sample=chicken_weights))+stat_qq()+stat_qq_line(color="blue")+theme_bw()```           | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937799354-779e8206-e03b-4ec1-8211-981df50bc6e6.png#averageHue=%23fcfcfc&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=320&id=u3cfc28b4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=640&originWidth=892&originalType=binary&ratio=1&rotation=0&showTitle=false&size=114332&status=done&style=none&taskId=u77cc5265-6a44-4ceb-aac6-ec4862f3bad&title=&width=446) |

```r
tibble(chicken_weights)%>%
ggplot(aes(x=chicken_weights))+geom_density()+
  theme_bw()+labs(x="weight (grams)",y="density")
```

```r
tibble(chicken_weights)%>%
  ggplot(aes(sample=chicken_weights))+stat_qq()+stat_qq_line(color="blue")+theme_bw()
```


| Steps                                                                                                                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 3. Choose our desired **significance level**.                                                                                     | **Next** we choose a significance level: $\alpha=0.05$ <br> **Note that** $\alpha$ is the maximum probability of $\text{Type I error}:\alpha \geq \alpha_{\text{test}}=\mathbb{P}(\text{Type 1 error} \rvert H_0 \text{ is true})$                                                                                                                                                                                                                                                                                                                                                                                                |
| 4. Select an **appropriate statistical test**.                                                                                    | Then we perform our one sample t test with R <br> **Note:** in the one sample t-test, we use the test statistic $\hat T := \dfrac{\bar X -2.5}{S/\sqrt{n}}$                                                                                                                                                                                                                                                                                                                                                     |
| 5. Compute the numerical value of the **test statistic** from the data.<br> 6. Compute a **p-value** based on the test statistic. | `t.test(x=chicken_weight,mu=2.5)`  <br> ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937837721-34ea07cc-92ba-4868-8d94-ecb6dac65f1a.png#averageHue=%23faf9f8&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=243&id=u70256ea4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=486&originWidth=1062&originalType=binary&ratio=1&rotation=0&showTitle=false&size=327744&status=done&style=none&taskId=u58ba86bb-8fdc-40f9-b30e-52a4732fd2b&title=&width=531) |
| 7. Draw conclusions based on the relationship between the p-value and the significance level. |We compute a p-value of $0.3244$.This is well above the significance level of $\alpha=0.05$.<br> Hence, we default to not rejecting the null hypothesis of $H_0∶\mu=2.5(kg)$.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |


## Two-sided and One-sided hypothesis tests
Sometimes we are only interested in deviations in one direction.
#### Examples
1. In our salt example, the chef might only be concerned if our bag of salt is too light.
2. In our chickens example, the farmer might only be concerned if the chickens are smaller.
When this occurs we can use a **one-sided test**, rather than a **two-sided test.**
The default t-test is **two-sided** in R.

| two-sided                                                                                                                                                                                                                                                                                                                                                                                                                                                             | one-sided                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $H_0: \mu =1 (kg)$<br> $H_1: \mu \neq 1 (kg)$                                                                                                                                                                                                                                                                                                                                                                                                                         | $H_0: \mu \geq1 (kg)$<br> $H_1: \mu < 1 (kg)$                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ```t.test(x=salt_vect,mu=1000,alternative="two.sided")```                                                                                                                                                                                                                                                                                                                                                                                                             | `t.test(x=salt_vect,mu=1000,alternative="less")`                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937896881-19c3bad4-2dad-49cf-9f6c-b2b2ed0a764c.png#averageHue=%23f8f8f8&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=201&id=u6aa3f64c&margin=%5Bobject%20Object%5D&name=image.png&originHeight=402&originWidth=890&originalType=binary&ratio=1&rotation=0&showTitle=false&size=93687&status=done&style=none&taskId=u67827e66-fb61-4bd6-a20f-c3ef190b5a3&title=&width=445) | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668937933501-33857804-d1be-4401-9275-5fcc67795a60.png#averageHue=%23f8f8f8&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=204&id=ufae2534f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=408&originWidth=896&originalType=binary&ratio=1&rotation=0&showTitle=false&size=93565&status=done&style=none&taskId=u3de32d4c-63db-4dde-bd67-767be296daa&title=&width=448) |
| ![upgit_20221202_1669941358.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221202_1669941358.png) | ![upgit_20221202_1669941330.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221202_1669941330.png)

The diagrams are the density function of test statistics.
The blue regions reflect cases where $H_0$ is rejected (correspond to small $p$ values)
One-sided hypothesis tests have higher power $1-\beta_{\text{test}}$ at the same [[#Significance level|significance level]] $\alpha \geq\alpha_{\text{test}}$
$$\alpha_{\text{test}}=\mathbb{P}(\text{Type 1 error}| H_0  \text{ is true}).$$
$$\beta_{\text{test}}=\mathbb{P}(\text{Type 2 error}|H_1 \text{ is true})$$

#### Use caution with one-sided tests!
One-sided tests are more powerful… but also less conservative.
You shouldn’t use a one-sided test if either direction is of interest.
- e.g. You are interested in knowing if the bags of salt were lighter than 1kg, but you would also be very interested if they were heavier on average than 1kg.
The method is no longer valid if you choose between a one-sided and two-sided test after seeing the data!
By default you can use a two-sided test.
- You can still make a directional conclusion with a two-sided test based on the sign of your test statistic.


## Binomial test

> Suppose that Bill tells you he can predict the outcome of a dice roll better than chance.
> You suspect that he cannot predict the outcome of a dice roll and typically will do no better than chance.
> You believe that his probability of making a correct prediction is 1/6.
> Bill believes his probability of success is better than 1/6.
> How can we test this?
---

We conduct a sequence of trials where Bill makes a prediction and then rolls the dice.
The results are represented by a sample $X_1,...,X_n$. Each $X_i$ is either $0$ (Bill's $i$ th prediction is wrong) or $1$ (Bill's $i$ th prediction is correct).
We model $X_1,…,X_n$ as i.i.d. Bernoulli random variables with $q \in [0,1]$.

| **Null hypothesis** | **Alternative hypothesis** |
|:-------------------:|:--------------------------:|
|    $H_0: q=1/6$     |      $H_1:q \neq 1/6$      |

We choose a significance level of $\alpha=0.05$
A natural **test statistic** is the number of successes $Z= X_1+…+ X_n$.
We expect $Z$ to be close to $qn$, so close to $n/6$ under the null hypothesis $H_0$.
The **test statistic** $Z= X_1+…+ X_n$ has a Binomial distribution $Z\sim \mathrm{Binom}(n,q)$.
We $X_1,...,X_n \sim \mathcal{B}(q)$ with $q\in [0,1]$. 
$H_0: q=1/6$ $H_1:q \neq 1/6$
We choose a significance level of $\alpha=0.05$

|                     Probability mass function                      |                                                                                                                                                                                                                                Diagram                                                                                                                                                                                                                                |
|:------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| $\mathbb{P}(Z=k)=\dfrac{n!}{(n-k)!k!} \cdot q^k \cdot (1-q)^{n-k}$ | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1668935267109-74c86bdc-0749-43f7-ada4-ab9b8fae1956.png#averageHue=%23dfdfdf&clientId=ub0d88f18-c7d5-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=218&id=u3be32b27&margin=%5Bobject%20Object%5D&name=image.png&originHeight=436&originWidth=624&originalType=binary&ratio=1&rotation=0&showTitle=false&size=61130&status=done&style=none&taskId=u1c7351fa-09a5-41f9-b74c-6b95367dc9c&title=&width=312) |

To compute the p-value we first let $\tau$ be the numerical value of the test statistic ( i.e.,summing up all $X_1,...,X_n$ )
The p-value is the probability of attaining a test statistic at least as extreme as $\tau$ under the null hypothesis:
$$p:=2 \mathbb{P}_{H_0}(Z\geq \tau)=2\sum _{k=\tau}^{n}\mathbb{P}(Z=k) \quad \text{if} \quad \tau > n/6$$
$$p:=2 \mathbb{P}_{H_0}(Z\leq \tau)=2\sum _{k=0}^{\tau}\mathbb{P}(Z=k) \quad \text{if} \quad \tau \leq n/6$$
If the p-value is below the significance level we reject $H_0$; therefore $\Longrightarrow H_1$
If the p-value $>$ the significance level we fail to reject $H_0$; therefore $\Longrightarrow H_0$

```r
correct_or_incorrect=c(0,1,0,1,1,0,1,1,1,0)
correct_or_incorrect
```

```
 [1] 0 1 0 1 1 0 1 1 1 0
```

```r
sample_size<-length(correct_or_incorrect)
num_successes<-sum(correct_or_incorrect)
binom.test(x=num_successes,n=sample_size,p=1/6,alternative="two.sided")
```

```
Exact binomial test

data:  num_successes and sample_size
number of successes = 6, number of
trials = 10, p-value = 0.002438
alternative hypothesis: true probability of success is not equal to 0.1666667
95 percent confidence interval:
0.2623781 0.8784477
sample estimates:
probability of success 
0.6 
```

So our p-value is well below the significance level so reject the null hypothesis. Therefore $\Longrightarrow H_1$

## Summary: concepts in hypothesis tests

1. The test statistic is some function of the data which has a know distribution under null $H_0$.
2. The [[18 One sample statistical hypothesis testing#Definition of the p-value|p-value]] for this test is the probability that the test statistics $\hat T$ is at least as extreme as $\tau$ under the null $p=\mathbb{P}_{H_0}(|\hat T|\geq |\tau|)$
3. [[18 One sample statistical hypothesis testing#Different types of errors|Different types of error]]
4. [[#Significance level|Significance level]]



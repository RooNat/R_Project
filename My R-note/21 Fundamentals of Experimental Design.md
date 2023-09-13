---
tags: R
Week: 8
type: lecture
lecture: 21
---
### The chapter's focus
We will consider <font color=#c10b26>three significant obstacles</font> to **valid scientific inference**
>inference 推理

>[!important]
>1. Measurement distortions
>2. Selection bias
>3. Confounding variables

This chapter will then consider the ==role of experimental design== in overcoming these challenges.

### Validity
See the example before:
**Validity?** Is the statement that the soil treatment makes a difference valid?
![[19 Statistical hypothesis testing with paired data#Experimental design]]

#### Random variation vs. threats to validity
1. Scientific research can **reach false conclusions** due to <font color=#c10b26>random variation</font>.(随机变化)
	e.g. **By pure chance** your <u>sample average</u> is much <u>greater</u> than <u>the population average</u>.
	**Random variation** can be handled in different ways
	1. The **role of error** due to random variation can be <font color=#c10b26>quantified and understood</font> through <font color=#c10b26>statistical techniques</font> such as ==confidence intervals== and ==hypothesis testing==.
	2. As the <font color=#c10b26>size of the data grows</font> the random error typically goes to **zero**.
2. Scientific research can **reach false conclusions** due to <font color=#c10b26>problems with the validity of a methodology</font>
	- Problems with the validity of a methodology are more **pernicious** and typically cannot be resolved by big data!
		pernicious 有害的

## Measurement distortions
>your data has errors

### Valid measurements
A **valid measurement** is one that accurately reflects **the aspect of reality you intend to measure**.
>[!example] Example1: Concentration level
>A scientist wants to understand the effect of coffee on "<font color=#c10b26>concentration levels</font>"
>What is a valid measure of someone's "concentration level"?
>- Perhaps we can measure **the amount of time** taken to perform some arithmetic tasks?
>- Or perhaps we can ask people how distracted they feel when reading?

>[!example] Example2: Computer science ability
>An employer wants to measure people's "<font color=#c10b26>computer science ability</font>".
>What is a valid measure of someone's ability as a computer scientist
>- Perhaps we can **measure how long it takes** for them to solve a set of algorithmic problems?
>- Or perhaps **ask someone to score the presentation of their code**?

The examples above are imprecise concepts and not directly measurable.
Often we must make do with a <font color=#c10b26>proxy measurement</font>: 
	- a variable that can be accurately measured and is believed to correlate well with the true variable of interest
	- Proxy: 代替物；指标；代表
	- e.g. "<u>Speed to complete tasks A, B, C</u>” rather than “attention level”
	- It is vital that this choice of proxy is **well documented**.(详细说明的)
	- Conclusions drawn from the research should also <font color=#c10b26>reflect the reliance upon a proxy measurement</font>.

**Drawback**: you may not be always able to **measure the variable accurately**!

### Measurement error
<font color=#c10b26>Measurement error</font> is the difference between the<u> measured value of a quantity</u> and <u>its true value</u>.
**Measurement error is very common in practice**
- Miscalibration of <font color=#c10b26>measurement instruments</font> e.g. a clock running slightly too fast or slow.
	- Miscalibration: 刻度错误
- <font color=#c10b26>Rounding errors</font> due to computational constraints e.g. 0.904 converted to 0.9.
- <font color=#c10b26>Inaccurate responses</font> to questionnaires e.g. under reporting alcohol consumption.
- <font color=#c10b26>Human error</font> e.g. data entry mistakes.


## Selection bias
>your sample is not selected properly

<font color=#c10b26>Selection bias</font> occurs when the data included in the analysis **misrepresents** the underlying population of interest.
>misrepresents: 误传；歪曲

![upgit_20221209_1670605437.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670605437.png)
**Note**: The different forms of bias are **not mutually exclusive**.

### Sample bias

>[!info]
>Sample bias occurs when some members of your intended population are more likely to be sampled than others.

#### Example
You want to know what the **most popular genre** (jazz, folk, rock ...） is amongst attendees of a music festival. 
	- You conduct a survey at a two-day music festival and all of your participants are selected **on the morning of the first day**.
	- The sample is not representative of the population of festival goers.
		- What if the <u>Saturday focus on folk</u> and the <u>Sunday focus on rock</u>?

### Self selection bias

>[!info]
>Self-selection bias occurs whenever participants self select whether or not they are assigned to a group.
>
>It often results in <font color=#c10b26>sampling bias</font>

#### Example
1. **Online reviews**: online reviews of restaurants might **disproportionately** represent subsets of <u>the population with strong opinions or certain age groups.</u>
2. **Medical trials**: the results from **medical trials** can be distorted by their <u>over reliance upon student participants</u>.
3. **Medical trials**: Example: Medical trials can also be distorted by allowing **patients to self select which medication they choose**.

### Attrition bias

>[!info]
>Attrition bias occurs when a sample is distorted by participants leaving a study.
>Attrition: 消耗；摩擦
>Attrition bias 磨损消耗

#### Example
A scientist is investigating the **efficacy** of **a new exercise program**(新的锻炼项目).
>efficacy 功效
- Participants may leave the study if they are not having success.
- The sample of remaining participants may not be representative.

### Post hoc selection
>事后选择

>[!info]
>Post hoc selection occurs whenever a subset of the data is chosen **based on the sample itself.**

#### Example
A scientist is investigating the efficacy of **medical treatment**.
- The average performance on the sample is <font color=#c10b26>disappointing</font>.
- However, there exists <u>a subgroup for which the treatment performs better</u>.
- We must not treat the sub-sample as if were the original sample!

### Randomized samples (Solution)
>随机样本

**Solution:**
The ideal solution to selection bias problems is <font color=#c10b26>randomization</font>: Data is randomly sampled from the population of interest with <font color=#c10b26>uniform weight</font>.

>[!example]
>Sampling from the population of interest which is the set of all attendees of a music festival
>- We obtained a list of ticket numbers pick a number uniformly at random and ask the ticket holder to participate.

In reality, problems like **self selection** and **attrition bias** are difficult to overcome.

## Confounding variables
>Confound: 使困惑；使混淆
>correlation $\neq$ causation

**Correlation does not imply causation!**

>[!example]
>the increased sales of <font color=#c10b26>sun glass</font> may not be the reason for the increased sales of <font color=#c10b26>ice cream</font>, but the <font color=#c10b26>sunny weather</font> is!

![upgit_20221209_1670609458.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670609458.png)

1. Suppose we want to understand the causal relationship between two variables $X$ and $Y$.
2. A **confounding variable** $Z$ is a **third variable** that has a causal effect On both $X$ and $Y$.
	**Note**: the sunny weather ($Z$) has a causal effect on both the sale of sunglasses ($X$) and the sales of ice cream ($Y$)
	![upgit_20221209_1670609727.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670609727.png)
#### confounding variables and correlation
1. Correlation might be <font color=#c10b26>a consequence of causal relationships</font>
2. Correlation of two variables might also be <font color=#c10b26>a consequence of the confounding variable</font>
>[!example]
>- Sunny weather (confounding variable) leads to **better sales of sunglasses**
>- Sunny weather (confounding variable) leads to **better sales of ice-cream**
>So the **sales of sunglasses** and the **sales of ice-cream** are <font color=#c10b26>correlated</font>

3. The confounding variables are the troublemakers as we can not conclude causal relationships by correlation. So we want to remove the correlation caused by confounding variables, through [[19 Statistical hypothesis testing with paired data#Experimental design|experimental design]], We can use the idea of [[21 Fundamentals of Experimental Design#Randomized intervention (solution)|randomized intervention]].
4. Confounding variables can **obscure causal relationships**.
	**Example:** Does having <font color=#c10b26>organic vegetables</font> imply an increase in <font color=#c10b26>life expectancy</font>?
	e.g. a wealthy person may have access to more organic vegetables as well as better medical treatment
	![upgit_20221209_1670613273.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670613273.png)
	- In each of the two patient groups (poor conditions vs good conditions), the success rate for treatment A is better than that of B.
	- Surprisingly, the overall success rate for B is better than A (when computed for all patients)
	- This surprising phenomenon is due to the <font color=#c10b26>confounding variable</font> (**severity of condition**)

	![upgit_20221209_1670613793.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670613793.png)
	![upgit_20221209_1670613922.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670613922.png)

>[!important] 
>The impact of confounder variables can be reduced or removed by careful <font color=#c10b26>experimental design</font>

#### Independent variable and dependent variable

**Question**: we want to study the causal effect of a variable $X$ upon another variable $Y$.
The variable $X$ is referred to as the <font color=#c10b26>independent variable</font> and $Y$ the <font color=#c10b26>dependent variable</font>.

>[!example]
>We want to understand the causal effect of treatment ($X$) on **a patient's recovery** ($Y$).
>- We are interested in what happens to $Y$ when we intervene on $X$, not the correlation between $X$ and $Y$.
>- This requires a carefully <font color=#c10b26>designed experiment</font> (e.g. randomized intervention) rather than an observational study.
>- intervene: 干涉

### Randomized intervention (solution)
>removing the impact of confounding variables

| Goal                                                                                                                                                                                                                                    | Method                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| We want to study the causal effect of an **independent variable** $X$ on a **dependent variable** $Y$ <br><br> For example, the **independent variable** $X$ is the **treatment** and the **dependent variable** $Y$ is **recovery** or not | By intervening on $X$ we **block** the <font color=#c10b26>dependency</font> of $X$ upon any possible confounders $Z$.<br><br> Intuitively, if we **block** the **dependency**, we “control” the $Z$ factor and hence are able to see how $Y$ changes with respect to $X$ |

**There are different Randomized intervention designs**, e.g.:
1. simple between-groups experiment (post-test only control group design)
2. pre-test/post-test control group design
3. Solomon's four-group design
4. Within subjects designs

>post-test: 试验后/效果测验
>pre-test: 预测验

#### 1. Simple between-groups experiment

1. **Question:** Suppose that we want to study the **causal effect** of a <font color=#c10b26>binary independent</font> variable $X\in \{0,1\}$ on dependent variable $Y$. We want to **remove the impact** of $Z$.
2. **Intuition:** construct two groups (of a sample) such that
	1. the behaviour of $X$ is different within the two groups
	2. but the behaviour of the confounder $Z$ is same
3. **Approach:**
	1. Take a **random sample** from **our population of interest**.
	2. **Partition** the sample randomly into two groups- **Group A** and **Group B**
	3. We intervene so that those in **Group A** receive no treatment $X=0$ and those in **Group B** receive treatment $X=1$
	4. After some time has elapsed the dependent variable $Y$ is measured for those in both groups.
	![upgit_20221209_1670623688.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670623688.png)

4. **Example:** We want to understand the effect of <font color=#c10b26>blood pressure medication</font> $X$ on <font color=#c10b26>blood pressure level</font> $Y$.
	- Obtain a sample randomly
	- A random sample is randomly partitioned into a control group (Group A) and a treatment group (Group B).<font color=#c10b26>(Important,key)</font>
	- Those in the control group are untreated (X=0) and those in the treatment group receive the treatment (X=1).
	- After some time has elapsed the blood pressure Y is measured for those in both groups.
5. An <font color=#c10b26>unpaired t-test</font> could be applied to test for <font color=#c10b26>a difference of means</font> between groups.
	1. <u>In general</u>, a difference of population means could be due to the presence of **an unobserved confounder**.
	2. However, by conducting an experiment with a randomized intervention we conclude the difference of means between the dependent variable $Y$ between the two groups was caused by the difference in $X$ .
		- Note that the behaviour of confounder $Z$ is the same between the two groups (randomized)
6. **Experimental designs vs. Observational studies**
	1. **Advantages**:
		 - Experimental designs enable us to make clear inferences about causal effects.
	2. **Disadvantages**: There are many situations where performing a randomized intervention would be
		- **Unethical**: Testing the effect of drug addiction by insisting people take addictive substances.
		- **Impossible**: Testing the effect of species (X) on the speed of running (Y) by random assigning an animal to a new species! (does not make sense)
		- **Too expensive**: Testing the psychological effects of a driving a sports car by random giving people sports cars, which are expensive.
		Even when experimental data is available it is typically far more expensive than observational data.

#### 2. pre-test/post-test control group design

1. The simple between-groups experiment is often referred to as a <font color=#c10b26>post-test only control group design</font>
	- **Problem**: What if there were **a large pre-test difference** between the two groups.
	![upgit_20221209_1670625563.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670625563.png)

2. An alternative is the <font color=#c10b26>pre-test/post-test control group design</font>:
	![upgit_20221209_1670625593.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670625593.png)
	- **Problem**: The act of measurement may effect the outcome of trials  ^xe4rs7
	- **Example**: Measuring blood pressure might cause participants to be more health conscious.

#### 3. Solomon's four-group design

![[Data Science/R_Projects/My R-note/21 Fundamentals of Experimental Design#^xe4rs7]]

**Solution**:
We can apply pre-tests and assess the effect of pre-testing by comparing A & B with C& D.
![upgit_20221209_1670625876.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670625876.png)

**Problem:** requires twice the data!

#### 4. Within-subjects designs

>**Pre-test only**, **pre-test/post-test** and **Solomon's four-group** are all <font color=#c10b26>between-group designs</font>.

1. <u>Between-groups</u> (a.k.a. independent measures): Each individual receives **at most one treatment**.
2. <u>Within-subjects</u> (a.k.a. repeated measures): Each individual receives **multiple treatments**.
	![upgit_20221209_1670626163.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221209_1670626163.png)
	*Statistical analysis* : This produces <font color=#c10b26>paired data</font> so we can often apply <font color=#c10b26>a paired test</font>, for example, a paired t-test
	1. Within-subjects **advantages**: 
		1. Within-subjects designs are typically more <font color=#c10b26>sensitive</font> as they reduce the role of <font color=#c10b26>between-subject variation</font>
		2. Within-subjects designs are often <font color=#c10b26>more cost-effective</font> as typically <font color=#c10b26>fewer participants are required</font>
	2. Within-subjects **disadvantages**:
		1. There are situations where different treatment conditions preclude each other: e.g. Consider an experiment which compares different techniques for learning to drive (a participant can not learn to drive twice)
		2. There is also a risk of carry-over effects: e.g. Consider fatigue or adaptation in an experiment which measures concentration level with logical puzzles.



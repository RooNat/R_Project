---
tags: R
Week: 9
type: lecture
lecture: 24
---

## The chapter's focus
1. Introduce the concept of <font color=#c10b26>classification</font>
2. Consider the <font color=#c10b26>supervised learning pipeline</font> and the role of the <font color=#c10b26>test train split</font>
3. Use <font color=#c10b26>probabilities ideas</font> to understand the <font color=#c10b26>classification</font>
4. Emphasise the difference between <font color=#c10b26>training and test errors</font>
5. Discuss the **fundamental concept** of a **Bayes classifier**.

---

## What is classification
### Classification
- **Classification problem**: Given <font color=#c10b26>a feature vector</font> (e.g., an image of fish) and a set of <font color=#c10b26>categories</font> (e.g., { fish, cat, dog, airplane }), we want to assign <font color=#c10b26>a class label</font> taken from the <font color=#c10b26>categories</font> to the <font color=#c10b26>feature vector</font> according to which <font color=#c10b26>class</font> it belongs to.
- **Goal**: We want to map a <font color=#c10b26>feature vector</font> to a <font color=#c10b26>class label</font>.
- In machine learning, we want to learn a <font color=#c10b26>function</font> $\phi: \mathcal{X}\to \mathcal{Y}$ which takes as input <font color=#c10b26>feature vector</font> $X\in \mathcal{X}$, and returns a <font color=#c10b26>categorical variable</font> $\phi(X)\in \mathcal{Y}$ which is also known as a **label.** 
	![upgit_20221210_1670703964.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670703964.png) ^a9gpld

### Examples
#### Example1: Sentiment analysis
A company wants to automatically classify **social media posts** as being either "<u>positive</u>" or "<u>negative</u>" in sentiment.
![upgit_20221210_1670703964.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670703964.png)

| Review                                                                                                                         | Class    |
| ------------------------------------------------------------------------------------------------------------------------------ | -------- |
| ![upgit_20221210_1670704353.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670704353.png) | positive |
| ![upgit_20221210_1670704376.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670704376.png) | negative         |

#### Example2: Image classification
A biologist wants to **automatically** classify <font color=#c10b26>images</font> of <font color=#c10b26>fish</font> according to **which species** they belong to.
![upgit_20221210_1670704533.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670704533.png)


#### Example3: Automated medical diagnosis
A medical doctor wants to establish an automated procedure for classifying **retinal blood vessels** as <font color=#c10b26>normal</font> or <font color=#c10b26>abnormal</font>.
>retinal:视网膜的
>vessels: 血管

This is <font color=#c10b26>a binary classification</font> problem because it has just <font color=#c10b26>two possible outcomes</font> ("normal" VS. "abnormal")

### Classification rule
#### Classification rule
![upgit_20221210_1670703964.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670703964.png)

>[!important]
>The function $\phi: \mathcal{X}\to \mathcal{Y}$ is known as a <font color=#c10b26>classification rule</font>.

**The core problem**: here is to ==find the classification rule==. We want to implement the rule within computers.


#### How to create a classification rule
1. The rule-based approach (<font color=#c10b26>denied</font>):
	1. We could attempt to program a <font color=#c10b26>detailed set of rules</font>.
			e.g.“The rainbow shark has two large eyes”.
	2. **Problems**:
		1. This approach would be incredibly labor-intensive.
		2. Based on a set of fixed rules and hence not flexible: New problems would require new rules.
		3. Performs poorly in practice: Brittle e.g.what if we can't see both eyes etc.?
2. ==**The statistical learning approach**== (<font color=#5dc10b>We use it</font>):
	1. Instead of setting **a set of fixed rules**, we design **learning algorithms** so that the machine can learn to classify from data.
			e.g., instead of giving the machine rules, we can ==give the machine a few examples of fish==, and ask it to learn how to ==classify fish from the examples==.
	2. Machine learning **proverb**(格言):
		> Why teach a computer to classify fish, when you can teach a computer to learn how to classify fish?

---

## The supervised learning pipeline
>pipeline 流水线；管道

#### Supervised learning
1. **Data**: In **supervised learning**, we assume that a set of <font color=#c10b26>training data</font> $\mathcal{D}:=\{(X_1,Y_1),\cdots,(X_n,Y_n)\}$ is given, where $X \in \mathcal{X}$ is a <font color=#c10b26>feature vector</font>, and $Y_i\in \mathcal{Y}$ is the <font color=#c10b26>label</font> associated with $X_i$.
2. **Example**: $X_i$ is an **image** of a **particular fish**, and $Y_i$ is a **label** corresponding to the species of the fish.
3. **Goal**: our goal is to learn a <font color=#c10b26>classification rule</font> $\phi: \mathcal{X} \to \mathcal{Y}$ from the data $\mathcal{D}$.
4. **Algorithm**: The training data is then passed to <font color=#c10b26>a learning algorithm</font>. The <font color=#c10b26>output</font> of the learning algorithm is the <font color=#c10b26>classification rule</font> that we want.
	![upgit_20221210_1670706858.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670706858.png)

	1.  A <font color=#c10b26>classification rule</font> is also known as a <font color=#c10b26>classifier</font>.
	2. A learned classifier should **reflect the structure** of the training data $\mathcal{D}:=\{(X_1,Y_1),\cdots,(X_n,Y_n)\}$.
	3. The <b><u>learning algorithm</u></b> selects the <font color=#c10b26>classifier</font> based on a certain <font color=#c10b26>criterion</font> (准则, 标准), for example, $\phi(X_i)$ must <u>be close to</u> the label $Y_i$, i.e., fitting $\phi(X_i)$ to $Y_i$.
4. **Learning vs. memorization**: 
	1. A good classifier $\phi$ should map a feature $X\in \mathcal{X}$ to its associated label $Y \in \mathcal{Y}$.
	2. **Key point**: The classification rule should perform well on <font color=#c10b26>unseen feature</font> vectors $X \in \mathcal{X}$, i.e., the <font color=#c10b26>feature vectors</font> that **are not** in $\mathcal{D}$.
		1. Knowing $\phi$ performs well on $\mathcal{D}:=\{(X_1,Y_1),\cdots,(X_n,Y_n)\}$ is **not sufficient**.
		2. **Example**: classifying fish
			We want the fish classification rule to **correctly determine** the fish species for new images...<u>not just the images within the training data</u>.
		3. This is the **crucial difference** between **learning** and **memorization**.
	3. If the learning algorithm is not designed properly, then the learned classifier might **remember** the dataset **instead of learning** the useful rules. 
		1. The classifier remembers each pair of $(X_i,Y_i)$. Now given an <font color=#c10b26>input</font> $X\in \{X_1,\cdots, X_n\}$, it compares it with each and and then <font color=#c10b26>outputs</font> $Y_i$.
		2. As a result, the classifier performs poorly given an unseen $X$.
	4. Therefore, we need a **==test dataset==** to check the performance of the classifier on data that was not seen during training.

---

## Train-test split
>Creating a **dataset** for checking the performance of your classifier on **unseen data**

- We need a **test dataset** to <u>check the performance of the classifier</u> on data that was not seen during training.
	**==Key point==**: Never use your test data to **learn your classifier**!
	![upgit_20221210_1670708692.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670708692.png)

- Given a <font color=#c10b26>dataset</font>, we can split it into a <font color=#c10b26>training dataset</font> and a <font color=#c10b26>test dataset</font>.
	- We use the <font color=#c10b26>training dataset</font> to <u>train our classifier</u>
	- We use the <font color=#c10b26>test dataset</font> to <u>assess our classifier</u>.
	![upgit_20221210_1670708783.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670708783.png)

### Example: Penguin classification
- **Example**: Suppose we want to learn a <font color=#c10b26>classifier</font> $\phi: \mathcal{X}\to \mathcal{Y}$ which takes <font color=#c10b26>a feature vector</font> of **morphological features** and predicts whether a penguin belongs to either the <u><b>Adelie species</b></u> or the <u><b>Chinstrap species</b></u>.
- **Features**: $X=(X^1,X^2) \in \mathcal{X} :=\mathbb{R}^2$
	- $X^1= \text{the weight of the penguin (grams)}$
	- $X^2=\text{the flipper length of the penguins (mm)}$
- **Labels**: $Y\in \mathcal{Y} :=\{0,1\}$
	$$Y=\begin{cases}
	1 \quad & \text{if the penguin is an Adelie} \\
	0 \quad & \text{if the penguin is a Chinstrap}
	\end{cases}$$
	
#### prepare the data
```r
library(tidyverse)
library(palmerpenguins)

peng_total<-penguins%>%
  select(body_mass_g,flipper_length_mm,species)%>%
  filter(species!="Gentoo")%>%
  drop_na()%>%
  mutate(species=as.numeric(species=="Adelie"))
peng_total
```

![upgit_20221210_1670710184.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670710184.png)

#### Carry out a train test spilt: 
```r
num_total<-peng_total%>%nrow() # number of penguin data
num_train<-floor(num_total*0.75) #number of train examples
num_test<-num_total-num_train #number of test samples

set.seed(1) # set random seed for reproducibility
test_inds<-sample(seq(num_total),num_test) # random sample of test indicies
train_inds<-setdiff(seq(num_total),test_inds) # training data indicies

peng_train<-peng_total%>%filter(row_number() %in% train_inds) #train data
peng_test<-peng_total%>%filter(row_number() %in% test_inds) #test data
```

We can also **separate out the feature vectors and labels** (i.e., separate out $X$ and $Y$ into two different data frames).

```r
peng_train_x<-peng_train%>%select(-species) #train feature vectors
peng_train_y<-peng_train%>%pull(species) #train labels

peng_test_x<-peng_test%>%select(-species) # test feature vector
peng_test_y<-peng_test%>%pull(species) #test labels
```

![upgit_20221210_1670711230.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670711230.png)

## Expected test error and Bayes classifier
>quantifying the error of your classifiers

![[Data Science/R_Projects/My R-note/24 An introduction to classification#^a9gpld]]

### Expected test error

We begin with a feature space $\mathcal{X}$. In the **simplest case** this will be $\mathcal{X}=\mathbb{R}^d$.
We have a finite set of categories $\mathcal{Y}$. In the **simplest case** this will be $\mathcal{Y} = \{0, 1\}$.

- **A probabilistic model**:
	1. If we consider:
		1. a feature vector $X$  $\to$ a random variable(vector)
		2. $Y \to$ a random variable
	2. Then: $X$ and $Y$ are **dependent** (the class label is dependent on the feature vector).
	3. Assume that $(X,Y)\sim \mathrm{P}$ with <font color=#c10b26>joint distribution</font> $\mathrm{P}$.
		1. Then $\mathcal{D}:=\{(X_1,Y_1),\cdots,(X_n,Y_n)\}$ is a sample drawn from $\mathrm{P}$.
		2. We often assume $(X_1,Y_1),\cdots,(X_n,Y_n)$ are i.i.d.
	4. With the distribution $\mathrm{P}$, we can describe **the error of the classifier**. 

>[!important] Expected test error:
>We can quantify <font color=#c10b26>the classifier error</font> by the probability of the classifier making a mistake 
>$$\mathcal{R}(\phi):=\mathbb{P}(\phi(X) \neq Y)$$
>$\mathcal{R}(\phi)$ is called the <font color=#c10b26>expected test error</font>. Intuitively, this corresponds to the average number of mistakes made by the classifier.

- A good classifier $\phi: \mathcal{X}\to \mathcal{Y}$ is one with <font color=#c10b26>a low expected test error.</font>
- We want our classifier to have a <font color=#c10b26>low expected test error</font>.

### The Bayes classifier

>[!info] Bayes classifier
>The classifier with <font color=#c10b26>the lowest expected test error</font> is known as the <font color=#c10b26>Bayes classifier</font> which satisfies:
>$$\mathcal{R}(\phi^{*})=\mathrm{min}\{\mathcal{R}(\phi): \phi: \mathcal{X}\to \mathcal{Y} \text{ is a classifier}\}$$
>So $\phi^{*}$ is a minimiser of the expected test error (over all possible classifiers).
>In the binary case where $\mathcal{Y}:=\{0,1\}$, the Bayes classifier is given by:
>$$\phi^{*}:=\begin{cases}
>1 \quad & \text{if } \mathbb{P}(Y=1|X=x)\geq \mathbb{P}(Y=0|X=x) \\
>0 \quad & \text{if } \mathbb{P}(Y=0|X=x) \geq \mathbb{P}(Y=1|X=x)
>\end{cases}$$
>So $\phi^{*}$ outputs the label (either 0 or 1) with the <font color=#c10b26>biggest conditional probability</font> given the feature $X =x$.

Unfortunately, we often do NOT know the distribution of $(X, Y)$ in practice, So, we can not compute $\phi^{*}$ based on the above formula.
$\Longrightarrow$ We will learn about **the distribution from the data** (using <font color=#c10b26>learning algorithms</font>)!

1. **Training error** vs **test error**:
	1. **Expected test error**: $\mathcal{R}(\phi)=\mathbb{P}(\phi(X)\neq Y)$
	2. The **training error**: $\mathcal{\hat R}_n(\phi):=\dfrac{1}{n}\sum_{i=1}^n \mathbb{1}\{\phi(X_i)\neq Y_i\}$.
		- So the **training error is the average number of mistakes** of the classifier on the training set $\mathcal{D}=\{(X_1,Y_1),\cdots,(X_n,Y_n)\}$.
	3. **Example**: Classifying images
		1. **Training error**: the average number of misclassified images in the <font color=#c10b26>training data</font>. 
		2. **Test error**: the average number of misclassified images in the <font color=#c10b26>whole population</font>.
		3. So having low training error does not imply low expected test error!
2. We can use the **==test data==** to estimate the **expected test error**:
	$$\mathcal{R}:=\mathbb{P}(\phi(X)\neq Y) \approx \text{Average number of mistakes on the test data}$$
	![upgit_20221211_1670718316.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221211_1670718316.png)
	
3. Solution: **Learning algorithms**
	1. Learning algorithms are **a set of procedures** for converting training data into classifiers.
		![upgit_20221211_1670718470.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221211_1670718470.png)

	2. **Example**: Linear Discriminant Analysis, Logistic Regression, Nearest Neighbour classifiers,Random Forests, Boosting, Neural networks, SVMS.



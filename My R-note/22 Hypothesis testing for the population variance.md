---
tags: R
Week: 9
type: lecture
lecture: 22
---

## The chapter's focus
>In our previous lectures, we discuss hypothesis testing for the **population mean**
>e.g., one sample t-test, paired t-test, Welch's t-test,...

In this lecture, our interest is in the population variance...
1. consider the **problem of hypothesis testing** for the **population variance**
2. the use of <font color=#c10b26>chi-squared distributions</font> for hypothesis testing
3. introduce the <font color=#c10b26>chi-squared test</font> for <font color=#c10b26>population variance</font> based on the <u>distributional behaviour of sample variance</u>.
4. look at **an illustrative time series example** where our focus is the variance.

**==Goal==**: Given a sample that is randomly drawn from a <font color=#c10b26>population</font>, we want to know about the <font color=#c10b26>population variance</font>. We want to **decide a statement about the population variance is true or not with a hypothesis test**.

>[!important] Relevant knowledge
>[[18 One sample statistical hypothesis testing#Hypothesis testing|Hypothesis testing]]


## A one-sample test of population variance
1. Suppose that we have an <font color=#c10b26>i.i.d. Gaussian sample</font> $X_1,\cdots,X_n \sim \mathcal{N}(\mu,\sigma^2)$
2. **Goal**: We wish to test <font color=#c10b26>the value of the population variance</font> $\sigma^2$
3. **The hypotheses**: 
	1. Null hypothesis $H_0: \sigma^2=\sigma_0^2$ (here $\sigma^2$ is given)
	2. Alternative hypothesis: $H_1: \sigma^2\neq \sigma_0^2$
4. **The key question is** : what could be <font color=#c10b26>a suitable test statistic</font> for this hypothesis-testing problem.
	Recall the [[18 One sample statistical hypothesis testing#Test statistic|test statistic]].
5. **Test statistic**:
	1. We can start from the **sample variance**:
		The **sample variance** $S_{n}^2:= \dfrac{1}{n-1}\sum_{i=1}^n(X_i-\bar X)^2$ is a [[15 Foundations of statistical estimation_ Consistency,bias and variance#Minimum variance unbiased estimator（最小方差无偏估计）|minimum variance unbiased estimator]] (MVUE) for $\sigma^2$. 
	2. We can define a <font color=#c10b26>test statistic</font> as:
		$$\mathcal{\hat X}^2 :=(n-1) \dfrac{S_n^2}{\sigma_0^2}=\dfrac{\sum_{i=1}^n(X_i-\bar X)^2}{\sigma_0^2}$$
		- If $\sigma\neq \sigma_0$, then $\mathcal{\hat X}^2$ tends to be away from $n-1$, as [[18 One sample statistical hypothesis testing#Test statistic|test statistic]] requires.
		- If $\sigma =\sigma_0$ (under the null hypothesis $H_0$), $\mathcal{\hat X}^2$ follows a [[14 Continuous random variables and limit raws#Chi-squared distribution(卡方分布,卡方检验)|chi-squared distribution]].
		>Lemma
		>Suppose that we have an i.i.d. Gaussian sample $X_1,\cdots,X_n \sim \mathcal{N}(\mu,\sigma^2)$. Then the <font color=#c10b26>chi-squared statistics</font> $\mathcal{\hat X}^2 :=(n-1) \dfrac{S_n^2}{\sigma_0^2}$ follows a <font color=#c10b26>chi-squared distribution</font> with **n一1** degrees of freedom.

### Example

- Let's consider **a time series of stock prices** $S_1, S_2,\cdots, S_{365}$.
- Suppose that we have the following sample stored in a data frame:
```r
bqb_stock_price_df%>%head(10)
```
![upgit_20221210_1670669169.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670669169.png)
#### Modelling a time series of stock prices
1. Let's visualise the time series:
	```r
	bqb_stock_price_df%>%
	ggplot(aes(x=date,y=price))+
	geom_line()+theme_bw()+
	ylab("BQB price($)")+xlab("Date")
	```
	![upgit_20221210_1670669672.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670669672.png)

2. Let's consider a time series of stock prices $S_1,S_2,\cdots, S_{365}$.
	- Notice that the series of price $S_1,S_2,\cdots, S_{365}$ is not **independent**, as the stock price today depends on the <font color=#c10b26>price yesterday</font> (see the plot above).
3. To see this, we can also look at the **sample correlation** between $S_t$ and $S_{t-1}$.
	```r
	bqb_stock_price_df%>%
	mutate(price_yesterday=lag(price))%>%  #compute a lagged version of a time series
	select(price,price_yesterday)%>%
	cor(use="pairwise.complete.obs")
	```
	![upgit_20221210_1670670137.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670670137.png)
	So $S_t$ and $S_{t-1}$ are **correlated**, hence they can **not be independent**.
4. Given the dependency, we can model the **stock price** by
	$$S_t:=S_{t-1}\cdot \mathrm{exp}(X_t)$$
	where $X_1,\cdots,X_n \sim \mathcal{N}(\mu,\sigma^2)$ are **i.i.d. Gaussian random variables**.  ^81a2uv
5. Here, we are interested in the <font color=#c10b26>change of prices</font>, so we <font color=#c10b26>investigate the random variables</font> $X_t$.
	1. The parameter $\mu$ corresponds to **the degree of drift in the process**. (drift: 漂移)
	2. The parameter $\sigma$ corresponds to **the level of volatility**. (volatility: 易变; 波动性)

<u>Question</u>: How can we <font color=#c10b26>test hypotheses</font> about the<font color=#c10b26> volatility parameter</font> $\sigma$?

#### Hypothesis testing step by step

![[18 One sample statistical hypothesis testing#Statistical hypothesis testing: key stages]]

1. Formulating the **hypothesis test**:
	![[Data Science/R_Projects/My R-note/22 Hypothesis testing for the population variance#^81a2uv]]
	- Our sample is given by $X_1,\cdots,X_n \sim \mathcal{N}(\mu,\sigma^2)$.
	- We wish to test the value of the population variance $\sigma^2$.
		1. Null: $H_0: \sigma^2=\sigma_0^2$ (here $\sigma_0^2$ is given)
		2. Alternative: $H_1: \sigma^2\neq \sigma_0^2$
2. Checking **modelling assumption:**
	$$\begin{aligned} \mathrm{log}(S_t)=\mathrm{log}(S_{t-1}\mathrm{exp}(X_t)) \\ \\ 
	=\mathrm{log}(S_{t-1})+X_t
	\end{aligned}$$
	$$X_t=\mathrm{log}(S_t)-\mathrm{log}(S_{t-1})$$
	```r
	bqb_stock_price_df%>%
	mutate(log_diffs=log(price)-log(lag(price)))%>%
	ggplot(aes(x=log_diffs))+
	geom_density()+theme_bw()+
	xlab("Daily log differences")
	```
	![upgit_20221210_1670671450.png](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/12/upgit_20221210_1670671450.png)

3. Choose a significance level: $\alpha=0.05$ 
4. Appropriate **statistical test**: 
	1. This is a <u>one-sample test of population variance</u> with **Gaussian data** assumption!
	2. Therefore, we can use the <font color=#c10b26>test statistic</font> $\mathcal{\hat X}^2$ as discussed previously.
		$$\mathcal{\hat X}^2 :=(n-1) \dfrac{S_n^2}{\sigma_0^2}=\dfrac{\sum_{i=1}^n(X_i-\bar X)^2}{\sigma_0^2}$$
5. The **numerical value** of the test statistic:
	- Suppose that the numerical value of the test statistic is $x$.
6. Compute a [[18 One sample statistical hypothesis testing#Definition of the p-value|p-value]] based on the test statistic:
	1. Let $F_{\mathcal{X}_{n-1}^2}$ be **the cumulative distribution** function of $\mathcal{X}^2$ random variable with **n-1** degrees of freedom.
	2. We compute the **p-value** by
		$$p:=2\cdot \mathrm{min}(\mathbb{P}(\mathcal{\hat X}^2 \leq x |H_0),\mathbb{P}(\mathcal{\hat X}^2\geq x | H_0))=2\mathrm{min}(F_{\mathcal{X}_{n-1}^2}(x),1-F_{\mathcal{X}_{n-1}^2}(x))$$
		
		```r
		chi_square_test_one_sample_var<-function(sample,sigma_square_null){
		sample<-sample[!is.na(sample)] #remove any missing values
		n<-length(sample) #sample length
		chi_square_statistic<-(n-1)*var(sample)/sigma_square_null #compute test statistic
		p_value<-2*min(pchisq(chi_square_statistic,df=n-1),
                 1-pchisq(chi_square_statistic,df=n-1)) #compute the p-value
        return(p_value)
        }
		```
		
		```r
		bqb_stock_price_df%>%
		mutate(log_diffs=log(price)-log(lag(price)))%>%
		pull(log_diffs)%>%
		chi_square_test_one_sample_var(sample=.,sigma_square_null = (1/100)^2)
		```
		Results:
		```
		[1] 0.2502084
		```
		
7. Draw **conclusions**:
	- The **p-value** is <font color=#c10b26>bigger</font> than the **significance level**, so we can <u>not reject the null hypothesis</u>. 
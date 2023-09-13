---
tags: R
Week: 3
type: lecture
Lecture: 7
---

- Before performing a formal data analysis process, we can explore it and gain a preliminary understanding, by carrying out exploratory data analysis:
1) Generate questions about the data 
2) Find answers by inspecting your data, with modelling and visualisation techniques 
3) Based on the understanding you gained, generate new questions or refine your questions, and go to step 2)
- **Typical exploratory data analysis processes:**
1) Understanding the meaning and data type of each of the variables aka. features.
2) Computing sample statistics (mean, median, variance, etc.) to understand the main characteristic of the data.
3) Using visualisation to efficiently identify the shape of distributions and key relationships

## A taxonomy of data types

**Common data types:**
**1) Continuous:** Data that can take any value on an interval e.g. bill length in mm
**2) Discrete:** Data with a minimum distance between possible values e.g. year, number of restaurant meals in a month
**3) Categorical:** Data that can take on only a specific set of values representing distinct categories e.g. brand, species, island.
**4) Binary:** Categorical data with exactly two categories e.g. pass or fail a driving test.
**5) Ordinal（顺序的；依次的）:** Categorical data with an ordering e.g. “How was your meal?” on a Likert scale.
![[../../../Attachments/Pasted image 20221127235742.png]](../../../Attachments/Pasted%20image%2020221127235742.png)

## Sample statistics（样本统计）

**Typical statistics that we will cover next:**

> [!note] Types statistics
> 
> 1. Sample mode（样本众数）
> 2. Sample mean（样本均值）
> 3. Sample median（样本中位数）
> 4. Trimmed sample mean（修剪样本均值）
> 5. Sample quantiles and sample percentiles（样本分位数和样本百分位数）
> 6. Sample variance and sample standard deviation（样本方差和样本标准差）
> 7. Sample median absolute deviation（样本中位数绝对偏差）
> 8. Sample range（样本范围）
> 9. Interquartile range（四分位差；四分间距）
> 10. Sample covariance and sample correlation（样本协方差和样本相关性）

### 1. Sample mode

- For **categorical data**,the most representative or typical value is **sample mode**

- Definition:the sample mode is the value which occurs with the highest frequency for a feature within a data set

- Computed by the function `mfv1()` (from the modeest package)
  
  ```r
  #计算众数
  library(palmerpenguins)
  library(modeest)
  mfv1(penguins$species)
  ```
  
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1665579699536-bd424259-fd37-4b0f-92aa-69774cbdb0f4.png#averageHue=%23f8f8f8&clientId=ue970f090-a129-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=64&id=u87b5fea4&margin=%5Bobject%20Object%5D&name=image.png&originHeight=128&originWidth=1194&originalType=binary&ratio=1&rotation=0&showTitle=false&size=14528&status=done&style=none&taskId=u24f87c9d-3ca1-4b11-beb1-6d44312f7e7&title=&width=597)
  
  ```r
  ggplot(penguins,aes(x=species,fill=species))+geom_bar()
  ```
  
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1665579710321-35301c35-348c-490b-a062-a05e5c4d7d25.png#averageHue=%2300b50e&clientId=ue970f090-a129-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=469&id=ua31e70aa&margin=%5Bobject%20Object%5D&name=image.png&originHeight=938&originWidth=1480&originalType=binary&ratio=1&rotation=0&showTitle=false&size=61152&status=done&style=none&taskId=u59a1ca72-d21e-47f9-8b6b-d3506e14b1c&title=&width=740)

### 2. Sample mean

^6c4ab0

- For **numeric type data** (e.g., continues, discrete variables), the most well-known estimate of location is the **sample mean** (the arithmetic mean)
- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$,  then the sample mean is given by

$$
\text{sample mean}:=\dfrac{1}{n}(x_1+x_2+...+x_n)
$$

- In R using the `mean()` function:
  
  ```r
  rainfall<-c(sample(1:100,size=200,replace=TRUE))
  rainfall
  rainmean<-mean(rainfall,na.rm=TRUE)
  rainmean
  ```

### 3. Sample median

- Definition:Suppose that the variable  of interest has values $x_1,x_2,...,x_n$, and $x_1\leq x_2 \leq... \leq x_n$ then the sample median is given by

$$
\text{sample median}:=\dfrac{1}{2}( x_{\lfloor(n+1)/2 \rfloor}+x_{\lceil(n+1)/2\rceil})
$$

> [!Note] **Note**: 
> Here $\lfloor \cdot \rfloor$ is the floor function,$\lceil \cdot \rceil$ is the ceiling function. Eg.$\lfloor 3.4 \rfloor =3 ,\text{ and } \lceil 3.4 \rceil =4.$

- In R using the `median()` function:
  
  ```r
  rainmedian<-median(rainfall)
  rainmedian
  ```

#### Sample mean and outliers（异常值）

- There are two different types of outliers we can encounter in practice:
  - An **error in data** resulting from problems in measurement, recording etc.
  - A faithful representation of a genuinely **anomalous event(异常事件)**. e.g.a day of extremely unusual torrential rainfall.

#### Robustness of the sample median（样本中心值的鲁棒性/稳健性）

- A major advantage of the median over the mean is that it is robust to small corruption in the data set.

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1665612803435-ca37a835-05bd-4bee-8cf6-ae6473c19e5d.png#averageHue=%23ebebe9&clientId=ue37f8901-1166-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=317&id=ubc5338e0&margin=%5Bobject%20Object%5D&name=image.png&originHeight=634&originWidth=1350&originalType=binary&ratio=1&rotation=0&showTitle=false&size=529021&status=done&style=none&taskId=u0ae87776-fa07-4dfc-a5df-91abf97e8cc&title=&width=675)

#### Comparing the sample median and the sample mean

1. The sample median is **robust** to small corruptions in the data set, unlike the
   mean.

2. The sample median effectively **ignores a large section of the data set**, unlike the mean. This makes it difficult to aggregate medians from multiple sources.

### 4. Trimmed sample mean

- The trimmed sample mean is the mean computed after **removing a prescribed fraction of the data.**
- Definition: Suppose that the variable of interest has values $x_1,x_2,...,x_n$, and $x_1\leq x_2 \leq... \leq x_n$.The **trimmed sample mean** with trim fraction $q \in(0,1/2]$ is computed as follows:

$$
\text{trimmed sample mean}:={\dfrac{1}{n-2\cdot\left\lfloor{q \cdot n}\right\rfloor}}{\sum_{i=\left\lfloor{q \cdot n}\right\rfloor+1}^{n-{\left\lfloor{q \cdot n}\right\rfloor}}}{x_i}
$$

- Example:
  - Sample:1 2 3 4 10
  - Trimmed sample mean(q=1/4):(2+3+4)/3=3
  - Recall that:Mean:(1+2+3+4+10)/5=4
- Trimmed data去头去尾取平均

```r
sam<-c(1,2,3,4,10)
sam
trimmed_mean<-mean(sam,na.rm=TRUE,trim=0.25)
trimmed_mean
```

 Results:
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1665733418231-e7852078-2ba5-4eeb-8e84-16c5acc202f0.png#averageHue=%23fafafa&clientId=ue0fee757-66f0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=58&id=uabf30c83&margin=%5Bobject%20Object%5D&name=image.png&originHeight=116&originWidth=1132&originalType=binary&ratio=1&rotation=0&showTitle=false&size=10149&status=done&style=none&taskId=ua5b33bc7-4681-44f9-8d19-90d2128c161&title=&width=566)

- The trimmed sample mean is **more robust to outliers** than the **mean** but **more sensitive than the median**

#### Example:Palmer Penguins Dataset

```r
flippers<-penguins%>%filter(species=='Adelie')%>%select(flipper_length_mm)%>%unlist()%>%as.vector()
f_mean<-mean(flippers,na.rm=TRUE)
f_median<-median(flippers,na.rm=TRUE)
f_mean_trim<-mean(flippers,na.rm=TRUE,trim=0.05) #trimmed mean
print(paste('mean:',f_mean))
print(paste('median:',f_median))
print(paste('trim mean',f_mean_trim))
```

**Results:**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666469955402-321d16d1-c61e-456c-b8cd-7d2046bd2045.png#averageHue=%23f1f1f1&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=73&id=uedbe3955&margin=%5Bobject%20Object%5D&name=image.png&originHeight=146&originWidth=872&originalType=binary&ratio=1&rotation=0&showTitle=false&size=22616&status=done&style=none&taskId=u827100ae-85d0-4086-a941-9d90db9ba11&title=&width=436)

```r
# a function for adding arrow & annotation
vline_w_anno<-function(plot_object,value,linetype,color,y,label){
  plot_object2<-plot_object+geom_vline(xintercept=value,linetype=linetype,color=color,size=1.5)+
    geom_curve(x=value+10,xend=value,y=y,yend=y,arrow=arrow(length=unit(0.5,'cm')))+geom_text(x=value+10,y=y,label=label,color=color)
  return (plot_object2)
}

penguins_plot<-ggplot(flippers,aes(x=flipper_length_mm))+xlab('Flipper length(mm)')+geom_histogram(binwidth=2)

penguins_plot%>%vline_w_anno(f_mean,'dashed','red',25,'mean')%>%
  vline_w_anno(f_median,'dotdash','blue',20,'median')%>%
  vline_w_anno(f_mean_trim,'dotted','purple',15,'trimmed mean')
```

**Results:**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470099953-dd97588c-b356-48e0-b631-8dfda3e40296.png#averageHue=%23d3d3d3&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=253&id=u369cab5d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=505&originWidth=818&originalType=binary&ratio=1&rotation=0&showTitle=false&size=34347&status=done&style=none&taskId=u964abc14-9ede-49c6-90c2-a5b6e62fc6c&title=&width=409)

### 5. Sample quantiles and sample percentiles

#### Sample quantiles

- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$, and $x_1\leq x_2 \leq ...\leq x_n$. For $q \in (0,1]$,the **q-quantile** is of the following form:

$$
x_{max(\left\lfloor qn \right\rfloor ,1 )}\leq \text{q-quantile}\leq x_{\left\lceil qn \right\rceil}
$$

- **Example**:
    Sample:1 2 3 4 10
    2 is a 0.25-quantile of the sample;3 is a 0.5-quantile of the sample

#### Sample percentiles

- **Definition**: For $q\in [0,100]$,the sample q-th percentile is precisely the same as the sample (0.01q)-percentile
  
  - So 25th percentile=0.25 quantile, and 78th percentile=0.78 quantile

- **Example**:
    Sample:1 2 3 4 10
    Then 2 is the 25th percentile of the sample;
    3 is the 50th percentile of the sample

- **Quartile**:

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666459446660-cf5043b8-a531-44c7-9131-d51098e8bea9.png#averageHue=%23e7d4bf&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=77&id=u33c708a8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=154&originWidth=682&originalType=binary&ratio=1&rotation=0&showTitle=false&size=86242&status=done&style=none&taskId=uf17ca7b4-eb97-411b-ab61-9adf7c60aeb&title=&width=341)

- **Example**: **Palmer penguins Dataset**
  
  ```r
  probabilities<-c(0.25,0.5,0.75)
  quantiles<-quantile(flippers,probs=probabilities,na.rm=TRUE)
  quantiles
  ```
  
  **Results:**
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470219284-797928d9-a9e4-4ac8-a93a-822e37f0e240.png#averageHue=%23f7f7f6&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=58&id=uf337abd1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=116&originWidth=446&originalType=binary&ratio=1&rotation=0&showTitle=false&size=23279&status=done&style=none&taskId=ufb9ce42c-be4a-4f53-8fec-55b7c26aad1&title=&width=223)
  
  ```r
  ggplot(tibble(flippers),aes(x=flippers))+
  theme_bw()+
  geom_density(adjust=1,size=1)+
  xlab('Flipper length(mm)')+
  ylab('Density')+
  geom_vline(xintercept=quantiles,linetype='dashed',color='blue')+
  annotate('label',x=quantiles,y=0.0325,size=5,fill='white',label=probabilities)+
  annotate('label',x=quantiles,y=0.0275,size=5,fill='white',label=quantiles)
  ```
  
  **Results:**
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470308892-199a475d-be0d-4115-a2bf-f0f29901bb40.png#averageHue=%23f4f4f4&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=253&id=u9df60470&margin=%5Bobject%20Object%5D&name=image.png&originHeight=505&originWidth=818&originalType=binary&ratio=1&rotation=0&showTitle=false&size=53243&status=done&style=none&taskId=ucd4e8f73-3b2e-42c8-baf9-edb0d23af84&title=&width=409)
  
  ### 6. Sample variance and sample standard deviation
  
  The classical measures of **variability** are the sample variance and sample standard 
  deviation

- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$, then the sample variance and sample standard deviation are given by

$$
\text{sample-variance}:=\dfrac{1}{n-1}\sum_{i}^{n} (x_i-\text{sample-mean})^2,
$$$$ 
\text{sample-standard-deviation}:=\sqrt{\text{sample-variance}}.
$$

#Question: Why is $n-1$?
$$
\text{population\_variance}:=\dfrac{1}{n}\sum_{i}^{n} (x_i-\text{population\_mean})^2,
$$$$ \text{population\_standard\_deviation}:=\sqrt{\text{population\_variance}}.
$$

- **Example**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666460460512-0fbb653e-46b9-4827-9725-9f315d97a26f.png#averageHue=%23f5f3f2&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=53&id=u1eb53691&margin=%5Bobject%20Object%5D&name=image.png&originHeight=106&originWidth=1108&originalType=binary&ratio=1&rotation=0&showTitle=false&size=26711&status=done&style=none&taskId=ub1b7b704-8118-4afb-8a3c-6dfaacdaa0e&title=&width=554)

- **Example(using R function var() and ad()):**
  
  ```r
  # variance
  var(flippers,na.rm=TRUE)
  ```
  
  **Results:**
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470376127-6f53fa3e-e466-4db0-8a4f-e9e9ca709ed5.png#averageHue=%23ededed&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=41&id=ub20a9d34&margin=%5Bobject%20Object%5D&name=image.png&originHeight=82&originWidth=328&originalType=binary&ratio=1&rotation=0&showTitle=false&size=5670&status=done&style=none&taskId=u5b722ab0-a033-407e-981a-5d906375c97&title=&width=164)
  
  ```r
  #deviation
  sd(flippers,na.rm=TRUE)
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470419646-9759672e-cabc-417c-99f4-c081f28a37fe.png#averageHue=%23f1f1f1&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=37&id=u08b6b6c1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=74&originWidth=460&originalType=binary&ratio=1&rotation=0&showTitle=false&size=6427&status=done&style=none&taskId=u52cae8bc-7e0e-4e23-8810-70f53fe9d43&title=&width=230)

### 7. Sample median absolute deviation

The **median absolute deviation** is a robust alternative to the standard deviation.

- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$,then the sample median absolute deviation is computed by

$$
D_i:=|x_i-\mathrm{Median}(x_1,x_2,...,x_n)|,\:i=1,2,...n,
$$

$$
\text{sample-median-absolute-deviation}:=1.4826\cdot \mathrm{Median}(D_1,D_2,...,D_n)
$$

Here `Median()` is the function for computing sample medians.

- **Example**: (using R function `mad()`)
  
  ```r
  exam<-c(1,3,4,2,5,10,2,3,6)
  mad(exam,na.rm=TRUE)
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470522073-6aa95fdb-13b7-4361-88f5-72a64fee133a.png#averageHue=%23f0f0f0&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=46&id=u7294241e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=92&originWidth=340&originalType=binary&ratio=1&rotation=0&showTitle=false&size=5647&status=done&style=none&taskId=uab9b8d60-d271-437b-b4f0-de0987f058b&title=&width=170)
  
  ```r
  mad(flippers,na.rm=TRUE)
  ```
  
  **Results:**
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470537151-a8466916-1fe2-4dc2-a6d2-eaa461c5ad0f.png#averageHue=%23fcfcfb&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=34&id=ud3bb7081&margin=%5Bobject%20Object%5D&name=image.png&originHeight=68&originWidth=362&originalType=binary&ratio=1&rotation=0&showTitle=false&size=11198&status=done&style=none&taskId=ub8e3e0f3-a18d-4919-a466-d6e1889b4ce&title=&width=181)
  
  ### 8. Sample range
  
  Another simple estimate of **variability** is the sample range.

- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$,and $x_1\leq x_2 \leq ...\leq x_n$. The sample range is given by:

$$
\text{sample range}:=x_n-x_1
$$

So the sample range is the largest value subtracted by the smallest value

- **Example**:(computing sample range using R):
  
  ```r
  range(flippers,na.rm=TRUE)
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470608984-4cee5a3e-b894-433a-a480-621d901954c1.png#averageHue=%23f9f9f8&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=42&id=ua7ca6736&margin=%5Bobject%20Object%5D&name=image.png&originHeight=84&originWidth=290&originalType=binary&ratio=1&rotation=0&showTitle=false&size=12399&status=done&style=none&taskId=u30ea360b-44a4-4a96-a6c1-940b576f000&title=&width=145)
  
  ```r
  diff(range(flippers,na.rm=TRUE))
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470623441-ffc5e8c5-85ea-4c9a-b4e3-6f1d553bf0d1.png#averageHue=%23efefef&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=45&id=u8032f7ab&margin=%5Bobject%20Object%5D&name=image.png&originHeight=90&originWidth=274&originalType=binary&ratio=1&rotation=0&showTitle=false&size=4852&status=done&style=none&taskId=u9ef0a345-ada5-494e-a4f0-b1835900407&title=&width=137)

> [!note] Note: 
> The sample range has the major drawback of being extremely sensitive to **outliers**

### 9. Interquartile range

The concept of quantiles can be used to **give a more robust estimate of variability**

> [!note] Note
> The **interquartile range** is the range of the sample after **removing the largest/smallest  values**

- **Definition:** Suppose that the variable of interest has values $x_1,x_2,...,x_n$,then the interquartile range is computed by

$$
\text{Interquartile-range}=\text{0.75-quantile}-\text{0.25-quantile}
$$

- **Example**: (computing the interquartile range using R)
  
  ```r
  quantiles=quantile(flippers,prob=c(0.25,0.5,0.75),na.rm=TRUE)
  print(quantiles)
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470698772-092d1cae-c0ff-47fc-8476-af29585a0327.png#averageHue=%23f3f2f1&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=62&id=u35056447&margin=%5Bobject%20Object%5D&name=image.png&originHeight=124&originWidth=234&originalType=binary&ratio=1&rotation=0&showTitle=false&size=19720&status=done&style=none&taskId=u0fd72506-b2ae-46d6-b07c-bc54801af07&title=&width=117)
  
  ```r
  IQR(flippers,na.rm=TRUE)
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470738118-bb7960aa-0ae3-4944-ab5c-edfec9f2eb6e.png#averageHue=%23e6e6e6&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=35&id=u1feaf0f1&margin=%5Bobject%20Object%5D&name=image.png&originHeight=70&originWidth=194&originalType=binary&ratio=1&rotation=0&showTitle=false&size=4007&status=done&style=none&taskId=u875acc02-ba85-440a-8e1b-c449356a7f4&title=&width=97)

#### Outlier

- An **outlier** is a value in a data set which differs substantially from other values.
  - for example, a value is much bigger than the rest of the values
- One way to find outliers is based on quantitative formulation:
  - Suppose that the variable of interest has values $x_1,x_2,...,x_n$,then $x_i$ is an outlier if

$$
x_i>\text{0.75-quantile}+1.5 \times \text{Interquartile-range}\quad \text{or } \\ 
x_i<\text{0.25-quantile}-1.5\times \text{Interquartile-range}
$$

- **Example: (Using R function)**
  
  ```r
  quantile25<-quantile(flippers,0.25,na.rm=TRUE)
  quantile75<-quantile(flippers,0.75,na.rm=TRUE)
  iq_range<-IQR(flippers,na.rm=TRUE)
  outliers<-flippers[(flippers>quantile75+1.5*iq_range)|(flippers<quantile25-1.5*iq_range)]
  outliers
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470807018-fb43998c-2e86-410c-969b-a822124837a5.png#averageHue=%23ececec&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=41&id=u3b5e313e&margin=%5Bobject%20Object%5D&name=image.png&originHeight=82&originWidth=336&originalType=binary&ratio=1&rotation=0&showTitle=false&size=6081&status=done&style=none&taskId=udfbd213c-1c88-4f9d-85fa-a5dfa437972&title=&width=168)
  
  ### 10. Relating variables via sample covariance and sample correlation
  
  The **covariance and correlation** give us ways to see how connected two continuous variables are.
  
  #### Sample covariance

- The sample covariance gives us ways to see how connected two variables or features are

- **Definition**: Suppose that the variable of interest has values $x_1,x_2,...,x_n$,and $y_1,y_2,...y_n$.The **sample covariance** can be computed as

$$
\mathrm{Covar}(\{x_i\}_i^n,\{y_i\}_i^n):=\dfrac{1}{n-1}\sum_{i=1}^n (x_i-\bar x)\cdot (y_i-\bar y)
$$

NoteWhere $\bar x$ and $\bar y$ are the sample means of $\{x_i\}_i^n$ and $\{y_i\}_i^n$, respectively.
#Question :样本（sample）协方差的分母是n-1，总体（population）协方差的分母是n，and why？

- **Example**: (computing the covariance of flipper length and bill length):
  
  ```r
  # example
  con1<-c(1,8,4,3,2,4)
  con2<-c(3,2,10,1,4,3)
  print(con1)
  print(con2)
  print(mean(con1))
  print(mean(con2))
  re<-function(x,y){
  return((x-mean(con1))%*%(y-mean(con2)))
  }
  result<-map2_dbl(con1,con2,re)
  result
  sum_result<-sum(result)
  sum_result/6 #总体协方差
  cov(con1,con2) #样本协方差 区别？
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470896951-238fe3dd-1445-41ba-90db-aca1a1b66ad9.png#averageHue=%23f7f7f6&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=151&id=ua46dde0a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=302&originWidth=744&originalType=binary&ratio=1&rotation=0&showTitle=false&size=102047&status=done&style=none&taskId=u9094ac49-018d-4946-be8c-ddd7b661bb2&title=&width=372)
  
  ```r
  cov(penguins$flipper_length_mm,penguins$bill_length_mm,use='complete.obs')
  #'complete.obs'的含义
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666470979010-41f19e8e-1b46-44f9-993c-498606ec0ad6.png#averageHue=%23f9f9f8&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=40&id=ub327443f&margin=%5Bobject%20Object%5D&name=image.png&originHeight=80&originWidth=342&originalType=binary&ratio=1&rotation=0&showTitle=false&size=13542&status=done&style=none&taskId=ue479ff26-d0bb-491a-81a4-bfc901b1b19&title=&width=171)
  
  > [!note] Note
  > NB: The sample covariance takes values in $(-\infty,+\infty)$.

#### Sample correlation

- The **sample correlation** is a **normalized version** of the sample covariance.
- Definition: Suppose that the variable of interest has values $x_1,x_2,...,x_n$,and $y_1,y_2,...y_n$. The **sample correlation** can be computed as

$$
\mathrm{Corr}(\{x_i\}_i^n,\{y_i\}_i^n):=\dfrac{\mathrm{Covar}(\{x_i\}_{i=1}^n,\{y_i\}_{i=1}^n)}{\text{Standard-deviation}((x_i)_{i=1}^n)\cdot \text{Standard-deviation}((y_i)_{i=1}^n)}
$$

- **Example**: (computing the correlation of flipper length and bill length)
  
  ```r
  cor(penguins$flipper_length_mm,penguins$bill_length_mm,use='complete.obs')
  ```
  
  **Results**:
  ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666471039229-aaf9f805-4c8b-4a81-8997-679f81b79c63.png#averageHue=%23f9f9f8&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=42&id=u1cd2f463&margin=%5Bobject%20Object%5D&name=image.png&originHeight=84&originWidth=348&originalType=binary&ratio=1&rotation=0&showTitle=false&size=15071&status=done&style=none&taskId=ud31b2d49-6edc-4e50-a69f-62fb7f1d328&title=&width=174)
  
  > [!Note] 
  > NB: The sample correlation takes values in $(-1,1)$

| **Positive correlation**                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666467005152-2efd4683-dd20-41fd-82bb-70861df0736e.png#averageHue=%23ebebea&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=67&id=ua76d76b2&margin=%5Bobject%20Object%5D&name=image.png&originHeight=134&originWidth=2262&originalType=binary&ratio=1&rotation=0&showTitle=false&size=159841&status=done&style=none&taskId=u16f5a11d-53ed-42f2-bc69-50b276d5c08&title=&width=1131)   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666466984338-0853f000-3e89-47fb-8769-37b6e9ec72b2.png#averageHue=%23e9e9e9&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=150&id=ua2a50ef3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=300&originWidth=340&originalType=binary&ratio=1&rotation=0&showTitle=false&size=21490&status=done&style=none&taskId=uc5221ad5-d10b-494b-80a3-7a3449efb12&title=&width=170) | **Example**:The height and weight of an animal are positively correlated.                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Negative correlation**                                                                                                                                                                                                                                                                                                                                                                                                                                              | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666467010571-4fed4208-9aa2-40b4-a6d7-9eacfeb4fd9b.png#averageHue=%23e7e7e7&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=67&id=u60e0666b&margin=%5Bobject%20Object%5D&name=image.png&originHeight=133&originWidth=2277&originalType=binary&ratio=1&rotation=0&showTitle=false&size=178109&status=done&style=none&taskId=ua36af6ed-ffaf-4e41-9bbf-6ca20e4d381&title=&width=1138.5) |
| ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666466992401-64f21866-3695-4b19-946a-67b5ac5883db.png#averageHue=%23eaeae9&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=146&id=u90245fda&margin=%5Bobject%20Object%5D&name=image.png&originHeight=292&originWidth=340&originalType=binary&ratio=1&rotation=0&showTitle=false&size=73101&status=done&style=none&taskId=u9290e1c4-29b7-4b0d-8948-17788da2881&title=&width=170) | **Example**:The driving speed and number of car accidents are negatively correlated                                                                                                                                                                                                                                                                                                                                                                                       |

### 11. Understanding box plots

#### Example

```r
ggplot(data=penguins,aes(x=flipper_length_mm,y=species))+
  geom_boxplot()+
  xlab("Flipper length(mm)")+
  ylab("Penguin species")
```

**Results**:
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666471131551-d7660b3d-171a-486a-b49f-4540032038f1.png#averageHue=%23eaeaea&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=253&id=u84271641&margin=%5Bobject%20Object%5D&name=image.png&originHeight=505&originWidth=818&originalType=binary&ratio=1&rotation=0&showTitle=false&size=33991&status=done&style=none&taskId=u9582de9a-fd93-495e-8081-60e61c93663&title=&width=409)

#### Understanding box plots

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666467113601-05f230ba-6f0f-4b4a-950c-7db90c95e4fe.png#averageHue=%23f6f6f3&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=364&id=u1a7155a6&margin=%5Bobject%20Object%5D&name=image.png&originHeight=728&originWidth=1334&originalType=binary&ratio=1&rotation=0&showTitle=false&size=751468&status=done&style=none&taskId=u9cfdc9f2-9a7e-43fc-8202-cb73059b4f1&title=&width=667)

## Sample vs. population

### Sample

1. We refer to the **data set** as a **data sample** or just **sample.**

2. The statistics associated with the dataset are called **sample mean, sample median,** etc
   
   ### Population
   
   In statistics, population refers to the **entire group of individuals** from which your sample is drawn.
   ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1666467311775-6649b3ea-a7d0-44d6-871f-18270c003fb5.png#averageHue=%2374674d&clientId=uc593821d-98c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=234&id=u2df9bb99&margin=%5Bobject%20Object%5D&name=image.png&originHeight=468&originWidth=1344&originalType=binary&ratio=1&rotation=0&showTitle=false&size=631976&status=done&style=none&taskId=u548fbe90-74a5-4193-9035-635ffa402ac&title=&width=672)
   
   ### Relationship between Sample and Population
   
   We compute **sample statistics** based on the data, but our true interests often lie in the associated **population quantity**.

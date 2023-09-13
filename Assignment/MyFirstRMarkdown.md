---
title: "R Notebook"
tags: R
Week: 1
type: assignment
---

## Create a data frame

**Step1:** Create a vector called animals which contains the names of a few animals. The code chunk appears: 

```r
animals<-c("Snake","Bird","Dog","Spider")
animals
```

```
[1] "Snake"  "Bird"   "Dog"    "Spider"
```

**Step2:** Create a vector of the same length called num legs which gives the number of legs of the different animals. 

```r
num_legs<-c(0,2,4,8)
num_legs
```

```
[1] 0 2 4 8
```

**Step3:** Now combine these two vectors in a data frame called `animals_df` which has two columns - one with the names of animals, and another with their respective numbers of legs. 
```r
animals_df<-data.frame(animals,num_legs)
animals_df
```
![upgit_tmp_1669541942819469.png}|700](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669541942.png)

## Check and delete objects

**Step1:**  #Rnote `ls()` which returns a vector of character strings
giving the names of the objects in the environment. 

```r
ls()
```
![upgit_tmp_1669542222550820.png}|500](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221127_1669542222.png)

**Step2:** use the function `rm()` to remove the objects `num_legs` from the working environment #Rnote 

```r
rm(num_legs)
```

**Step3:** Remove all objects in the working environment.

```r
rm(list=ls())
```

## Matrix operations

### 1. Create Matrix
>[[../My R-note/R Basics#Matrix|Create Matrix]]

Use the `seq()` function to generate a sequence of numbers starting at 12 and decreasing to 2 in steps of -2. Call this vector `x_vect`. You may want to run `?seq` or `help(seq)` to help you do this
```r
x_vect<-seq(12,2,-2)
x_vect
```

```
[1] 12 10  8  6  4  2
```

Now convert the vector `x_vect` into a <u>matrix</u> (with 2 rows and 3 columns) called $X$, using the `matrix()` function. The result should look like this:

```r
X<-matrix(x_vect,2,3)
X
```

```
     [,1] [,2] [,3]
[1,]   12    8    4
[2,]   10    6    2
```

Next create a 2 by 2 matrix called $Y$ consisting of a sequence of four numbers from 1-4. The matrix $Y$ should look like this:

```r
Y<-matrix(seq(4),2,2)
Y
```

```
     [,1] [,2]
[1,]    1    3
[2,]    2    4
```

In addition, create another 2 by 2 matrix called $Z$ which looks as follows:

```r
Z<-matrix(seq(4,10,2),2,2)
Z
```

```
     [,1] [,2]
[1,]    4    8
[2,]    6   10
```

### 2. Operations

#### Transpose
$$
A^T =
\begin{pmatrix}
a_{11} & a_{21} \\
a_{12} & a_{22}
\end{pmatrix}
\quad \text{where} \quad 
A= \begin{pmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{pmatrix}
$$
Use the `t()` function to compute $Y^T$ and $Z^T$.

```r
YT<-t(Y)
ZT<-t(Z)
print(YT)
print(ZT)
```

```
     [,1] [,2]
[1,]    1    2
[2,]    3    4
     [,1] [,2]
[1,]    4    6
[2,]    8   10
```

#### Matrix sums.
Compute the matrix sums $Y+Z$ and $Z+Y$ . The result in both cases should be the same. We call such operations commutative. This means that reversing the order does not change the result.

```r
Y+Z
```

```
     [,1] [,2]
[1,]    5   11
[2,]    8   14
```

```r
Z+Y
```

```
     [,1] [,2]
[1,]    5   11
[2,]    8   14
```

#### Matrix multiplication
The matrix multiplication between two 2 by 2 matrices A and B, is defined as:
$$
AB=\begin{pmatrix}
a_{11}b_{11}+a_{12}b_{21} & a_{11}b_{12}+a_{12}b_{22}\\
a_{21}b_{11}+a_{22}b_{21} & a_{21}b_{12}+a_{22}b_{22}
\end{pmatrix}
\quad \text{where} \quad 
A=\begin{pmatrix}
a_{11} & a_{12}\\
a_{21} & a_{22}
\end{pmatrix},\quad
B=\begin{pmatrix}
b_{11} & b{12}\\
b_{21} & b_{22}
\end{pmatrix}.
$$
Compute the matrix products $YZ$ and $ZY$
(1) the results are not same
(2) matrix multiplication is not commutative.

```r
result1<-Y%*%Z
result2<-Z%*%Y
result1
result2
```

```
     [,1] [,2]
[1,]   22   38
[2,]   32   56
     [,1] [,2]
[1,]   20   44
[2,]   26   58
```

In addition, compute the matrix product $YX$ .

```r
result3<-Y%*%X
result3
```

```
     [,1] [,2] [,3]
[1,]   42   26   10
[2,]   64   40   16
```

Try to compute the matrix product $XY$ . We get the error message because <b><u>the non-conformable arguments</u></b>

```r
result4<-X%*%Y
result4
```

```
Error in X %*% Y : non-conformable arguments
```

#### Matrix element-wise multiplication
Compute the element-wise matrix products $Y \odot Z$ and $Z \odot Y$ .
$$
A \odot B= \begin{pmatrix}
a_{11}b_{11} & a_{12}b_{12}\\
a_{21}b_{21} & a_{22}b_{22}
\end{pmatrix}
$$
(1) the results are the same
(2) element-wise multiplication is commutative.
```r
result4<-Y*Z
result4
```

```
     [,1] [,2] [,3]
[1,]   42   26   10
[2,]   64   40   16
```

#### Matrix inverse
#Rnote  `solve()` :get the result of $Y^{-1}$
`solve()` function:
```r
M_inverse<-solve(Y)
M_inverse
```

```
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
```

Compute $Y^{-1}Y$ in R: 

```r
M_YY<-M_inverse%*%Y
M_YY
```

```
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```

Compute $Y^{-1}X$.

```r
M_YX<-M_inverse%*%X
M_YX
```

```
     [,1] [,2] [,3]
[1,]   -9   -7   -5
[2,]    7    5    3
```

### about solve()

use `?solve()` to check the usage of `solve()`

```r
result<-solve(Y,X)
result
```

```
     [,1] [,2] [,3]
[1,]   -9   -7   -5
[2,]    7    5    3
```

>[!conclusion] 
>`solve(Y,X)` =$Y^{-1}X$=`solve(Y) %*% X`


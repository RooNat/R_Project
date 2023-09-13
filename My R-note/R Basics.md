---
title: "R Notebook"
Week: 1
tags: R toReview
type: lecture
Lecture: 2
---

## Data Structure
### Vector

```r
x<-c(3,7,4,2,1,2,-4,-5)
x
```

```
[1]  3  7  4  2  1  2 -4 -5
```

#Rnote  `seq()` : generate a sequence 
```r
y<-seq(5) #generate a sequence
y
```

```
[1] 1 2 3 4 5
```


```r
x[3] #access a element of a vector
```

```
[1] 4
```


```r
x[c(2,3)]
```

```
[1] 7 4
```


```r
x[1:4]   #access the first four element like this
```

```
[1] 3 7 4 2
```

```r
z<-c("Bristol","Bath","London")   #a vector of strings
z
```

```
[1] "Bristol" "Bath"    "London"
```

```r
w<-c(TRUE,FALSE,TRUE,FALSE)  #a vector of Booleans
w
```

```
[1]  TRUE FALSE  TRUE FALSE
```

```r
a<-c(TRUE,3,"Bristol")   #You can't have a vector of mixed type!!!!
a
#they are all characters
```

```
[1] "TRUE"    "3"       "Bristol"
```

 #Rnote  `mode()` :查看vector的type 💡

```r
mode(a)  # You can test the type like this
```

```
[1] "character"
```

---

### Matrix

```r
M<-matrix(seq(10),2,5)
M
#generate a 2 by 5 matrix
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
```

```r
M[2,3] #The third element of the second row
```

```
[1] 6
```

```r
M[,4] #or we can inspect the entire four column
```

```
[1] 7 8
```

#Rnote  `is.vector()` : 判断是否是vector的类型 

```r
is.vector(M[2,]) # we can check that a selected row or column is a vector
```

```
[1] TRUE
```

---

### Lists
- lists can be of mixed type
- lists members can be named like a dictionary
```r
first_list<-list(TRUE,3,"Bristol")  # be different from vector, lists can be of mixed type
first_list
```

```
[[1]]
[1] TRUE

[[2]]
[1] 3

[[3]]
[1] "Bristol"
```

```r
second_list<-list(t_value=TRUE,num_value=3,city="Bristol") #lists members can be named like a dictionary
second_list$t_value
```

```
[1] TRUE
```


```r
second_list$num_value
```

```
[1] 3
```


```r
second_list$city
```

```
[1] "Bristol"
```

---

### Data frames 

Data frames are powerful objects for representing and manipulating **tabular data**

```r
city_name<-c("Bristol","Manchester","Birmingham","London")
population<-c(0.5,0.5,1,9)
first_data_frame<-data.frame(city_name,population)
first_data_frame
```
![upgit_tmp_1669492690871454.png}|600*400](https://raw.githubusercontent.com/RooNat/Myimages/main/2022/11/upgit_20221126_1669492690.png)


Unlike **matrices**, in <u>data frames</u>,

-   columns are **named**

-   different columns may be of **different type**

However, the cells within a column must be of the same type

---
## Operations
### Arithmetic operations

```r
((4+2-1)*4/2)^2
```

```
[1] 100
```

```r
#在sample中，replace=TRUE代表一个样本可以出现好几次
a<-matrix(sample(1:10,6,replace=T),2,3) #a random 2 by 3 matrix
a
b<-matrix(sample(1:10,6,replace=T),2,3)
b
a*b
```

```
     [,1] [,2] [,3]
[1,]    6    3    6
[2,]   10    8    1
     [,1] [,2] [,3]
[1,]    8    7    3
[2,]    1    2    7
     [,1] [,2] [,3]
[1,]   48   21   18
[2,]   10   16    7
```
>[!note] Note #Rnote 
>1. `sample()` takes a sample of the specified size from the elements of `x` using either **==with or without replacement==**.
>2. `replace=T` stands for multiple occurs for one sample.

```r
a%*%t(b)
# t(b) computes the transpose of b
#%*% performs matrix multiplication
```

```
     [,1] [,2]
[1,]   87   54
[2,]  139   33
```
>[!note] Note #Rnote 
>1. `%*%`  performs [[../Assignment/MyFirstRMarkdown#Matrix multiplication|matrix multiplication]] 
>2.  `t(b)` computes the [[../Assignment/MyFirstRMarkdown#Transpose|transpose]] of b 


---

### Boolean operations

**NOT(complement)** **AND(conjunction)** **OR(disjunction)** **XOR(exclusive disjunction)**

```r
a<-c(TRUE,TRUE,FALSE,FALSE)
b<-c(TRUE,FALSE,TRUE,FALSE)
!a #not a
```

```
[1] FALSE FALSE  TRUE  TRUE
```

```r
a&b # a and b
```

```
[1]  TRUE FALSE FALSE FALSE
```

```r
a|b # the inclusive or between a and b
```

```
[1]  TRUE  TRUE  TRUE FALSE
```

-   异或运算：值不相等时为真

```r
xor(a,b) # the exclusive or between a and b
```

```
[1] FALSE  TRUE  TRUE FALSE
```

---
## Functions
### Define a function

```r
is_prime<-function(num){
  stopifnot(is.numeric(num),num%%1==0,num>0)

  t_val<-TRUE

  if(num<2){
    t_val<-FALSE
  }else if(num>2){
    for(i in 2:sqrt(num)){
        if(num%%i==0){
            t_val<-FALSE
            break
        }
    }
  }
  return(t_val)
}
is_prime(39)

```

```
[1] FALSE
```

---

### Call-by-value semantics

In R, arguments in functions are passed with call-by-value semantics.

The value of a variable, but not its address, is passed to the function

```r
a<-seq(5,2)
demo_func_1<-function(x){
  x[2]<- -10
  print(x)
}
demo_func_1(a)
```

```
[1]   5 -10   3   2
```

```r
a # Note that the value of a is unchanged
```

```
[1] 5 4 3 2
```

This facilitates a functional programming style with limited side effects

---

### Lazy evaluation

In lazy evaluation, a symbol can be defined (for example, in a function), but it will only be evaluated when it is needed

A more complicated example(**num_to_sub**)

```r
subtraction_function<-function(num_to_sub){
  output_function<-function(x){
    return (x-num_to_sub)
  } #a function with input x and output x minus num_to_sub
  return (output_function) #output this function
}
a<-1 #initialise
f1<-subtraction_function(a) #construct a function which subtracts
f1
print(f1(2))
```

```
function(x){
    return (x-num_to_sub)
  }
<environment: 0x7fe53f98bda8>
[1] 1
```

```r
a<-2 # modify 
print(f1(2)) #doesn't change the function
```

```
[1] 1
```

Lazy evaluation enables efficiency but has some surprising consequences.

```r
b<-1 #now initialise a new variable b
f2<-subtraction_function(b)
b<-2  # modify the value of b
print(f2(2)) #evaluating the function reveals that the second choice of b was used
b<-1
print(f2(2))
```

```
[1] 0
[1] 0
```

## How can we learn more
1. In R, we can use the help function:

```r
>?name_of_function
>hlep(name_of_function)
```

3. A fantastic resource to learn more about R is the Swirl package:

```r
install.packages("swirl")
library(swirl)
```

5. A resource is StackOverflow for R:
https://stackoverflow.com/questions/tagged/r
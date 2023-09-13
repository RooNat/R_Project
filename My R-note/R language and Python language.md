## Basic comparison
|  | ### R language
 | ### Python language
 |
| --- | --- | --- |
| **Reverse Words**
**（保留字）** | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664890411950-8d2f5e35-6c30-49b1-ae83-842f894ad13d.png#averageHue=%23fcfcfc&clientId=ubd1c4219-f2c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=209&id=u2e3610e3&margin=%5Bobject%20Object%5D&name=image.png&originHeight=418&originWidth=1070&originalType=binary&ratio=1&rotation=0&showTitle=false&size=55822&status=done&style=none&taskId=u5d495362-e37e-4f3b-9a85-a65271bee0c&title=&width=535)
**Key:**
In R language, TRUE and True(or true) are not the same.TRUE and FALSE are the logical constants. | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664890769171-aae5c263-3007-4474-872c-dae75b049942.png#averageHue=%23dee7db&clientId=ubd1c4219-f2c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=48&id=u04be2846&margin=%5Bobject%20Object%5D&name=image.png&originHeight=164&originWidth=1142&originalType=binary&ratio=1&rotation=0&showTitle=false&size=62363&status=done&style=none&taskId=u9a6d6683-82cf-483a-acd6-eb0f8bce305&title=&width=335) |
| **Lines and Indents**
**（行与缩进）** | if(){}
the "()" and "{}" is required | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664891960656-8f669690-bd7b-4bf3-90b4-cf812a67b26f.png#averageHue=%23f0f4e8&clientId=ubd1c4219-f2c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=124&id=uc05ab272&margin=%5Bobject%20Object%5D&name=image.png&originHeight=248&originWidth=1110&originalType=binary&ratio=1&rotation=0&showTitle=false&size=71224&status=done&style=none&taskId=ub72ab570-101f-432e-8354-75798fca9ca&title=&width=555) |
| **Multiple lines（多行语句）** |  | the usage of "\\"
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664892105361-02580ccb-3225-45a1-b46b-2e2114403a94.png#averageHue=%23ecedea&clientId=ubd1c4219-f2c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=79&id=u2d15274a&margin=%5Bobject%20Object%5D&name=image.png&originHeight=158&originWidth=394&originalType=binary&ratio=1&rotation=0&showTitle=false&size=28298&status=done&style=none&taskId=ub3471007-301a-4c1a-a39e-742259d45ed&title=&width=197) |
| **Waiting for the input(输入)** |  | ![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664892358824-a3709b2f-f106-4cf3-8d31-f8939eca0449.png#averageHue=%23f3f2f1&clientId=ubd1c4219-f2c0-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=103&id=ub5b2ad9d&margin=%5Bobject%20Object%5D&name=image.png&originHeight=206&originWidth=1080&originalType=binary&ratio=1&rotation=0&showTitle=false&size=37097&status=done&style=none&taskId=u26c1f40d-a596-4f4d-bdb1-9759a9e2a00&title=&width=540) |
| **Import（导入包）** |  | import/from...import |
| **Variables and constants** | **Variables:**
1. Idnetifiers can be a combination of letters, digits, period(.) and underscore(_)
2. It must start with a letter or a period. If it starts with a period, it cannot be followed by a digit.
3. Reserved words in R cannot be used as identifiers.

---

**Constants:**
- **numeric constants: **all numbers
   - integer(5L)
   - double(5)
   - complex(5i)
- **character constants: **can be represented using either single quotes(') or double quotes(") as delimiters
- **Build-in constants: **LETTERS;letters;pi;month.name
 | **Variables:**
---

**Numbers:**
- **int**
- **bool**
- **float**
- **complex**

---

**String** |

## Mind Map
![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1664912654160-5e3cc267-2b16-4ce0-80cb-6afc839de759.jpeg)

## Tutorial
### Operaters
### R language
:::info

- Arithmetic operaters
- Relational operators
- Logical operators
- Assignment operators（赋值运算符）
:::
**Arithmetic KEY：**

- Modulus（除余）：%%
- Integer Division（整除）：%/%
- Division（除）：/
- Exponent（幂/指数）：^
- 待操作Matrix multiplication（矩阵乘法）：%*%
- 待操作Outer product（矩阵外积）：%o%
- 待操作Kronecker product（克里罗克乘积）：%x%
- 待操作Matching operator（匹配运算符）：%in%

**Logical KEY：**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664908796384-1dcc6972-d87c-4d72-94c9-738193e24693.png#averageHue=%23fdfdfc&clientId=u48b4fd66-d852-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=283&id=u1e5af4ff&margin=%5Bobject%20Object%5D&name=image.png&originHeight=566&originWidth=1036&originalType=binary&ratio=1&rotation=0&showTitle=false&size=162340&status=done&style=none&taskId=u312b689a-4f56-4374-8bf7-bc103b93ee5&title=&width=518)

- & and | perform element-wise operation producing result having length of the longer operand(操作符)
- && and || examines only the first element of the operands resulting into a single length logical vector.(只对第一个元素进行操作)
```r
> x <- c(TRUE,FALSE,0,6)
> y <- c(FALSE,TRUE,FALSE,TRUE)
> !x
[1] FALSE  TRUE  TRUE FALSE
> x&y
[1] FALSE FALSE FALSE  TRUE
> x&&y
[1] FALSE
> x|y
[1]  TRUE  TRUE FALSE  TRUE
> x||y
[1] TRUE
```
### Python language
:::info

- **Arithemetic operaters**
- **Relational operators**
- **Logical operators**
- **Assignment operators**
- Bit operaters
- Member operators
- Identity opertors
:::
**Arithemetic KEY:**

- Division：/
- Integer Division://
- Modulus:%
- Exponent:**

**Logical KEY:**

- and: x and y
- or: x or y
- not: not c

**Bit KEY:**
![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664911215980-ad023dbf-cdef-4de3-ab46-dd0d2bfd7b01.png#averageHue=%23ebe8e3&clientId=u48b4fd66-d852-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=427&id=u596230e8&margin=%5Bobject%20Object%5D&name=image.png&originHeight=854&originWidth=1480&originalType=binary&ratio=1&rotation=0&showTitle=false&size=514416&status=done&style=none&taskId=u497a548e-0025-43e6-ba21-21495cb3537&title=&width=740)
#### DistinguishSpecial example for R language Operation

- **Operation on vectors**

When there is a mismatch in length (number of elements) of operand vectors, the elements in shorter one is recycled in a cyclic manner to match the length of the longer one.
R will issue a warning if the length of the longer vector is not an integral multiple of the shorter vector.
```r
x<-c(2,1,8,3)
y<-c(9,4)
x+y
[1] 11 5 17 7
x-1
[1] 1 0 7 2
x+c(1,2,3)
[1] 3  3 11  4
Warning message:
In x + c(1, 2, 3) :
longer object length is not a multiple of shorter object length
```
### Flow Control
### R Language
:::info

- if...else statement
- ifelse function
- for loop
- While loop
- break and next
- repeat
:::
### Python Language
:::info

- if...else
- for loop
- while loop
- break and continue
- 特殊**迭代器和生成器**
:::
The usage of **next** in R language is same as the usage of **continue** in Python language.
### Functions
### R language

- **Syntax for Writing Functions in R**
```r
func_name<-function(argument){
  statement
}

pow<-function(x,y){
  result<-x^y
  print(paste(x,"raised to the power",y,"is",result))
}
pow(8,2)

## [1] "8 raised to the power 2 is 64"
```

- **Named arguments（命名参数）**
   - the order of the actual arguments doesn't matter.
```r
pow(x=8,y=2)
## [1] "8 raised to the power 2 is 64"
pow(y=2,x=8)
## [1] "8 raised to the power 2 is 64"
```

- **Accessing global variables（访问全局变量）**
   - **the usage of  **<<-
```r
outer_func<-function(){
inner_func<-function(){
a<<-30
print(a)
}
inner_func()
print(a)
}
outer_func()

## [1] 30
## [1] 30

print(a)
## [1] 30
```

- 特殊**R Infix Operator**
   - Note:the back tick ('), this is important as the function name contains special symbols
   - examples:
```r
> 5+3
[1] 8
> `+`(5,3)
[1] 8
'%divisible%'<-function(x,y){
  if(x%%y==0) return(TRUE)
  else return (FALSE)
}
10%divisible%3
## [1] FALSE
```

- 特殊**R Switch Function**
   - The _switch() __ _function in R tests an expression against elements of a list. If the value evaluated from the expression matches item from the list.The corresponding value is returned.
```r
switch(expression,list)
```
```r
switch(2,"red","green","blue")
[1] "green"
```
### Python language

- **Syntax for Writing Functions in Python**

![image.png](https://cdn.nlark.com/yuque/0/2022/png/25489537/1664966698878-c5564017-01ad-4eed-bea9-498b2111bbf0.png#averageHue=%23f5f5f4&clientId=ua7900baf-ce86-4&crop=0&crop=0&crop=1&crop=1&from=paste&height=363&id=uc46c9076&margin=%5Bobject%20Object%5D&name=image.png&originHeight=726&originWidth=1294&originalType=binary&ratio=1&rotation=0&showTitle=false&size=379602&status=done&style=none&taskId=u0d5ab1d5-a358-4d0b-88b8-7440f37d563&title=&width=647)

- **Named arguments（关键字参数）**
   - **same as R language**
- **不定长参数：**
   - 适用于：需要一个函数能处理比当初声明时更多的参数，这些参数叫不定长参数。
   - **Note:**利用*号，加了*的参数会以元组（tuple）的形式导入，存放所有未命名的变量参数
```python
def printinfo(arg1,*vartuple):
    print("输出：")
    print(arg1)
    print(vartuple)

printinfo(70,60,50)
```
:::info
输出：
70
(60,50)
:::

   - 加两个**号：参数会以字典的形式导入
### ImportantData Structures/Data Type
### R language
:::warning

- Vector
- Matrix
- List
- Data frame
- Factor
:::
![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1665084163306-5d0f7aad-5aaa-4c18-8a31-989c01111f95.jpeg)
### Python language
:::warning

- Number
- String
- List
- Tuple
- Dictionary
- Set
:::
![](https://cdn.nlark.com/yuque/0/2022/jpeg/25489537/1665001062272-38e4175c-2125-4f18-8556-cb354632ac79.jpeg)

### Object and Class

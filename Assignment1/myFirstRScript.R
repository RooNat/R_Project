# Title: 
# Author: yujiewang
# Email: YujieWang725@outlook.com
# Time: 2022/9/30-15:03

animals<-c("Snake","Bird","Dog","Spider")
animals
num_legs<-c(0,2,4,8)
num_legs
animals_df<-data.frame(animals,num_legs)
animals_df
ls() #returns a vector of character strings giving the names of the objects in the environment.
#返回环境内的所有变量
rm(num_legs)
rm(list=ls())


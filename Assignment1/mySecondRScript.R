# Title: 
# Author: yujiewang
# Email: YujieWang725@outlook.com
# Time: 2022/9/30-18:06

#Within your script create a short function called myFirstRFunc which takes in a single
#numerical argument n and outputs the sum of all those numbers strictly below n which are
#divisible by either 2 or 7 or both.
#For example, if n = 14 then it should be the sum of 2, 4, 6, 7, 8, 10, 12, so myFirstRFunc
#applied to 14 gives the answer 2 + 4 + 6 + 7 + 8 + 10 + 12 = 49.
#Make sure your function includes useful comments. You may want to include a check so that
#your function produces an error if it is given an argument which isn’t a non-negative integer.


myFirstRFunc<-function(n){
  sum<-0
  for(i in 1:(n-1)){
    if(i%%2==0 | i%%7==0){
      sum<-sum+i
    }
  }
  return(sum)
}

myFirstRFunc(1000)



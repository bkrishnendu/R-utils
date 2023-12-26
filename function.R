
my_func<- function(input){
  output<-do_somethig(input)
  return(output)
}


##Create a function to calculate volume

cal_vol<- function(length, width, height){
  area<-length*width
  volume<-area*height
  return(volume)
}

cal_mass<- function(volume){
  mass<-2.65*volume^0.9
  return(mass)
}

##Calling function inside of function
est_mass_dim<- function(length, width, height){
  volume<- cal_vol(length, width, height)
  mass <- cal_mass(volume)
  return(mass)
}


cal_vol(2,3,4)
cal_mass(2)
est_mass_dim(2,3,4)

## Some exercise with if else
my_func<- function(x,y, method="foo"){
  a<- x+y
  
  if (method=="foo"){
    
    b= 1/sqrt(a)
    return(b)
    
  } else if (method == "bar"){
    "this is a string"
  }
}

my_func(10,11)
my_func(10, 11, "bar")
my_func(10, 11, "spam")


##Safe guarding function
my_func<- function(x,y, method="foo"){
  if(!(method %in% c("foo", "bar"))){
    return("Method must be either 'foo' or 'bar'")
  }
  
  a<- x+y
  
  if (method=="foo"){
    
    b= 1/sqrt(a)
    return(b)
    
  } else if (method == "bar"){
    "this is a string"
  }
}

my_func(10,11)
my_func(10, 11, "bar")
my_func(10, 11, "spam")

## Calculate function to calculate mean and standard deviation

func_mean_sd<-function(x){
  if(any(is.na(x))){
    return(NA)
  } else {
    result <- c(mean(x), sd(x))
    return(result)
  }
  
}

func_mean_sd(c(1, 3, 8, 9, 10, 12))

##Functions that take columns of data as arguments

library(dplyr)
data(mtcars)
View(mtcars)

df_function <- function(df, col){
  if(any(is.na(df[,col]))){
    return("The data contains NA")
  } else {
    print("The function is running...")
    #x=mean(df[,col])
    #return(x)
    min<-df[,col]/min(df[,col])
    Zscore<-(df[,col]-mean(df[,col]))/sd(df[,col])
    df1<-cbind.data.frame(min,Zscore)
    #return(min)
    #return(Zscore)
    return(df1)
  }

}

df_function(mtcars, "mpg")

## double the data inside the data frame 
sqr_fun <- function(df) {
  df <- df^2
  return(df)
}

sqr_fun(mtcars)

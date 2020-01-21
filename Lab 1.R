### Exercise 1


library(tidyverse)
library(ggplot2)
data = mpg

## the relationship between displ and hwy
p <- ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy))
p + geom_point()

## the relationship between class and drv
q <- ggplot(
  data = mpg,
  mapping = aes(x = class, y = drv))
q + geom_point()

### conclusion : This is the intuitive relationship we expected. There is a negative relationship between displ and hwy. 
### This means the size of displ being smaller, the hwy is higher.
### There is no relationship between class and drv. 


### Exercise 1b

p <- ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, colour = class))
p + geom_point()

### Conclusion: The displ of 2seater car is about between 5.5 and 7, and the hwy of it is about 22-26.
### The displ of compact is about between 1.5 and 3.5, and the hwy of it is about 22-37. 
### The displ of midsize is about between 1.7 and 5.4, and the hwy of it is about 24-32.
### The displ of minivan is about between 2.4 and 4, and the hwy of it is about 21-24.
### The displ of pickup  is about between 2.7 and 5.9, and the hwy of it is about 10-22.
### The displ of subcompact is about between 0.1 and 5.4, and the hwy of it is about 20-44.
### The displ of suv is about between 2.5 and 6.5, and the hwy of it is about 5-24.


### Exercise 2

## Load data
setwd("~/Desktop/SS20/SSC442/Lab 1")
mydata <- read.csv("bank.csv")
library(tidyverse)
library(ggplot2)

## The first one
summary(mydata)
str(mydata)
First <- ggplot(mydata, aes(factor(y), campaign)) + 
  geom_boxplot(aes(fill = factor(y)))
First

# conclusion: according to the graph, the bank can pay more attention on the amount of campaign which is less than 15 since those people have less choices. 
# the bank can give up the campaign which is more than 35, and make some contact with people when the amount of campaign is between 25 and 15. 


## The second one 
Second <- ggplot(
  data = mydata,
  mapping = aes(x = education, y = job, color = y))
Second + geom_point()

## the relationship between job and education 
## based on the graph, people who are in primary education are 
## more willing to deposit in long-term saving account while 
## there are only a few people in secondary education willing to do so. 
## For students, whether they are in primary or tertiary education, they are willing to deposite in saving account. 
## we suggest that this bank should focus on contacting with student, self-employed and entrepreneur who 
## are in primary education; admin who are in secondary education; student in tertiary education. 
## There are some relations between the job and education as mentioned above. 
## Among those data, we find that unknown is also partial reason which causes consumers do not 
## subscribe the product. In the further running, bank should update the information completely 
## as much as possible in order to prevent the unsubscribe condition. 
## Thus, the bank could get a more precise prediction on the future consumer behaviors.


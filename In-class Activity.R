### Goup 3
###  name: Zewei Li, Lin Wang, Liwei Fang, Qingxuan Zheng
#### 1
library("caret")
library("lattice")
library("ggplot2")
library("ellipse")
library(rpart)

ameslist <- read.table("https://msudataanalytics.github.io/SSC442/Labs/data/ames.csv",
                       header = TRUE,
                       sep = ",")
library(ISLR)
library(tibble)
as_tibble(ameslist)
names(ameslist)


is.factor(ameslist$Fireplaces)


set.seed(42)
ameslist_idx   = sample(nrow(ameslist), 730)
ameslist_trn = ameslist[ameslist_idx, ]
ameslist_tst = ameslist[-ameslist_idx, ]


library(tree)

tree.model <- tree(ameslist_trn$Fireplaces ~ ameslist_trn$GarageArea , data=ameslist_tst)
plot(tree.model)


##### 2
simple_class = function(x, boundary, above = 1, below = 0) {
  ifelse(x > boundary, above, below)
}

ameslist_no = simple_class(ameslist_tst$Fireplaces,
                           boundary = 730, above = "yes", below = "No")

head(ameslist_tab, n = 10)
ameslist_tab = table(predicted = ameslist_no, actual = ameslist_trn$Fireplaces)

confusionMatrix(ameslist_tab, positive = "Yes")

calc_class_err = function(actual, predicted) {
  mean(actual != predicted)
}
table(default_tst$default) / length(default_tst$default)










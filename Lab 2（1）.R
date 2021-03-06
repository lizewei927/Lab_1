## 1.1
ameslist <- read.table("https://msudataanalytics.github.io/SSC442/Labs/data/ames.csv",
                       header = TRUE,
                       sep = ",")
names(ameslist)
Ames <- vector()
Ames1 <- names(ameslist)
for(n in Ames1){
  amesl <- ameslist[n]
  if (is.numeric(amesl[1,n]) == TRUE){
    Ames <- c(Ames, amesl)
  }
}

write.table(Ames, file = "Ames.txt", sep = "\t",
            row.names = FALSE)

## 1.2
library(car)
ameslist_plot <- ameslist[c(2,4:5,18:21,27,35,38:39,81)]
scatterplotMatrix(ameslist_plot)
## From the plot, we see SalePrice seems highly correlated with OverallQual, YearBuilt, YearRemodAdd, MaxVnrArea

## 1.3
Ames_matrix <- matrix(unlist(Ames),1460,45)
cor_value <- cor(Ames_matrix)
cor_value
cor_with_SalePrice <- cor_value[38,]
cor_with_SalePrice
## Based on correlation coeffcient, LotArea is the most correlated with SalePrice, GrLivArea comes the second

## 1.4
x <- ameslist$GrLivArea
y <- ameslist$SalePrice
z <- lm(y ~ x)
plot(x,y)
abline(z)
## scatterplot(x,y)
outliner <- which(ameslist$GrLivArea>4000)
outliner

## 2.1
options(na.action='na.pass')
GarageTemp = model.matrix( ~ ameslist$GarageType - 1, data=ameslist$GarageType)
ameslist <- cbind(ameslist, GarageTemp)
ameslist$GarageOutside <- ifelse(ameslist$'ameslist$GarageTypeDetchd' == 1 | ameslist$'ameslist$GarageTypeCarPort' == 1, 1, 0)

x <- ameslist$GarageOutside
y <- ameslist$SalePrice
not_na_position <- which(!is.na(x))
x <- x[not_na_position]
y <- y[not_na_position]
lm.fit=lm(y ~ x)

## 2.2
names(Ames)
Ames_matrix <- na.exclude(Ames_matrix)
y <- Ames_matrix[,38]
x <- Ames_matrix[,c(1:37,39:45)]
lm.fit=lm(y ~ x)
summary(lm.fit)
## Yes
## x2, x4, x5, x6, x9, x14, x15, x22, x24, x27
## MSSubClass, LotArea, OverallQual, OverallCond, MasVnrArea, X1stFlrSF, X2ndFlrSF, BedroomAbvGr
## TotRmsAbvGrd, GarageCars

## 2.3
plot(lm.fit)
## There are three outliers points in the plot

## 2.4
y <- Ames_matrix[,38]
x1 <- Ames_matrix[,4]
x2 <- Ames_matrix[,17]
lm.fit=lm(y ~ x1 * x2)
summary(lm.fit)
## SalePrice ~ LotArea * GrLivArea, statistically Significant

## 2.5
## x^2
y <- Ames_matrix[,38]
x <- Ames_matrix[,c(1:37,39:45)]
trans_x <- x^2
x <- cbind(x, trans_x)
lm.fit=lm(y ~ x)
summary(lm.fit)

## sqrt(x)
y <- Ames_matrix[,38]
x <- Ames_matrix[,c(1:37,39:45)]
trans_x <- sqrt(x)
x <- cbind(x, trans_x)
lm.fit=lm(y ~ x)
summary(lm.fit)

## ln(x)
## OverallQual as example
y <- Ames_matrix[,38]
x <- Ames_matrix[,5]
trans_x <- log(x)
x <- cbind(x, trans_x)
lm.fit=lm(y ~ x)
summary(lm.fit)


mydata=read.csv("bank.csv")
names(mydata)
typeof(mydata)
#full_mydata_model = lm(balance ~ ., data = mydata)
full_mydata_model = lm(balance ~ age + job + marital + education + default + housing + loan + contact + day + month + duration + campaign + previous + y, data = mydata)
#this function calculates coefficient
full=summary(full_mydata_model)
anova_1 = aov(full_mydata_model,data=mydata)# produce a error of 2934.073
fmm = coef(full)
fmm_signi <- fmm[fmm[,"Pr(>|t|)"]<0.05,]# from here we remove the insignificant parts and only left age,job,marital,defaults,loan and month

#recheck
model_2 = lm(balance ~ age + job + marital + education + default + loan + month , data = mydata)
#only left significant as test
anova2 = aov(model_2,data = mydata)#produce a error of 2932.844
anova2
model_3 = lm(balance ~ job + marital  + education + default+ loan + month , data = mydata)
#remove age as test
anova3= aov(model_3,data=mydata)#produce a erro of 2936.964(since the error increase so we keep it)
anova3
model_4=lm(balance ~ age + marital + default + education + loan + month, data = mydata)
#remove job
anova4=aov(model_4,data = mydata)# error 2934.919
anova4
model_5=lm(balance ~ age + job + education + default + loan + month, data = mydata)
#remove marital
anova5=aov(model_5,data = mydata)#error 2935.928
anova5
model_6=lm(balance ~ age + job + marital + default + loan + month , data = mydata)
# remove education
anova6=aov(model_6,data=mydata) # error 2934.378
anova6
model_7=lm(balance ~ age + job + marital + education + default + loan , data = mydata)
#remove month
anova7=aov(model_7,data=mydata)# error 2970.915
anova7
model_8=lm(balance ~ age + job + marital + education + loan + month , data = mydata)
#remove default
anova8 = aov(model_8,data=mydata)#error 2938.165
anova8 #error 2938.165
model_9= lm(balance ~ age + job + marital + education + default + month , data = mydata)
#remove loan
anova9 = aov(model_9,data=mydata)#error 2936.033
anova9
null_mydata_model = lm(balance ~ age + job + marital + education + default + loan + month , data = mydata)
anova(full_mydata_model,null_mydata_model)
# In this part we use two models to get the final result, the first one we use the full model which includes all the 
#variables and we use Ftest to filter the insignificant variable and keep the rest to recheck the result
# Then what we get finally named null model that is our final modle, since compare with the full one this get lower error.
#v1=var.test(balance~y, data = mydata)
#v1
#v2=var.test(balance~default, data = mydata)
#v2


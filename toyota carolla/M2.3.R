
attach(tc_replace)
data5 <- tc_replace
sapply(data5,mean,na.rm = TRUE)
summary(data5)

#One sample t-test
t.test(HP,mu=95)

#Two sample t-test
t.test(HP,Price,var.equal = TRUE,paired = FALSE)

#2 sample variance test
var.test(HP,Price,alternative = "two.sided")


#ANOVA
fit <- aov(HP~Price, data=data5)
plot(fit)

 #1,2 Proportion Test

mat.cases = length(which(Automatic == 1 & Met_Color == 1))
nmat.cases = length(which(Automatic == 1 & Met_Color == 0))
col.cases = c(mat.cases, nmat.cases)
mat.total = length(which(Met_Color==1))
nmat.total = length(which(Met_Color==0))
col.total= c(mat.total, nmat.total)

prop.test(col.cases, col.total, alternative =  "greater")
#------------------------------------------------------------------------------------------

table1= table(tc_replace$Fuel_Type,tc_replace$Mfr_Guarantee)
table1
prop.test(table1,correct = FALSE)
prop.test(x=c(2,10),n=c(2+50,10+30),correct = FALSE)

#Chisquare test
tbl = table(tc_replace$cc, tc_replace$Met_Color) 
tbl
chisq.test(tbl)

# k fold cross validation(10)
tc_replace<-tc_replace[sample(nrow(tc_replace)),]
#Create 10 equally size folds
folds <- cut(seq(1,nrow(tc_replace)),breaks=10,labels=FALSE)
#Perform 10 fold cross validation
for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- tc_replace[testIndexes, ]
  trainData <- tc_replace[-testIndexes, ]
}
head(testData)
head(trainData)




#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Linear model
lm(formula = Weight~cc)

#R square
tc_replace.lm = lm(Weight ~ cc, data=tc_replace)
summary(tc_replace.lm)$r.squared

#R square
tc_replace.lm = lm(HP ~ Weight, data=tc_replace)
summary(tc_replace.lm)$r.squared

# the target multiple regression model
res <- lm(Price ~ cc+Weight+HP, data=tc_replace)
summary(res)

#Logistic Regression
tc_replace$BOVAG_Guarantee <- factor(tc_replace$BOVAG_Guarantee)
mylogit <- glm(BOVAG_Guarantee ~ cc + HP + Price, data = tc_replace, family = "binomial")
summary(mylogit)

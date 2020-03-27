attach(sc_replace)
data7 <- sc_replace
sapply(data7,mean,na.rm = TRUE)
summary(data7)

#One sample t-test
t.test(APM,mu=114.33)

#Two sample t-test
t.test(APM,AssignToHotkeys,var.equal = TRUE,paired = FALSE)

#f-test
var.test(APM,ComplexAbilitiesUsed)


#ANOVA
fit <- aov(APM~TotalHours, data=data7)
plot(fit)

#Chisquare test
tbl3 = table(sc_replace$UniqueHotkeys, sc_replace$UniqueUnitsMade) 
tbl3
chisq.test(tbl3)

# k fold cross validation(10)
sc_replace<-sc_replace[sample(nrow(sc_replace)),]
#Create 10 equally size folds
folds <- cut(seq(1,nrow(sc_replace)),breaks=10,labels=FALSE)
#Perform 10 fold cross validation
for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- sc_replace[testIndexes, ]
  trainData <- sc_replace[-testIndexes, ]
}
head(testData)
head(trainData)

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Linear model
lm(formula = APM~WorkersMade)

#R square
sc_replace.lm = lm(APM ~ WorkersMade, data=sc_replace)
summary(sc_replace.lm)$r.squared

#R square
sc_replace.lm = lm(APM ~ SelectByHotkeys, data=sc_replace)
summary(sc_replace.lm)$r.squared

# the target multiple regression model
res1 <- lm(APM ~ SelectByHotkeys+AssignToHotkeys+ActionLatency, data=sc_replace)
summary(res1)


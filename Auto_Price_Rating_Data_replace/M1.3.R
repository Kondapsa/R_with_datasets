attach(Auto_Price_Rating_Data_replace)
data4 <- Auto_Price_Rating_Data_replace
sapply(data4,mean,na.rm = TRUE)
summary(data4)

#One sample t-test
t.test(Horsepower,mu=105)

#Two sample t-test
t.test(Horsepower,Price,var.equal = TRUE,paired = FALSE)

#2 sample variance test
var.test(Horsepower,Price)


#ANOVA
fit <- aov(Horsepower~Price, data=data4)
plot(fit)

#1,2 Proportion Test
table1= table(Auto_Price_Rating_Data_replace$Fuel.Type,Auto_Price_Rating_Data_replace$Emission.Standards)
table1
prop.test(table1,correct = FALSE)
prop.test(x=c(2,10),n=c(2+50,10+30),correct = FALSE)

mat.cases = length(which(Performance..Rating == 'High' & Emission.Standards == 'Meeting'))
nmat.cases = length(which(Performance..Rating == 'High' & Emission.Standards == 'Not Meeting'))
col.cases = c(mat.cases, nmat.cases)
mat.total = length(which(Emission.Standards == 'Meeting'))
nmat.total = length(which(Emission.Standards == 'Not Meeting'))
col.total= c(mat.total, nmat.total)

prop.test(col.cases, col.total, alternative =  "greater")

#Chisquare test
tbl1 = table(Auto_Price_Rating_Data_replace$Stroke, Auto_Price_Rating_Data_replace$Performance..Rating) 
tbl1
chisq.test(tbl1)
 
# k fold cross validation(10)
Auto_Price_Rating_Data_replace<-Auto_Price_Rating_Data_replace[sample(nrow(Auto_Price_Rating_Data_replace)),]
#Create 10 equally size folds
folds <- cut(seq(1,nrow(Auto_Price_Rating_Data_replace)),breaks=10,labels=FALSE)
#Perform 10 fold cross validation
for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- Auto_Price_Rating_Data_replace[testIndexes, ]
  trainData <- Auto_Price_Rating_Data_replace[-testIndexes, ]
}
head(testData)
head(trainData)
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Linear model
lm(formula = Wheel.base~Length)

#R square
Auto_Price_Rating_Data_replace.lm = lm(Price ~ Curb.weight, data=Auto_Price_Rating_Data_replace)
summary(Auto_Price_Rating_Data_replace.lm)$r.squared

#R square
Auto_Price_Rating_Data_replace.lm = lm(Horsepower ~ Curb.weight, data=Auto_Price_Rating_Data_replace)
summary(Auto_Price_Rating_Data_replace.lm)$r.squared

# the target multiple regression model
res <- lm(Price ~ Curb.weight+Stroke+Horsepower, data=Auto_Price_Rating_Data_replace)
summary(res)

#Logistic Regression
Auto_Price_Rating_Data_replace$Emission.Standards <- factor(Auto_Price_Rating_Data_replace$Emission.Standards)
mylogit <- glm(Emission.Standards ~ Horsepower + Curb.weight + Stroke + Bore , data = Auto_Price_Rating_Data_replace, family = "binomial")
summary(mylogit)

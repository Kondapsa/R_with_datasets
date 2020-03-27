attach(titanic)
#Logistic Regression

#Finding Aic value with each variable
glm(survived ~ sex, data = titanic, family = "binomial")
glm(survived ~ age, data = titanic, family = "binomial")
glm(survived ~ sibsp, data = titanic, family = "binomial")
glm(survived ~ sex, data = titanic, family = "binomial")
glm(survived ~ parch, data = titanic, family = "binomial")
glm(survived ~ fare, data = titanic, family = "binomial")

#Comparing AIC value and elimination variable with highest AIC value
glm(survived ~ sex +fare+ parch , data = titanic, family = "binomial")

#Trying different combinations for low AIC value
glm(survived ~ sex +fare , data = titanic, family = "binomial")
glm(survived ~ sex + parch , data = titanic, family = "binomial")
glm(survived ~ fare+ parch , data = titanic, family = "binomial")
#Therefore seeing the results fare+parch is not suitable
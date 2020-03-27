
View(tc_replace)
attach(tc_replace)

#Boxplot
boxplot(Price~`cc`,xlab="cc",ylab="price")
boxplot(Price ~ `Gears`,col=(c("gold","darkgreen")))


#barplot
count <- tc_replace$`Weight`
barplot(count,xlab = "Weight")

#Histogram
hist(HP)
hist(Price)

#Piechart
x <- c(`Fuel_Type`)
labels <- c(`cc`)
pie(x,labels)



#Scatter plot
scatter.smooth(Weight,Price,xlab = "Weight",ylab = "Price")

# pair-wise scatterplots colored by class
pairs(cc~HP, data=tc_replace, col=tc_replace$cc)

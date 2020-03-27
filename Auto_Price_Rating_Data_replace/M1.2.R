
View(Auto_Price_Rating_Data_replace)
attach(Auto_Price_Rating_Data_replace)

#Boxplot
boxplot(Price~`Num.of.doors`,xlab="number of doors",ylab="price")
boxplot(Price ~ `Num.of.cylinders`,col=(c("gold","darkgreen")))


#barplot
count <- Auto_Price_Rating_Data_replace$`Length`
barplot(count,xlab = "Length")

#Histogram
hist(Horsepower)
hist(Price)

#Piechart
x <- c(`Wheel.base`)
labels <- c(`Fuel.Type`)
pie(x,labels)



#Scatter plot
scatter.smooth(Curb.weight,Price,xlab = "Curb-Weight",ylab = "Price")

# pair-wise scatterplots colored by class
pairs(Curb.weight~Horsepower, data=Auto_Price_Rating_Data_replace, col=Auto_Price_Rating_Data_replace$Curb.weight)

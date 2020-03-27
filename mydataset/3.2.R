
View(sc_replace)
attach(sc_replace)

#Boxplot
boxplot(APM~ UniqueHotkeys,xlab="UniqueHotkeys",ylab="APM")
boxplot(APM ~ LeagueIndex,col=(c("gold","darkgreen")))


#barplot
count1 <- sc_replace$MinimapAttacks
barplot(count1,xlab = "MinimapAttacks")

#Histogram
hist(NumberOfPACs)
hist(APM)

#Piechart
x <- c(HoursPerWeek)
labels <- c(GameID)
pie(x,labels)



#Scatter plot
scatter.smooth(APM,ComplexAbilitiesUsed,xlab = "APM",ylab = "ComplexAbilitiesUsed")

# pair-wise scatterplots colored by class
pairs(APM~ComplexAbilitiesUsed, data=sc_replace, col=sc_replace$APM)

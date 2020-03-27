
Auto_Price_Rating_Data <- read.csv(file.choose(), header = TRUE)
attach(Auto_Price_Rating_Data)
summary(Auto_Price_Rating_Data)
bore_Na<-which(is.na(Auto_Price_Rating_Data$Bore))
Auto_Price_Rating_Data_no_NA<-Auto_Price_Rating_Data[-c(bore_Na),]

#replacing the missing values of Bore with Mean of that Column
Auto_Price_Rating_Data_replace <- Auto_Price_Rating_Data
Auto_Price_Rating_Data_replace$Bore[bore_Na] <- mean(Auto_Price_Rating_Data$Bore,na.rm = TRUE)

#replacing the missing values of Stroke with Median of that Column
Stroke_NA <- which(is.na(Auto_Price_Rating_Data$Stroke))
Auto_Price_Rating_Data_replace$Stroke[Stroke_NA] <- median(Auto_Price_Rating_Data$Stroke,na.rm = TRUE)

#replacing the missing values of Horsepower with Mean of that Column
Horsepower_NA <- which(is.na(Auto_Price_Rating_Data$Horsepower))
Auto_Price_Rating_Data_replace$Horsepower[Horsepower_NA] <- mean(Auto_Price_Rating_Data$Horsepower,na.rm = TRUE)

#replacing the missing values of Peak-rpm with Median of that Column
Peak_NA <- which(is.na(Auto_Price_Rating_Data$`Peak-rpm`))
Auto_Price_Rating_Data_replace$`Peak-rpm`[Peak_NA] <- median(Auto_Price_Rating_Data$`Peak-rpm`,na.rm = TRUE)

#replacing the missing values of Price with Mean of that Column
Price_NA <- which(is.na(Auto_Price_Rating_Data$Price))
Auto_Price_Rating_Data_replace$Price[Price_NA] <- mean(Auto_Price_Rating_Data$Price,na.rm = TRUE)


View(Auto_Price_Rating_Data_replace)

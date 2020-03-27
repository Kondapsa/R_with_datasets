
tc <- read.csv(file.choose(), header = TRUE)
attach(tc)
summary(tc)
Price_Na<-which(is.na(tc$Price))
tc_no_NA<-tc[-c(Price_Na),]

#replacing the missing values of Price with Mean of that Column
tc_replace <- tc
tc_replace$Price[Price_Na] <- mean(tc$Price,na.rm = TRUE)

#replacing the missing values of KM with Median of that Column
KM_NA <- which(is.na(tc$KM))
tc_replace$KM[KM_NA] <- median(tc$KM,na.rm = TRUE)

#replacing the missing values of Horsepower with Mean of that Column
HP_NA <- which(is.na(tc$HP))
tc_replace$HP[HP_NA] <- mean(tc$HP,na.rm = TRUE)

#replacing the missing values of Weight with Median of that Column
Weight_NA <- which(is.na(tc$`Weight`))
tc_replace$`Weight`[Weight_NA] <- median(tc$`Weight`,na.rm = TRUE)




View(tc_replace)

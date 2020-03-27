
sc <- read.csv(file.choose(), header = TRUE)
attach(sc)
summary(sc)
APM_Na<-which(is.na(sc$APM))
sc_no_NA<-sc[-c(APM_Na),]

#replacing the missing values of APM with Mean of that Column
sc_replace <- sc
sc_replace$APM[APM_Na] <- mean(sc$APM,na.rm = TRUE)

#replacing the missing values of GapBetweenPACs with Median of that Column
GapBetweenPACs_NA <- which(is.na(sc$GapBetweenPACs))
sc_replace$GapBetweenPACs[GapBetweenPACs_NA] <- median(sc$GapBetweenPACs,na.rm = TRUE)

#replacing the missing values of WorkersMade with Mean of that Column
WorkersMade_NA <- which(is.na(sc$WorkersMade))
sc_replace$WorkersMade[WorkersMade_NA] <- mean(sc$WorkersMade,na.rm = TRUE)

#replacing the missing values of UniqueHotkeys with Median of that Column
UniqueHotkeys_NA <- which(is.na(sc$`UniqueHotkeys`))
sc_replace$`UniqueHotkeys`[UniqueHotkeys_NA] <- median(sc$`UniqueHotkeys`,na.rm = TRUE)




View(sc_replace)

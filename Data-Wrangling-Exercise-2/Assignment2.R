setwd("C:/Users/saraa/Desktop")
mydata2 <- read.csv("titanic_original.csv") #0: Load the data in RStudio
mydata2$embarked <- ifelse(mydata2$embarked == "", 'S', mydata2$embarked) #1: Embarked
mydata2$age <- ifelse(is.na(mydata2$age),mean(mydata2$age, na.rm=TRUE),mydata2$age) #2A: Calculate mean age and use value to populate missing columns.
#2B: Calculating the mean age overall might be misleading because males and females have different life expectancies. A better way to calculate the predicted ages would be to calculate the mean of the males and females separately.
#Another way is to take the median age, because the age data could be skewed due to a greater proportion of young or elderly people.
mydata2$boat <- ifelse(mydata2$boat == "", 'NA', mydata2$boat) #3: Lifeboat
mydata2$has_cabin_num <- ifelse(mydata2$cabin == '',0,1) #4: Cabin
#A lot of cabin data is missing, so it is not possible to predict cabin numbers with the data available. Tickets might have been entered wrong, the survivors might not have remembered their cabins, or the tickets might have been lost in the water.
write.csv(mydata2, "titanic_clean.csv")
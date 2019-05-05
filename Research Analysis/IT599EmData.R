## Load the Inpatient data set

## my_dataOut= read.delim("/Users/chiranjibighimire/Desktop/Spring\ 2019_Courses/IT\ 599/Research\ Project/Assignment\ Files/Outpatient\ Data.TXT", na.strings=c(""," ", "NA"), sep = ",")
#mydata_Inpat= read.delim("/Users/chiranjibighimire/Desktop/Spring\ 2019_Courses/IT\ 599/Research\ Project/Assignment\ Files/Inpatient\ Data.TXT", na.strings=c("", " ", "NA"), sep = ",")

mydata_Inpat=read.csv("/Users/chiranjibighimire/Desktop/Spring\ 2019_Courses/IT\ 599/Research\ Project/Assignment\ Files/Inpatient\ Data.csv")


## For Inpatient data #######

#Check the dimension of the data
dim(mydata_Inpat)
summary(mydata_Inpat)
head(mydata_Inpat, n=10)

##Select subset of attributes which are more interesting for the research purpose

newdata_Inpat <- mydata_Inpat[c(1,2,4,6,8,9,10,30,54,55,56,61,76,77)]
head(newdata_Inpat, n=10)
dim(newdata_Inpat)
View(newdata_Inpat)
str(newdata_Inpat)


## There was lots of empty cells and I replaced them by NA using Excel
# I tried to replace all NAs with 0, but I couldn't do that. I replaced all the empty cells by NA using Excel, but when I load the data set in the R,
#it shows <NA> instead of NA. I tried to remove <>, but I couldn't able to do that. I decided to delete all rows with NAs.It redued the rows from 53686 to 23960. 


#############################################################################################################
#newdata_Inpat[is.na(newdata_Inpat)] = 0
#newdata_Inpat$PX1 [is.na(newdata_Inpat$PX1)] = 0
#sapply(newdata_Inpat, class)
## Check if there are any missing values NAs in the data set and I already replace blank space with NAs
#sum(is.na(newdata_Inpat))
# newdata_Inpat[is.na(newdata_Inpat)] = 0
#############################################################################################################


cleaned_data<- na.omit(newdata_Inpat)
dim(cleaned_data)

View(cleaned_data)
head(cleaned_data, n=10)
str(cleaned_data)

################## Now, I got cleaned data (no missing values and no NAs)#################################
##sapply(cleaned_data, class)


### I am doing some descriptive analysis to visualized the summary of the data 


####Research Questions

#1. What is the highest or lowest cost DRG (Diagnostic Related Group)?
#2. What procedure is performed the most (inpatient or outpatient)?
# 3. What procedures are performed by patient age group?
# 4. What is the average hospital stay in days for inpatients?
# 5. What is the most common primary diagnosis? 
# 6. What is the main payment source for the people to pay the medical expenses?
# 7. Which diagnosis is most common for age group on primary level? 
# 8. What is the most common diagnostic in primary level?


# Plot the histogram and barplot using ggplot package
installed.packages("ggplot2")
library("ggplot2")
installed.packages('plyr')
library(plyr)
library(grid)
library(gridExtra)



##1. What is the highest or lowest cost DRG (Diagnostic Related Group)?

# Barplot of DRG and Charges attributes to get the idea of their relationship. 

plot1= ggplot(cleaned_data, aes(x =cleaned_data$DRG, y = cleaned_data$CHRGS))+ geom_bar(aes(fill = cleaned_data$CHRGS), stat = "identity" , color = "black", position = position_dodge(0.9))

plot1 + ggtitle("Plot of Charges by Diagnosis Related Group (DRG)") + xlab("DRG") + ylab("Charges Amount (dollar)")

# Maximum and Minimum charges (cost)
max(cleaned_data$CHRGS, na.rm=TRUE)
min(cleaned_data$CHRGS, na.rm = TRUE)

# Highest and Lowest cost DRG 
cleaned_data[which.max(cleaned_data[,6]),13]
cleaned_data[which.min(cleaned_data[,6]),13]

# The DRG 790 is the most expensive and 795 is the least expensive DRG.

##2. What procedure is performed the most (inpatient or outpatient)?

barplot(prop.table(table(cleaned_data$PX1)))


#Display the most frequent procedure (PX1)
sort(table(cleaned_data$PX1),decreasing=TRUE)[1]

# The primary procedure (PX1) code 10E0XZZ performed the most with frequency of 3255. 
#Which means the Delivery of Products of Conception procedure is performed most.



####################################################################
## 3. What procedures are performed by patient age group?

ggplot(cleaned_data, aes(x =cleaned_data$PX1, y = cleaned_data$intage))+ geom_bar(aes(fill = cleaned_data$CHRGS), stat = "identity" , color = "black", position = position_dodge(0.9))

ggplot(cleaned_data) + geom_point(aes(x = PX1, y = intage))
barplot(table(cleaned_data$intage),col="red",ylab="No. of Count",las=2,main="age",cex.names = 0.8,cex.axis = 0.8)



##ggplot

library(ggplot2)



ggplot(data = cleaned_data, mapping = aes(x = DRG, y = CHRGS)) + geom_point(alpha = 0.1, aes(color = intage))  +
  ggtitle("DRG Vs Charges (Cost) Plot Based on Age")


p1=ggplot(data = cleaned_data, mapping = aes(x = DRG, y = CHRGS)) + geom_point(alpha = 0.1, aes(color = intage))  +
  ggtitle("DRG Vs Charges Plot Based on Age")



p2=ggplot(data = cleaned_data, mapping = aes(x = DRG, y = CHRGS)) + geom_point(alpha = 0.1, aes(color = sex))  +
  ggtitle("DRG Vs Charges Plot Based on Sex")


p3=ggplot(data = cleaned_data, mapping = aes(x = DRG, y = pdays)) + geom_point(alpha = 0.1, aes(color = intage))  +
  ggtitle("DRG Vs pdays Plot Based on Age")

p4=ggplot(data = cleaned_data, mapping = aes(x = DRG, y = pdays)) + geom_point(alpha = 0.1, aes(color = sex))  +
  ggtitle("DRG Vs pdays Plot Based on Sex")


library(gridExtra)
grid.arrange(p1, p2,p3,p4, ncol = 2, top = "Main title")

## Which DRG patient stay most and least days in hospital. 
max(cleaned_data$pdays, na.rm=TRUE)
min(cleaned_data$pdays, na.rm = TRUE)

cleaned_data[which.max(cleaned_data[,9]),13]
cleaned_data[which.min(cleaned_data[,9]),13]

# The DRG Aftercare with CC/MCC (949) patient discharge after 441 days of admission: which represents a patient that requires more resources; therefore, hospitals are paid more to care. 
# The DRG 775 patient discharged on date of admission or on day after admission. 
#####################################################################



hist(cleaned_data$intage)
hist(cleaned_data$PX1)
hist(cleaned_data$CHRGS)
hist(cleaned_data$DX1)


barplot(table(cleaned_data$DRG),col="red",ylab="Counts",las=2,main="DRG",cex.names = 0.8,cex.axis = 0.8)



#### Important Plots
barplot(table(cleaned_data$intage),col="red",ylab="Counts",las=2,main="Age Group of Inpatient",cex.names = 0.8,cex.axis = 0.8)

barplot(table(cleaned_data$sex),col="red",ylab="Counts",las=2,main=" Sex of Inpatient",cex.names = 0.8,cex.axis = 0.8)+ geom_point(alpha = 0.1, aes(color = sex))


#ggplot(cleaned_data, aes(x=sex, y=DRG, fill=sex)) + geom_bar(stat="identity")+theme_minimal()


#grid.arrange(b1,b2,ncol = 2, top = "Visualization of the Inpatient Data")




ggplot(cleaned_data) + geom_point(aes(x = DRG, y = intage))

# 4. What is the average hospital stay in days for inpatients?

mean(cleaned_data$pdays)
result.mean <- mean(cleaned_data$pdays)
print(result.mean)


## 5. What is the Most frequent OR most common primary diagnosis? 

sort(table(cleaned_data$DX1),decreasing=TRUE)[1]

sort(table(cleaned_data$DX1),decreasing=FALSE)[1]
# The most frequent primary diagnostic is DX1=Z3800 with frequency of 1237. 
# Z3800--Single liveborn infant, delivered vaginally. The product of a livebirth; an infant who shows evidence of life after birth; 
# life is considered to be present after birth if any one of the following is observed: 1) the infant breathes; 2) the infant shows beating of the heart;
# 3) pulsation of the umbilical cord occurs; or 4) definite movement of voluntary muscles occurs.

table(cleaned_data$DX1)
plot(cleaned_data$DX1)


##6. What is the principal payment source to pay the medical expenses?

#Histogram of principal payment source
ggplot(cleaned_data) + geom_histogram(aes(x = PPAY))

sort(table(cleaned_data$PPAY),decreasing=TRUE)[1]

#The most common principal payment source is 1 with highest frequency of 8395.

####Decision Tree######
library(rpart.plot)
library(rpart)


set.seed(1234)
TrainingDataIndex= sample(2,nrow(cleaned_data), replace=TRUE, prob =c(0.8,0.2))
train_1 = cleaned_data[TrainingDataIndex==1,]
validate= cleaned_data[TrainingDataIndex==2,]
nrow(train_1)
nrow(validate)


# Decision Tree with rpart (DX1 as a response variable)
library(rpart.plot)
library(rpart)
tree1 =rpart(DX1~intage+sex+pdays+CHRGS, data=train_1)
rpart.plot(tree1, extra=8)



### Decision Tree with rpart ( pdays as a response variable)
str(cleaned_data)
tree2 =rpart(pdays~ sex+intage+CHRGS+DRG, train_1)
rpart.plot(tree2)

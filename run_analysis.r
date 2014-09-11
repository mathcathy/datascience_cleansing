library(dplyr)
library(tidyr)
library(reshape2)
titles<-read.table("UCI HAR Dataset/features.txt")
dataTrMain<-read.table("UCI HAR Dataset/train/X_train.txt")
names(dataTrMain)=titles[,2]
dataTrTitle<-data.frame(rep("Training", times=length(dataTrMain[,1])))
names(dataTrTitle)<-"Group"
dataTrSubj<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(dataTrSubj) = "Subject"
dataTrEx<-read.table("UCI HAR Dataset/train/y_train.txt")
names(dataTrEx) = "Exercise"
dataTr<-cbind(dataTrTitle, dataTrSubj, dataTrEx, dataTrMain)
dataTestMain<-read.table("UCI HAR Dataset/test/X_test.txt")
dataTestTitle<-data.frame(rep("Control", times=length(dataTestMain[,1])))
dataTestSubj<-read.table("UCI HAR Dataset/test/subject_test.txt")
dataTestEx<-read.table("UCI HAR Dataset/test/y_test.txt")
dataTest<-cbind(dataTestTitle, dataTestSubj, dataTestEx, dataTestMain)
names(dataTest)=names(dataTr)
data<-rbind(dataTr, dataTest)
rm(titles, dataTrTitle, dataTestTitle, dataTrEx, dataTestEx, dataTrSubj, dataTestSubj, dataTestMain, dataTrMain, dataTr, dataTest)
selectedData<-data[c(1:9, 44:49, 84:89, 124:129, 164:169, 204:205, 217:218, 230:231, 243:244,
                     256:257, 269:274, 348:353, 427:432, 506:507, 519:520, 532:533, 545:546)]
activity<-selectedData[,3]
activities<-read.table("UCI HAR Dataset/activity_labels.txt")
selectedData[,3]<-activities[activity,2]
updatedTitles<-read.table("UCI HAR Dataset/updatedtitles.txt")
names(selectedData) = updatedTitles[,1]
dataMelt<-melt(selectedData, id=c("Group", "Subject", "Exercise"))
tidyData<-dcast(dataMelt, Subject + Exercise ~ variable, mean)
rm(activity, activities, data)
write.table(tidyData, "UCI HAR Dataset/tidyData.txt", sep=",", row.name=FALSE)

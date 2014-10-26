#loading feature list and key to activity labels
feat = read.table("UCI HAR Dataset/features.txt", sep=" ")
labs =  read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")


get_data = function(set){
    # read the data for the specified set (i.e. train or test)
    # data from the X file
    file = paste("UCI HAR Dataset/", set, "/X_", set, ".txt", sep="")
    X = read.table (file, colClasses="numeric")
    # activities
    file = paste("UCI HAR Dataset/", set, "/y_", set, ".txt", sep="")
    y = read.table (file)
    # subjects
    file = paste("UCI HAR Dataset/", set, "/subject_", set, ".txt",sep="")
    subject = read.table (file)
    # label the columns with features
    colnames(X) = feat[,2]
    # bind subject with the activities and the data
    X = cbind(subject, y, X)
    # label first two columns
    colnames(X)[1:2] = c("subject", "activity")
    X # return the data frame
}

# read and bind data from the train and test sets
XX=rbind(get_data("train"), get_data("test"))

#subsetting
means = grep("mean()", colnames(XX), fixed=T)  # identify means
stds = grep("std()", colnames(XX), fixed=T)  # identify standard deviations
choose=sort(c(1:2, means, stds))  # combine with first two columns and sort
                                  # (to preserve the order)

XX = XX[,choose]  # apply subsetting

#add acticity labels
act = labs[match(XX$activity, labs[,1]),2]  # match the numbers with labels
XX$activity = act  # replace activity number codes with meaningful labels

#calculate avarages over subject/activity pairs
XXs = aggregate(XX[,-c(1,2)], list(subject = XX$subject, activity = XX$activity), mean)

#write the data set to file
write.table(XXs, "tidy_data.txt", row.name=F, eol = "\r\n")

# Melt data
meltedData <- melt(finalData, id.vars=c("Subject", "Activity"))
tidymeansdataset <- dcast(meltedData, Activity + Subject ~ variable, mean)

## Save data
write.csv(tidymeansdataset, "tidymeansdataset.txt", row.names=F)
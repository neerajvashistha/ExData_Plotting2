source('./loadData.R')
subset<-NEI[NEI$fips=="24510",]
emm<-aggregate(subset$Emissions, list(subset$year),FUN = "sum")
png(filename = "./figure/plot2.png", 
    width = 480, height = 480, 
    units = "px")
plot(emm,type='l',xlab = "Year", main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()


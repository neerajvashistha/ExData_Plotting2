source('./loadData.R')
emm<-aggregate(NEI$Emissions, list(NEI$year),FUN = "sum")
png(filename = "./figure/plot1.png", 
    width = 480, height = 480, 
    units = "px")
plot(emm,type='l',xlab = "Year", main = "Total Emissions in the United States from 1999 to 2008",ylab=expression('Total PM'[2.5]*" Emission")
)
dev.off()



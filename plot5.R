source('./loadData.R')
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
sub<-NEI[NEI$fips=="24510",]
motor <- sub[sub$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")
png(filename = "./figure/plot5.png", 
    width = 480, height = 480, 
    units = "px")
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

plot1<- function(){

   # reading all the data from the text file to data frame "data"
   # All columns are characters
   # Separator is ";"
   # "?" are read as NA
   data<-read.table("household_power_consumption.txt" , header = TRUE, sep = ";",na.strings = "?",colClasses ="character" ) 

   #Filter data for Feb 1st and 2nd of 2007
   # Collect add date to FINAL data frame
   #
   feb1<-data[data$Date=="1/2/2007", ]
   feb2<-data[data$Date=="2/2/2007", ]
   final<-rbind(feb1,feb2)
  
   # Draw a histogram with Global_active_power on X - Axis and Frequncey on Y - Axis
   hist(as.numeric(final$Global_acti), col = "Red", xlab="Global Active Power(kilowatts)", ylab="Frequency", mar=c(480,480), 
   main = "Global Active Power")

   # Copy the plot as plot1.png
   # Close the graphic device once done
   dev.copy(png,file="plot1.png")
   dev.off()
}
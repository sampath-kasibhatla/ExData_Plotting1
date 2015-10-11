plot2<- function(){
  
  # reading all the data from the text file to data frame "data"
  # All columns are characters
  # Separator is ";"
  # "?" are read as NA
  
  data<-read.table("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = "?",colClasses ="character" ) 
  
  
  #Filter data for Feb 1st and 2nd of 2007
  # Collect add date to FINAL data frame
  
  feb1<-data[data$Date=="1/2/2007", ]
  feb2<-data[data$Date=="2/2/2007", ]
  final<-rbind(feb1,feb2)
  
  # STEP 1:- Plot day on X-Axis (use strptime function on Date and Time to acheive continous graph) and
  #          and Global Active Power on Y-Axis
  # STEP 2:- connect the dots using lines() function

  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,3]), ylab="Global Active Power (Kilowatts)", xlab=NULL, pch=".")
  par(mar=c(3,4,4,2))
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,3]))

  # Copy the plot as plot2.png
  # Close the graphic device once done
  dev.copy(png,file="plot2.png")
  dev.off()
}
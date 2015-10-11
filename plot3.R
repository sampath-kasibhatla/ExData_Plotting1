plot3<- function(){
  
  # reading all the data from the text file to data frame "data"
  # All columns are characters
  # Separator is ";"
  # "?" are read as NA
  data<-read.table("household_power_consumption.txt" , header = TRUE, sep = ";",na.strings = "?",colClasses ="character" ) 
  
  #Filter data for Feb 1st and 2nd of 2007
  # Collect add date to FINAL data frame
  feb1<-data[data$Date=="1/2/2007", ]
  feb2<-data[data$Date=="2/2/2007", ]
  final<-rbind(feb1,feb2)
  
  
  
  # STEP 1:- Plot day on X-Axis (use strptime function on Date and Time to acheive continous graph)
  #          and Global Active Power on Y-Axis
  # NOTE:- its empty graph
  
  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]),type="n",
       ylab="Energy Sub Metering",xlab=" ",pch=".")
  par(mar=c(3,4,4,2))
  
  # STEP 2:- Add points to the plot for Sub_metering_1 , Sub_metering_2 and Sub_metering_3
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]),pch=".")
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,8]),pch=".")
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,9]),pch=".")
  
  # STEP 3:- connect the dots using lines() function with DESIRED COLORS
  
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]))
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,8]),col="red")
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,9]),col="blue")
  
  # STEP 4:- Adding legends
  legend("topright",      # location of the legend on the plot
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # category labels
         col = c( "black","red","blue"),  # color key
         lty= 1,             # line style
         lwd = 1 ,           # line width
         bty="n"             # no border around legend
  )
  
  
    # Copy the plot as plot3.png
  # Close the graphic device once done
  dev.copy(png,file="plot3.png")
  dev.off()
}
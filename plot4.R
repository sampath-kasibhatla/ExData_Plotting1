plot4<- function(){
  
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
    
  # STEP 1:- Divide plot into 4(2X2) parts
  par(mfcol=c(2,2))
  
  # STEP 2:- PLOT 1
  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,3]),
       ylab="Global Active Power", xlab=" ",pch=".")
  par(mar=c(3,4,4,2))
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,3]))
  

  # STEP 3:- PLOT 2
  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]),type="n",
       xlab="Datetime", ylab="Energy Sub Metering",pch=".")
  par(mar=c(3,4,4,2))
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]),pch=".")
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,7]))
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,8]),pch=".")
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,8]),col="red")
  points(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,9]),pch=".")
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,9]),col="blue")

  # STEP 3:- PLOT 3
  par(mar=c(5,4,4,2))
  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,5]),
       xlab="datetime", ylab="Voltage",pch=".")
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,5]))
  
  # STEP 4:- PLOT 4
  plot(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,4]),
       xlab="datetime", ylab=" Global_Reactive_power",pch=".")
  par(mar=c(5,4,4,2))
  lines(strptime(paste(final[ ,1],final[ ,2],sep=" "),"%d/%m/%Y %H:%M:%S"),as.numeric(final[,4]))
  
  # Copy the plot as plot4.png
  
  # Close the graphic device once done
  dev.copy(png,file="plot4.png")
  dev.off()
}
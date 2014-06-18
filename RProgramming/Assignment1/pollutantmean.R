pollutantmean<- function(directory, pollutant, id=1:332)
{
	sums<- 0
	sumn<- 0
	for(i in id)
	{	##conduct the directory
		if(i<10)
		{	
			direct<- paste(directory,"/","00",toString(i),".","csv",sep="")
		}
		else if(i>=10 && i<100)
		{
			direct<- paste(directory,"/","0",toString(i),".","csv",sep="")
		}
		else
		{
			direct<- paste(directory,"/",toString(i),".","csv",sep="")
		}
		data<-read.csv(direct)
		s<-sum(data[,pollutant],na.rm=T)    ##sum of pollutant of one file
		n<-sum(!is.na(data[,pollutant]))    ##number of the pollutant counted in one file
		sums<- sums+s
		sumn<- sumn+n
	}
	sums/sumn
}















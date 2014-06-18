corr <- function(directory, threshold = 0) 
{
	cr= c()
	for(i in 1:332)
	{	##conduct the directory
		if(i<10)
		{	
			direct<- paste(directory,"/","00",toString(i),".","csv",sep="")
		}
		else if(i>=100)
		{
			direct<- paste(directory,"/",toString(i),".","csv",sep="")
		}
		else
		{
			direct<- paste(directory,"/","0",toString(i),".","csv",sep="")
		}
		data<-read.csv(direct)
		s<- !is.na(data[,"sulfate"])
		ni<- !is.na(data[,"nitrate"])
		sn<- s+ni
		n<- sum(sn==2)
		if(n>threshold)
		{
			cr=c(cr,cor(data[,"sulfate"],y=data[,"nitrate"],use="complete.obs"))
		}
	}
	cr
}
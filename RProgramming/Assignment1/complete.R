complete<- function(directory,id=1:332)
{
	for(i in id)
	{	
		if(i==id[1])       ##create a data frame for the first loop
		{	
			if(i<10)	 ##conduct the directory
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
			s<- !is.na(data[,"sulfate"])
			ni<- !is.na(data[,"nitrate"])
			sn<- s+ni
			n<- sum(sn==2)
			df<- data.frame(id=i,nobs=n)
		}
		else
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
			s<- !is.na(data[,"sulfate"])
			ni<- !is.na(data[,"nitrate"])
			sn<- s+ni
			n<- sum(sn==2)
			newrow<- c(i, n)
			df<- rbind(df,newrow)
		}
	}
	df
}
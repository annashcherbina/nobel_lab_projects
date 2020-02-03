rm(list=ls())
library(ggplot2)
source("~/helpers.R")
data=read.table("great.plot.inputs.R.csv",header=TRUE,sep='\t')

# Core wrapping function
wrap.it <- function(x, len)
{ 
  sapply(x, function(y) paste(strwrap(y, len), 
                              collapse = "\n"), 
         USE.NAMES = FALSE)
}


# Call this function with a list or vector
wrap.labels <- function(x, len)
{
  if (is.list(x))
  {
    lapply(x, wrap.it, len)
  } else {
    wrap.it(x, len)
  }
}



data$Pathway=wrap.labels(data$Pathway,20)
data$BH=-10*log10(data$BH)

d0_up=data[data$Day==0 & data$Up=="Young",]
p1=ggplot(data=d0_up,aes(x=d0_up$Pathway,y=d0_up$BH))+
  geom_bar(stat="identity")+
  xlab("Day 0 Young Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

d0_down=data[data$Day==0 & data$Up=="Old",]
p2=ggplot(data=d0_down,aes(x=d0_down$Pathway,y=d0_down$BH))+
  geom_bar(stat="identity")+
  xlab("Day 0 Aged Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))


d3_up=data[data$Day==3 & data$Up=="Young",]
p3=ggplot(data=d3_up,aes(x=d3_up$Pathway,y=d3_up$BH))+
  geom_bar(stat="identity")+
  xlab("Day 3 Young Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

d3_down=data[data$Day==3 & data$Up=="Old",]
p4=ggplot(data=d3_down,aes(x=d3_down$Pathway,y=d3_down$BH))+
  geom_bar(stat="identity")+
  xlab("Day 3 Aged Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))


d5_up=data[data$Day==5 & data$Up=="Young",]
p5=ggplot(data=d5_up,aes(x=d5_up$Pathway,y=d5_up$BH))+
  geom_bar(stat="identity")+
  xlab("Day 5 Young Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

d5_down=data[data$Day==5 & data$Up=="Old",]
p6=ggplot(data=d5_down,aes(x=d5_down$Pathway,y=d5_down$BH))+
  geom_bar(stat="identity")+
  xlab("Day 5 Aged Enriched Terms")+
  ylab("-10log10(BH)")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

multiplot(p1,p2,p3,p4,p5,p6,cols=6)
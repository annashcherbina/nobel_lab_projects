rm(list=ls())
library(ggplot2)
source("~/helpers.R")
data=read.table("updated_pathways_to_plot.tsv",header=TRUE,sep='\t')

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
data$Day=factor(data$Day)

old=data[data$Up=="Old",]
young=data[data$Up=="Young",]

young$Pathway=factor(young$Pathway,levels=young$Pathway)
old$Pathway=factor(old$Pathway,levels=old$Pathway)


p1=ggplot(data=young,aes(x=young$Pathway,y=young$BH,group=young$Day,fill=young$Day))+
  geom_bar(stat="identity")+
  xlab("Pathway")+
  ylab("-10log10(BH)")+
  theme_bw(15)+
  theme(axis.text.x = element_text(angle=90, hjust=1))+
  scale_fill_manual(values=c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00'),name="Day")+
  ggtitle("Young")

p2=ggplot(data=old,aes(x=old$Pathway,y=old$BH,fill=old$Day,group=old$Day))+
  geom_bar(stat="identity")+
  xlab("Pathway")+
  ylab("-10log10(BH)")+
  theme_bw(15)+
  theme(axis.text.x = element_text(angle=90, hjust=1))+
  scale_fill_manual(values=c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00'),name="Day")+
  ggtitle("Aged")


rm(list=ls())
source("~/helpers.R")
library(ggplot2)

a <- c("I don't feel competent enough to solve problems in R", "I don't feel competent enough to solve problems in R")

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


data=read.table("terms_per_cluster_figure1.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE)
data$Pathway=wrap.labels(data$Pathway,20)
data$P.value=-10*log10(data$P.value)
d1=data[data$Cluster==3,]
d2=data[data$Cluster==4,]
d3=data[data$Cluster==5,]
d4=data[data$Cluster==6,]
d5=data[data$Cluster==7,]
d6=data[data$Cluster==8,]

d1$Pathway=factor(d1$Pathway,levels=d1$Pathway)
d2$Pathway=factor(d2$Pathway,levels=d2$Pathway)
d3$Pathway=factor(d3$Pathway,levels=d3$Pathway)
d4$Pathway=factor(d4$Pathway,levels=d4$Pathway)
d5$Pathway=factor(d5$Pathway,levels=d5$Pathway)
d6$Pathway=factor(d6$Pathway,levels=d6$Pathway)

p1=ggplot(d1,aes(x=d1$Pathway,y=d1$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 1 Old Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

p2=ggplot(d2,aes(x=d2$Pathway,y=d2$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 1 Young Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

p3=ggplot(d3,aes(x=d3$Pathway,y=d3$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 3 Old Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))
  


p4=ggplot(d4,aes(x=d4$Pathway,y=d4$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 3 Young Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

p5=ggplot(d5,aes(x=d5$Pathway,y=d5$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 5 Old Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

p6=ggplot(d6,aes(x=d6$Pathway,y=d6$P.value))+
  geom_bar(stat="identity")+
  ylab("-10log10(P-value)")+
  xlab("Day 5 Young Enriched Terms")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1))

svg(filename="figure1_panelc.svg",width=20,height=4)
multiplot(p1,p2,p3,p4,p5,p6,cols=6)
dev.off() 

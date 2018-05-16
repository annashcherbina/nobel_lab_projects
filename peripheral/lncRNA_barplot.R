library(gplots)
source("helpers.r")
data=data.frame(read.table("lncRNA.significant.tsv.csv",header=TRUE))
p1=ggplot(data,aes(x=Sample,y=H19))+geom_bar(stat="identity")+theme_bw(20)+xlab("")+ylab("FPKM")+ggtitle("H19")
p2=ggplot(data,aes(x=Sample,y=Meg3))+geom_bar(stat="identity")+theme_bw(20)+xlab("")+ylab("FPKM")+ggtitle("Meg3")
p3=ggplot(data,aes(x=Sample,y=Dnm3os))+geom_bar(stat="identity")+theme_bw(20)+xlab("")+ylab("FPKM")+ggtitle("Dnm3os")
p4=ggplot(data,aes(x=Sample,y=Srrm4os))+geom_bar(stat="identity")+theme_bw(20)+xlab("")+ylab("FPKM")+ggtitle("Srrm4os")
p5=ggplot(data,aes(x=Sample,y=Malat1))+geom_bar(stat="identity")+theme_bw(20)+xlab("")+ylab("FPKM")+ggtitle("Malat1")
multiplot(p1,p2,p3,p4,p5,cols=3)



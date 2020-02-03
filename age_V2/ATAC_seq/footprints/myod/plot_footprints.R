rm(list=ls())
library(ggplot2)
myod=read.table("summary.Myod.txt",header=TRUE,sep='\t')
myod$Pos=myod$Position-100
#scale 
sizes=read.table("../../tagAligns/sizes.txt",header=FALSE,sep='\t')
max_size=max(sizes$V1)

myod$d0_A=myod$d0_A.neg+myod$d0_A.pos 
myod$d1_A=myod$d1_A.neg+myod$d1_A.pos 
myod$d3_A=myod$d3_A.neg+myod$d3_A.pos 
myod$d5_A=myod$d5_A.neg+myod$d5_A.pos 
myod$d7_A=myod$d7_A.neg+myod$d7_A.pos 
myod$d0_Y=myod$d0_Y.neg+myod$d0_Y.pos 
myod$d1_Y=myod$d1_Y.neg+myod$d1_Y.pos 
myod$d3_Y=myod$d3_Y.neg+myod$d3_Y.pos 
myod$d5_Y=myod$d5_Y.neg+myod$d5_Y.pos 
myod$d7_Y=myod$d7_Y.neg+myod$d7_Y.pos 

myod$d0_A=myod$d0_A*(max_size/sizes$V1[sizes$V2=="d0_A"])
myod$d0_Y=myod$d0_Y*(max_size/sizes$V1[sizes$V2=="d0_Y"])
myod$d1_A=myod$d1_A*(max_size/sizes$V1[sizes$V2=="d1_A"])
myod$d1_Y=myod$d1_Y*(max_size/sizes$V1[sizes$V2=="d1_Y"])
myod$d3_A=myod$d3_A*(max_size/sizes$V1[sizes$V2=="d3_A"])
myod$d3_Y=myod$d3_Y*(max_size/sizes$V1[sizes$V2=="d3_Y"])
myod$d5_A=myod$d5_A*(max_size/sizes$V1[sizes$V2=="d5_A"])
myod$d5_Y=myod$d5_Y*(max_size/sizes$V1[sizes$V2=="d5_Y"])
myod$d7_A=myod$d7_A*(max_size/sizes$V1[sizes$V2=="d7_A"])
myod$d7_Y=myod$d7_Y*(max_size/sizes$V1[sizes$V2=="d7_Y"])

p1=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d0_A, color="d0 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d0_Y, color="d0 Young"))+
  geom_line(aes(x=myod$Pos,y=myod$d1_A, color="d1 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d1_Y, color="d1 Young"))+
  geom_line(aes(x=myod$Pos,y=myod$d3_A, color="d3 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d3_Y, color="d3 Young"))+
  geom_line(aes(x=myod$Pos,y=myod$d5_A, color="d5 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d5_Y, color="d5 Young"))+
  geom_line(aes(x=myod$Pos,y=myod$d7_A, color="d7 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d7_Y, color="d7 Young"))+
  
  scale_color_manual(name="Sample",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  ggtitle("MYOD")+
  theme_bw(20)

#split by days

p2=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d0_A, color="d0 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d0_Y, color="d0 Young"))+
  scale_color_manual(name="Sample",values=c('#a6cee3','#1f78b4'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

p3=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d1_A, color="d1 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d1_Y, color="d1 Young"))+
  scale_color_manual(name="Sample",values=c('#b2df8a','#33a02c'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")


p4=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d3_A, color="d3 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d3_Y, color="d3 Young"))+
  scale_color_manual(name="Sample",values=c('#fb9a99','#e31a1c'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")


p5=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d5_A, color="d5 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d5_Y, color="d5 Young"))+
  scale_color_manual(name="Sample",values=c('#fdbf6f','#ff7f00'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

p6=ggplot(data=myod)+
  geom_line(aes(x=myod$Pos,y=myod$d7_A, color="d7 Aged"))+
  geom_line(aes(x=myod$Pos,y=myod$d7_Y, color="d7 Young"))+
  scale_color_manual(name="Sample",values=c('#cab2d6','#6a3d9a'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

source('~/helpers.R')
multiplot(p2,p3,p4,p5,p6,cols=5)
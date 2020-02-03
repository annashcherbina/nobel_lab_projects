rm(list=ls())
library(ggplot2)
pax7=read.table("summary.Pax7.txt",header=TRUE,sep='\t')
pax7$Pos=pax7$Position-100
#scale 
sizes=read.table("../../tagAligns/sizes.txt",header=FALSE,sep='\t')
max_size=max(sizes$V1)

pax7$d0_A=pax7$d0_A.neg+pax7$d0_A.pos 
pax7$d1_A=pax7$d1_A.neg+pax7$d1_A.pos 
pax7$d3_A=pax7$d3_A.neg+pax7$d3_A.pos 
pax7$d5_A=pax7$d5_A.neg+pax7$d5_A.pos 
pax7$d7_A=pax7$d7_A.neg+pax7$d7_A.pos 
pax7$d0_Y=pax7$d0_Y.neg+pax7$d0_Y.pos 
pax7$d1_Y=pax7$d1_Y.neg+pax7$d1_Y.pos 
pax7$d3_Y=pax7$d3_Y.neg+pax7$d3_Y.pos 
pax7$d5_Y=pax7$d5_Y.neg+pax7$d5_Y.pos 
pax7$d7_Y=pax7$d7_Y.neg+pax7$d7_Y.pos 

pax7$d0_A=pax7$d0_A*(max_size/sizes$V1[sizes$V2=="d0_A"])
pax7$d0_Y=pax7$d0_Y*(max_size/sizes$V1[sizes$V2=="d0_Y"])
pax7$d1_A=pax7$d1_A*(max_size/sizes$V1[sizes$V2=="d1_A"])
pax7$d1_Y=pax7$d1_Y*(max_size/sizes$V1[sizes$V2=="d1_Y"])
pax7$d3_A=pax7$d3_A*(max_size/sizes$V1[sizes$V2=="d3_A"])
pax7$d3_Y=pax7$d3_Y*(max_size/sizes$V1[sizes$V2=="d3_Y"])
pax7$d5_A=pax7$d5_A*(max_size/sizes$V1[sizes$V2=="d5_A"])
pax7$d5_Y=pax7$d5_Y*(max_size/sizes$V1[sizes$V2=="d5_Y"])
pax7$d7_A=pax7$d7_A*(max_size/sizes$V1[sizes$V2=="d7_A"])
pax7$d7_Y=pax7$d7_Y*(max_size/sizes$V1[sizes$V2=="d7_Y"])

p1=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d0_A, color="d0 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d0_Y, color="d0 Young"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d1_A, color="d1 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d1_Y, color="d1 Young"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d3_A, color="d3 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d3_Y, color="d3 Young"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d5_A, color="d5 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d5_Y, color="d5 Young"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d7_A, color="d7 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d7_Y, color="d7 Young"))+
  
  scale_color_manual(name="Sample",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw(20)

#split by days

p2=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d0_A, color="d0 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d0_Y, color="d0 Young"))+
  scale_color_manual(name="Sample",values=c('#a6cee3','#1f78b4'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

p3=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d1_A, color="d1 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d1_Y, color="d1 Young"))+
  scale_color_manual(name="Sample",values=c('#b2df8a','#33a02c'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")


p4=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d3_A, color="d3 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d3_Y, color="d3 Young"))+
  scale_color_manual(name="Sample",values=c('#fb9a99','#e31a1c'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")


p5=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d5_A, color="d5 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d5_Y, color="d5 Young"))+
  scale_color_manual(name="Sample",values=c('#fdbf6f','#ff7f00'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

p6=ggplot(data=pax7)+
  geom_line(aes(x=pax7$Pos,y=pax7$d7_A, color="d7 Aged"))+
  geom_line(aes(x=pax7$Pos,y=pax7$d7_Y, color="d7 Young"))+
  scale_color_manual(name="Sample",values=c('#cab2d6','#6a3d9a'))+
  xlab("Distance from Motif Center")+
  ylab("Average Cuts")+
  theme_bw()+
  theme(legend.position="bottom")

source('~/helpers.R')
multiplot(p2,p3,p4,p5,p6,cols=5)
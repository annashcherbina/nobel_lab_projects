rm(list=ls())
library(ggplot2)
c25 <- c("dodgerblue2","#E31A1C", # red
         "green4",
         "#6A3D9A", # purple
         "#FF7F00", # orange
         "black","gold1",
         "skyblue2","#FB9A99", # lt pink
         "palegreen2",
         "#CAB2D6", # lt purple
         "#FDBF6F", # lt orange
         "gray70", "khaki2",
         "maroon","orchid1","deeppink1","blue1","steelblue4",
         "darkturquoise","green1","yellow4","yellow3",
         "darkorange4","brown")
filtered=read.table("filtered_cpm_peaks.txt",sep='\t',header=TRUE)
filtered$Chrom_Start_End=NULL
data.pca=prcomp(t(filtered),scale=FALSE,center=FALSE)
var_explained=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))

#png('atac.varexplained.png',height=10,width=10,units='in',res=300)
yvals=100*data.pca$sdev^2/sum(data.pca$sdev^2)
yvals=yvals[1:12]
xvals=1:12
var_data=data.frame(xvals,yvals,var_explained[1:12])
names(var_data)=c("xvals","yvals","labels")
ggplot(data=var_data,aes(x=xvals,y=yvals,label=labels))+
  geom_bar(stat="identity")+
  geom_text(angle=90,nudge_y = 5)+
  xlab("Principal Component")+
  ylab("% Variance Explained")

pca_vals=as.data.frame(data.pca$x)
cur_rownames=as.matrix(as.data.frame(strsplit(rownames(pca_vals),'_')))
day=as.vector(cur_rownames[1,])
age=as.vector(cur_rownames[2,])
pca_vals$Day=day
pca_vals$Age=age

#remove replicates we don't want 
pca_vals_filtered=pca_vals[!(rownames(pca_vals) %in% c("d0_Aged_Rep4","d0_Young_Rep2","d7_Young_Rep1","d0_Aged_Rep3","d1_Young_Rep1","d0_Aged_Rep1")),]

library(plotly)
p <- plot_ly(pca_vals_filtered, x = ~PC1, y = ~PC2, z = ~PC3, color = ~Day, symbol = ~Age, colors=c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e'),symbols=c("circle","square")) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'PC1'),
                      yaxis = list(title = 'PC2'),
                      zaxis = list(title = 'PC3')))

#p1 vs p2 
ggplot(data=pca_vals_filtered,
       aes(x=PC1,
           y=PC2,
           label=rownames(pca_vals_filtered)))+
  geom_point(size=5,aes(color=Day,shape=Age))+
  xlab("PC1")+
  ylab("PC2")+
  scale_color_manual(values=c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e'))+
   theme_bw(20)

#pc2 vs pc3
ggplot(data=pca_vals_filtered,
       aes(x=PC2,
           y=PC3,
           label=rownames(pca_vals_filtered)))+
  geom_point(size=5,aes(color=Day,shape=Age))+
  xlab("PC2")+
  ylab("PC3")+
  scale_color_manual(values=c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e'))+
  theme_bw(20)


#pc1 vs pc3
ggplot(data=pca_vals_filtered,
       aes(x=PC1,
           y=PC3,
           label=rownames(pca_vals_filtered)))+
  geom_point(size=5,aes(color=Day,shape=Age))+
  xlab("PC1")+
  ylab("PC3")+
  scale_color_manual(values=c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e'))+
  theme_bw(20)


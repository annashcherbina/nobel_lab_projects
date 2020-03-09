rm(list=ls())
library(VennDiagram)
data=read.table("venn_input.txt",header=TRUE,sep='\t',row.names=1)
data$genes=row.names(data)

diff_aged=data$genes[data$a==1]
diff_young=data$genes[data$y==1]
diff_activated=data$genes[data$activated==1]

# Prepare a palette of 3 colors with R colorbrewer:
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")
venn.diagram(x = list(as.vector(diff_aged), as.vector(diff_young), as.vector(diff_activated)),
  category.names = c("d3 Aged vs d0 Aged" , "d3 Young vs d0 Young" , "Activated vs Quiescent"),
  filename = 'diff.png',
  imagetype="png" ,
  resolution = 300,
  compression = "lzw",
  height = 1000 , 
  width = 1000,
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  # Numbers
  cex = 1,
  fontface = "bold",
  fontfamily = "sans",
  # Set names
  cat.cex = 0.6,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.pos = c(-27, 27, 135),
  cat.dist = c(0.055, 0.055, 0.085),
  cat.fontfamily = "sans",
  rotation = 1,
  output=TRUE)



diff_aged_up=data$genes[data$up_3da==1]
diff_young_up=data$genes[data$up_3dy==1]
diff_activated_up=data$genes[data$up_activated==1]

# Prepare a palette of 3 colors with R colorbrewer:
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")
venn.diagram(x = list(as.vector(diff_aged_up), as.vector(diff_young_up), as.vector(diff_activated_up)),
             category.names = c("d3 Aged vs d0 Aged" , "d3 Young vs d0 Young" , "Activated vs Quiescent"),
             filename = 'up3days.png',
             imagetype="png" ,
             resolution = 300,
             compression = "lzw",
             height = 1000 , 
             width = 1000 ,
             # Circles
             lwd = 2,
             lty = 'blank',
             fill = myCol,
             # Numbers
             cex = 1,
             fontface = "bold",
             fontfamily = "sans",
             # Set names
             cat.cex = 0.6,
             cat.fontface = "bold",
             cat.default.pos = "outer",
             cat.pos = c(-27, 27, 135),
             cat.dist = c(0.055, 0.055, 0.085),
             cat.fontfamily = "sans",
             rotation = 1,
             output=TRUE)


diff_aged_down=data$genes[data$down_3da==1]
diff_young_down=data$genes[data$down_3dy==1]
diff_activated_down=data$genes[data$down_activated==1]

# Prepare a palette of 3 colors with R colorbrewer:
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")
venn.diagram(x = list(as.vector(diff_aged_down), as.vector(diff_young_down), as.vector(diff_activated_down)),
             category.names = c("d3 Aged vs d0 Aged" , "d3 Young vs d0 Young" , "Activated vs Quiescent"),
             filename = 'down3days.png',
             imagetype="png" ,
             resolution = 300,
             compression = "lzw",
             height = 1000 , 
             width = 1000 ,
             # Circles
             lwd = 2,
             lty = 'blank',
             fill = myCol,
             # Numbers
             cex = 1,
             fontface = "bold",
             fontfamily = "sans",
             # Set names
             cat.cex = 0.6,
             cat.fontface = "bold",
             cat.default.pos = "outer",
             cat.pos = c(-27, 27, 135),
             cat.dist = c(0.055, 0.055, 0.085),
             cat.fontfamily = "sans",
             rotation = 1,
             output=TRUE)


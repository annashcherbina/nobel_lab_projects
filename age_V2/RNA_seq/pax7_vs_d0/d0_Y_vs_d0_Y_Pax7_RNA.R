rm(list=ls())
library(ggplot2)
library(scales)
data=read.table("RNA_asinh_tpm_minus_sva_contribs.txt",header=TRUE,sep='\t')

d0_Y=sinh((data$d0_Y_Rep2+
      data$d0_Y_Rep3+
      data$d0_Y_Rep4+
      data$d0_Y_Rep5+
      data$d0_Y_Rep6)/5)
d0_Y_Pax7=sinh(data$d0_Y_Pax7_Rep1)
df=data.frame(d0_Y,d0_Y_Pax7)
df=df[rowSums(df)>10^-5,]
print(ggplot(data=df,
             aes(x=df$d0_Y,
                 y=df$d0_Y_Pax7))+
        geom_point(alpha=0.1,size=0.3)+
        geom_abline(slope=1)+
        xlab("D0 Young (log10 TPM)")+
        ylab("D0 Young PAX7 (log10 TPM)")+
        ggtitle("RNA Expression in d0 Young, Spearman R= 0.97")+
        scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                      labels = trans_format("log10", math_format(10^.x))) +
        scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                      labels = trans_format("log10", math_format(10^.x))) +
        theme_bw(15))

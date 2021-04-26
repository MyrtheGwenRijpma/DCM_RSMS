setwd("~/Box Sync/Science/2019/rSMS_DCM/documents/PCA_all_PAG_node_connections_final/paper_resources")

library(tidyverse)
library(reshape2)
library(ggplot2)
library(ggpubr)
library(magrittr)

dcm_data <- read_csv(file = "PAG_all_1and3clus_output_86.csv")
  
#percentage stacked
ggplot(dcm_data, aes(fill=Dx, y=Percentage, x=Clus, colour = Dx)) + 
  geom_col(position="stack", width = 0.5) +
  scale_fill_manual(values = c("#550091", "#fa900f")) +
  scale_colour_manual(values = c("#550091", "#fa900f")) +
  labs( y = "Percentage (%)",
    x = "") +
  theme_minimal() + 
  theme(
    axis.text = element_text(size=25),
    axis.title = element_text(size = 30),
    legend.text = element_text(size = 25),
    legend.title = element_text(size = 30),
  )
setwd("~/Box Sync/Science/2019/rSMS_DCM/documents/PCA_all_PAG_node_connections_final/paper_resources")

library(tidyverse)
library(reshape2)
library(ggplot2)
library(ggpubr)
library(magrittr)

##ONC
#confidence interval data 
dcm_CI_ONC <- read_csv(file = "CIs_ONC_rSMSex.csv") %>%
  #dplyr::filter(dummy_PAG==1) %>%
  arrange(desc(LowerCL))

#forestplot with ggplot2
ggplot(data=dcm_CI_ONC, aes(x= reorder(Parameter, LowerCL), y=Estimate, ymin=LowerCL, ymax=UpperCL)) +
  geom_errorbar() +   
  geom_point(color="#fa900f", size = 4) +
  geom_hline(yintercept=0, lty=2) +  # add a dotted line at x=1 after flip
  coord_flip() +  # flip coordinates (puts labels on y axis) 
  labs(#title = "confidence limits of effective node connections predicting RSMS total score",
       y = "mean (95%Cl)",
       x = "effective node connections") +
  theme_bw() + # use a white background  
  theme(
    axis.text.x = element_text(size=30, hjust = 1),
    axis.text.y = element_text(size=30, hjust = 1),
    axis.title.x = element_text(size = 35),
    axis.title.y = element_text(size = 35),
  ) +
ggsave(filename = "./PAG_RSMS_ind_ONC.tiff", device = "tiff", width = 25, height = 35, dpi = 100)

##bvFTD
#confidence interval data 
dcm_CI_bvFTD <- read_csv(file = "CIs_bvFTD_rSMSex.csv") %>%
  #dplyr::filter(dummy_PAG==1) %>%
  arrange(desc(LowerCL))

#forestplot with ggplot2
ggplot(data=dcm_CI_bvFTD, aes(x= reorder(Parameter, LowerCL), y=Estimate, ymin=LowerCL, ymax=UpperCL)) +
  geom_errorbar() +   
  geom_point(color="#6c0080", size = 4) +
  geom_hline(yintercept=0, lty=2) +  # add a dotted line at x=1 after flip
  coord_flip() +  # flip coordinates (puts labels on y axis) 
  labs(#title = "confidence limits of effective node connections predicting RSMS total score",
    y = "mean (95%Cl)",
    x = "effective node connections") +
  theme_bw() + # use a white background  
  theme(
    axis.text.x = element_text(size=30, hjust = 1),
    axis.text.y = element_text(size=30, hjust = 1),
    axis.title.x = element_text(size = 35),
    axis.title.y = element_text(size = 35),
  ) +
ggsave(filename = "./PAG_RSMS_ind_bvFTD.tiff", device = "tiff", width = 25, height = 35, dpi = 100)

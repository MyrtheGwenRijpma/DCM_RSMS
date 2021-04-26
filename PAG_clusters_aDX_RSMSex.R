setwd("~/Box Sync/Science/2019/rSMS_DCM/documents/PCA_all_PAG_node_connections_final/paper_resources")

library(tidyverse)
library(reshape2)
library(ggplot2)
library(ggpubr)
library(magrittr)
library(dplyr)

#cluster data set from Matlab
dcm_data <- read_csv(file = "PAG_all_clus_output_86.csv")

# linear trend + confidence interval 
##scatter right PAG right thalamus
ggplot(dcm_data, aes(x=R_dlPAG_R_dmThal2, y=RSMS_tot)) +
  geom_point(color="#fa900f", size = 4) +
  theme_minimal() +
  labs(x = "PAG to right thalamus", y = "RSMS total score") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(), 
        legend.text = 
  ) +
  scale_y_continuous(breaks=seq(35, 65, 5)) +
  scale_x_continuous(breaks=seq(-0.2, 0.3, 0.1)) +
  geom_smooth(method=lm , color="black", fill="#c5c7d1", se=TRUE)
ggsave(filename = "./pag_to_r_thal.tiff", device = "tiff", width = 10, height = 10, dpi = 100)


##scatter right PAG left thalamus
ggplot(dcm_data, aes(x=R_dlPAG_L_dmThal2, y=RSMS_tot)) +
  geom_point(color="#fa900f", size = 4) +
  theme_minimal() +
  labs(x = "PAG to left thalamus", y = "RSMS total score") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(), 
  ) +
  scale_y_continuous(breaks=seq(35, 65, 5)) +
  scale_x_continuous(breaks=seq(-0.2, 0.3, 0.1)) +
  geom_smooth(method=lm , color="black", fill="#c5c7d1", se=TRUE)
ggsave(filename = "./pag_to_l_thal.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter right PAG right vAI
ggplot(dcm_data, aes(x=R_dlPAG_R_vAI, y=RSMS_tot)) +
  geom_point(color="#fa900f", size = 4) +
  theme_minimal() +
  labs(x = "PAG to right ventral AI", y = "RSMS total score") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(), 
  ) +
  scale_y_continuous(breaks=seq(35, 65, 5)) +
  scale_x_continuous(breaks=seq(-0.2, 0.3, 0.1)) +
  geom_smooth(method=lm , color="black", fill="#c5c7d1", se=TRUE)
ggsave(filename = "./pag_to_r_vAI.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter right PAG ACC
ggplot(dcm_data, aes(x=R_dlPAG_ACC, y=RSMS_tot)) +
  geom_point(color="#fa900f", size = 3) +
  theme_minimal() +
  labs(x = "PAG to ACC", y = "RSMS total score") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(), 
  ) +
  scale_y_continuous(breaks=seq(35, 65, 5)) +
  scale_x_continuous(breaks=seq(-0.2, 0.3, 0.1)) +
  geom_smooth(method=lm , color="black", fill="#c5c7d1", se=TRUE)
ggsave(filename = "./pag_to_ACC.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter right hypothalamus to PAG
ggplot(dcm_data, aes(x=R_Hypo_R_dlPAG, y=RSMS_tot)) +
  geom_point(color="#fa900f", size = 3) +
  theme_minimal() +
  labs(x = "right hypothalamus to PAG", y = "RSMS total score") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(), 
  ) +
  scale_y_continuous(breaks=seq(35, 65, 5)) +
  scale_x_continuous(breaks=seq(-0.2, 0.3, 0.1)) +
  geom_smooth(method=lm , color="black", fill="#c5c7d1", se=TRUE)
ggsave(filename = "./r_hypo_to_PAG.tiff", device = "tiff", width = 10, height = 10, dpi = 100)


#data prep
#cluster data set from Matlab
dcm_data <- read_csv(file = "PAG_all_clus_output_86.csv")
dcm_ONC <- read_csv(file = "PAG_all_clus_output_86.csv") %>%
  dplyr::filter(DX_dummy==0)

dcm_data$Clus <- as.factor(dcm_data$Clus)
dcm_ONC$Clus <- as.factor(dcm_ONC$Clus)


##scatterplot of cortical and subcortical output with clusters colorcoded, ONC only!
ggplot(dcm_ONC, aes(x=PAG_output_cort, y=PAG_output_subc)) +
  geom_point(aes(color=Clus), size = 3) +
  scale_color_manual(values = c("2" = "#e41a1c", "3" = "#4daf4a", "1" = "#377eb8"),
                     name = "Cluster group",
                     labels = c("group 1", "group 2", "group 3")) +
  scale_shape_manual(values = c(8, 16),
                     name = "Diagnosis") +
  theme_minimal() +
  labs(x = "PAG output to cortical SN nodes", y = "PAG output to subcortical SN nodes") +
  theme(text = element_text(size = 20),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank()) +
  ggsave(filename = "./PAG_clus_scat_ONC.tiff", device = "tiff", width = 10, height = 7.5, dpi = 100)


##scatterplot of cortical and subcortical output with clusters colorcoded, all DX!
ggplot(dcm_data, aes(x=PAG_output_cort, y=PAG_output_subc)) +
  geom_point(aes(color=Clus, shape = Dx), size = 5) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", se=F) +
  scale_color_manual(values = c("2" = "#e41a1c", "3" = "#4daf4a", "1" = "#377eb8"),
                     name = "Cluster group",
                     labels = c("group 1", "group 2", "group 3")) +
  scale_shape_manual(values = c(8, 16),
                     name = "Diagnosis") +
  theme_minimal() +
  labs(x = "PAG output to cortical SN nodes", y = "PAG output to subcortical SN nodes") +
  theme(text = element_text(size = 22),
        axis.text = element_text(size = 22),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank()) +
  ggsave(filename = "./PAG_clus_scat.tiff", device = "tiff", width = 10, height = 7.5, dpi = 100)


#boxplot of cluster groups predicting RSMS score, ONC only
ggplot(dcm_ONC, aes(x = Clus, y=RSMS_EX, fill=Clus)) + 
  scale_fill_manual(values=c("#377eb8", "#e41a1c", "#4daf4a")) +
  geom_boxplot(lwd=0.2) +
  stat_summary(fun = mean, geom="point", shape=23, size=7, fill = "black") +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.5, fill = "black") +
  theme_minimal() +
  labs(x = "Cluster groups", y = "RSMS EX score") +
  theme(text = element_text(size = 30),
        axis.text = element_text(size = 25),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position="none") +
  ggsave(filename = "./PAG_clus_boxplot_ONC.tiff", device = "tiff", width = 7.5, height = 10, dpi = 100)

#boxplot of cluster groups predicting RSMS score, all DX
ggplot(dcm_data, aes(x = Clus, y=RSMS_EX, fill=Clus)) + 
  scale_fill_manual(values=c("#377eb8", "#e41a1c", "#4daf4a")) +
  geom_boxplot(lwd=0.2) +
  stat_summary(fun = mean, geom="point", shape=23, size=7, fill = "black") +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.5, fill = "black") +
  theme_minimal() +
  labs(x = "Cluster groups", y = "RSMS EX score") +
  theme(text = element_text(size = 30),
        axis.text = element_text(size = 25),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position="none") +
  ggsave(filename = "./PAG_clus_boxplot_all.tiff", device = "tiff", width = 7.5, height = 10, dpi = 100)

#write.csv(dcm_data,"./ONC_PAG_output_input.csv", row.names = FALSE)

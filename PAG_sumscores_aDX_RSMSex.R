setwd("~/Box Sync/Science/2019/rSMS_DCM/documents/PCA_all_PAG_node_connections_final/paper_resources")

library(tidyverse)
library(reshape2)
library(ggplot2)
library(ggpubr)
library(magrittr)
library(dplyr)


dcm_data <- read_csv(file = "SAS_DCM_86.csv") #under the paper_resources folder

##scatter PAG input with RSMS; used for generating legend
ggplot(dcm_data, aes(x=PAG_input, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG input from all SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank()) +
  ggsave(filename = "./PAG_input_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)



##scatter PAG input with RSMS
ggplot(dcm_data, aes(x=PAG_input, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG input from all SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
  ggsave(filename = "./PAG_input_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG cortical input with RSMS
ggplot(dcm_data, aes(x=PAG_input_cort, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG input from cortical SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank()) +
  ggsave(filename = "./PAG_input_cort_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG subcortical input with RSMS
ggplot(dcm_data, aes(x=PAG_input_subc, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG input from subcortical SN nodes ", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank()) +
  ggsave(filename = "./PAG_input_subc_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)


##scatter PAG output with RSMS
ggplot(dcm_data, aes(x=PAG_output, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG  output to all SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
ggsave(filename = "./PAG_output_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG cortical output with RSMS
ggplot(dcm_data, aes(x=PAG_output_cort, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG output to cortical SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
ggsave(filename = "./PAG_output_cort_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG output subcortical with RSMS
ggplot(dcm_data, aes(x=PAG_output_subc, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG output to subcortical SN nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
ggsave(filename = "./PAG_output_subcort_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)


##scatter PAG output amygdala with RSMS
ggplot(dcm_data, aes(x=PAG_output_amy, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG output towards amygdala nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
  ggsave(filename = "./PAG_output_amy_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG output thalamus with RSMS
ggplot(dcm_data, aes(x=PAG_output_thal, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG output towards thalamic nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
  ggsave(filename = "./PAG_output_thal_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)

##scatter PAG output hypothalamus with RSMS
ggplot(dcm_data, aes(x=PAG_output_HT, y=RSMS_EX)) +
  geom_point(aes(color=Dx), size = 4) +
  geom_smooth(aes(group = Dx), method=lm, color = "black", fill="#c5c7d1", se=TRUE) +
  scale_color_manual(values = c("ONC" = "#fa900f", "bvFTD" = "#550091")) +
  theme_minimal() +
  labs(x = "PAG output towards hypothalamic nodes", y = "RSMS EX") +
  theme(text = element_text(size = 24),
        panel.background = element_rect(color = NA), 
        panel.grid.minor = element_blank(),
        legend.position = "none") +
  ggsave(filename = "./PAG_output_HT_RSMS.tiff", device = "tiff", width = 10, height = 10, dpi = 100)



#write.csv(dcm_data,"./ONC_PAG_output_input.csv", row.names = FALSE)


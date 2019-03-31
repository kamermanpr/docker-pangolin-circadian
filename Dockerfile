################################################################################
# 									                                           #
# KAMERMANPR/DOCKER-PAIN-THRESHOLD				                               #
#									                                           #
# Build an image with the environment required to run the                      #
# pangolin-circadian analysis                                                  #
#                                                                              #
# <-- Build command -->                                                        #
# docker build -t kamermanpr/docker-pangolin-circadian:<version>               #
#                                                                              #
# <-- The build image can be downloaded from Docker Hub -->                    #
# docker pull kamermanpr/docker-pangolin-circadian:<version>                   #
#									                                           #
# <-- Run command -->                                                          #
# docker run --name pangolin -d -p 8787:8787 -e USER=user \                    #
# -e PASSWORD=password kamermanpr/docker-pangolin-circadian:<version>          #
#									                                           #
# <-- Login to RStudio -->                                                     #
# In your browser, navigate to: localhost:8787			                       #
# Username: user							                                   #
# Password: password							                               #
#                                                                              #
################################################################################
#
# <-- Base image -->
# Debian:stretch
# R v3.5.2
# RStudio server:v1.1.456
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN 2019-03-31 R v3.5.2 snapshot)
#
#-- Get the verse rocker image --#
#
FROM rocker/verse:latest
#
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>
#
# <-- Add MRAN packages -->
#
RUN Rscript -e "install.packages(c('magrittr', 'ggfortify', 'readxl', 'knitr', 'skimr', 'boot', 'ggridges', 'lubridate', 'multitaper', 'zoo', 'tidyquant', 'patchwork', 'ggforce', 'lmerTest', 'robustlmm', 'sjPlot'))"

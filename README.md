# docker-pangolin-circadian

A dockerfile to create an image of the R environment required to run the 'pangolin-circadian' data analysis scripts ([kamermanpr/pangolin-circadian](https://github.com/kamermanpr/pangolin-circadian.git)).

----

## R environment

The image is built using the [_rocker/verse_](https://hub.docker.com/r/rocker/verse/) image of [_base R_](https://cran.r-project.org/) _v3.5.2_, and includes [_RStudio server_](https://www.rstudio.com/products/rstudio/#Server), the [_TinyTex_](https://yihui.name/tinytex/) Latex distribution, the [_tidyverse_](https://www.tidyverse.org/) suite of R packages (with dependencies), and several R packages (with dependencies) that are required to run the markdown scripts in [_pangolin-circadian_](https://github.com/kamermanpr/pangolin-circadian.git). CRAN packages were installed from [MRAN](https://mran.microsoft.com/timemachine) using the lasted package releases at the time the image was generated.

### Details
- **OS:**  
    - Debian:stretch
- **R:**  
    - v3.5.2  
- **RStudio server:**  
    - v1.1.456 
- **MRAN packages:**  
    - magrittr'
    - ggfortify'
    - readxl 
    - knitr 
    - skimr 
    - boot 
    - ggridges 
    - lubridate 
    - multitaper 
    - zoo
    - tidyquant 
    - patchwork 
    - ggforce 
    - lmerTest 
    - robustlmm 
    - sjPlot'
- **LaTex:**   
    - TinyTex

----

## Using Docker to run the pangolin-circadian analysis

You need to have Docker installed on your computer. To do so, go to [docker.com](https://www.docker.com/community-edition#/download) and follow the instructions for downloading and installing Docker for your operating system. Once Docker has been installed, follow the steps below, noting that Docker commands are entered in a terminal window (Linux and OSX/macOS) or command prompt window (Windows). Windows users also may wish to install [_GNU Make_](http://gnuwin32.sourceforge.net/downlinks/make.php) (required for the `make` method of running the scripts) and [_Git_](https://gitforwindows.org/) version control software (not essential). 

#### Download the latest image

Enter: `docker pull kamermanpr/docker-pangolin-circadian:v1.0.0`

#### Run the container

Enter: `docker run -d -p 8787:8787 --name pangolin -e USER=user -e PASSWORD=password kamermanpr/docker-pangolin-circadian:v1.0.0`

#### Login to RStudio Server

- Open a web browser window and navigate to: `localhost:8787`

- Use the following login credentials: 
    - Username: _user_	
    - Password: _password_
    
#### Prepare the pain-threshold directory

clone the ([_kamermanpr/pangolin-circadian_](https://github.com/kamermanpr/pangolin-circadian.git) repo from GitHub: `git clone https://github.com/kamermanpr/pangolin-circadian`), or download the zip file from figshare ([DOI: 10.6084/m9.figshare.7928084](https://doi.org/10.6084/m9.figshare.7928084)), and upload it to RStudio server (it will automatically unzip).

The pangolin-circadian directory comes with the outputs for all the analysis scripts in the _/outputs_ directory (_html_ and *md* formats). However, should you wish to run the scripts yourself, there are several preparatory steps that are required:  

1. Acquire the data. The data required to run the scripts have not been included in the repo, however, the data are available on request from Peter Kamerman (peter.kamerman@gmail.com). Once the data have been obtained, the files should be uploaded to the RStudio Server instance.

2. Clean the _/outputs_ directory by entering `make clean` in the _Terminal_ tab in RStudio.

#### Run the pain-threshold analysis scripts

To run all the scripts (including the data cleaning scripts), enter `make all` in the _Terminal_ tab in RStudio. 

#### Shutting down

Once done, log out of RStudio Server and enter the following into a terminal to stop the Docker container: `docker stop pangolin`. If you then want to remove the container, enter: `docker rm pangolin`. If you also want to remove the Docker image you downloaded, enter: `docker rmi kamermanpr/docker-pangolin-circadian:v1.0.0`

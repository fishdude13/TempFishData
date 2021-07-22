library(measurements)
library(readxl)
library(writexl)
library(tidyverse)
library(tidylog)





# NHDdata contains the NHD flowline characteristics for sites where fish have been collected that also have water quality data
# FishSiteWQ contains the water quality results that will join to the NHDdata table -- using NHD_ID field


# This allows Water quality data to be aggregated to different spatial scales (comid, reachcode, gnis code etc..)


#### Bring in Fish Data

load("C:/R/Projects/Water/NHD_ID_Fish_Crosswalk.Rdata")



Sites <- read_excel('C:/R/Projects/FishSeaGrant/PSU_SeaGrant_FishData_06022021.xlsx', 
                    sheet = 'StationData') 
Sites


FishData <- read_excel('C:/R/Projects/FishSeaGrant/PSU_SeaGrant_FishData_06022021.xlsx', 
                       sheet = 'FishData')

# we need one more look up table... this is a download of ALL SITES in the database that
# DIDN'T HAVE A COMID IN THE ORIGINAL LIST (Sites)
# that were spatially joined to the NHD flowline 7/13/2021... these are synonymous with COMID not GISCOMID

OtherNHDLUT <- read.csv("C:/R/Projects/FishSeaGrant/AllFishSiteComidReachcodes071321.csv")


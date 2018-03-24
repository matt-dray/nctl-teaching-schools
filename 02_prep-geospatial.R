# Map teaching schoosl with Crosstalk
# This script: reproject schools data to latlong
# Matt Dray
# March 2018


# Load packages -----------------------------------------------------------


library(dplyr)  # data manipulation and pipes (%>%)
library(rgdal)  #  Geospatial Data Abstraction Library functions
library(geojsonio)  # deal with json file
library(sp)  # deal with spatial data


# Convert to latlong ------------------------------------------------------


# read schools data

all_ts_gias <- readRDS("output/all_ts_gias.RDS") %>% 
  filter(!is.na(easting) | !is.na(northing))  # 9 rows lost

# isolate coords

schools_coords <- all_ts_gias %>%
  dplyr::transmute(  # create new columns and drop all the others
    easting = as.numeric(as.character(easting)), # make this text column numeric
    northing = as.numeric(as.character(northing))
  ) %>% 
  dplyr::rename(longitude = easting, latitude = northing)  # rename, but still BNG

# isolate data

schools_data <- all_ts_gias %>%
  dplyr::select(-easting, -northing)

# reproject to latlong

schools_spdf <- sp::SpatialPointsDataFrame(  # create a SPDF
  coords = schools_coords,  # the school co-ordinates
  data = schools_data,  # the school data
  proj4string = CRS("+init=epsg:27700")  # BNG projection system
) %>% 
  sp::spTransform(CRS("+init=epsg:4326")) # reproject to latlong system

# save

saveRDS(schools_spdf, "output/schools_spdf.RDS")

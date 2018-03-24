# Map teaching schoosl with Crosstalk
# This script: Read data from Excel workbook
# Matt Dray
# March 2018


# Load packages -----------------------------------------------------------


library(dplyr)  # data manipulation and pipes (%>%)
library(readxl)  # for reading .xlsx
library(readr)
library(janitor)  # tidying data


# Read file ---------------------------------------------------------------


# data from http://apps.nationalcollege.org.uk/s2ssd_new/index.cfm

all_ts <- readxl::read_excel(
  "data/180312_teaching-schools-all.xls",
  na = c("NA", "Not applicable")
  ) %>% 
  janitor::clean_names() %>% 
  mutate(urn = as.character(urn))


# GIAS --------------------------------------------------------------------


# data from https://get-information-schools.service.gov.uk/

gias <- readr::read_csv(file = "data/180312_gias-all-open-full.csv") %>% 
    janitor::clean_names() %>% 
    dplyr::mutate(
      laestab = paste0(la_code, establishmentnumber),
      urn = as.character(urn)
    ) %>% 
    dplyr::select(
      urn, laestab,  # for matching
      num_pupils = numberofpupils,  # proxy for school size
      phase = phaseofeducation_name,  # inc all-through, etc
      #la_name, region = gor_name,
      ofsted_rating = ofstedrating_name,  # ofsted rating
      last_ofsted_date = ofstedlastinsp,  # date of last Ofsted inspection
      easting, northing  # for mapping (will be converted to latlong)
    )

readr::write_rds(gias, "output/gias.RDS")

# Join --------------------------------------------------------------------


all_ts_gias <- dplyr::left_join(
  x = all_ts,
  y = gias,
  by = "urn"
)

# saveRDS(all_ts_gias, "output/all_ts_gias.RDS")


# Checks ------------------------------------------------------------------


filter(all_ts_gias, is.na(easting) | is.na(northing))  %>% View() # 9 didn't get coords

table(all_ts_gias$region)  # seems sensible

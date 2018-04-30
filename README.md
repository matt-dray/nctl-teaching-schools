# Test: map Teaching Regulation Agency data using Crosstalk

## The tool

The tool is available here: https://matt-dray.github.io/nctl-teaching-schools/

## Background

This repo contains a test of [`crosstalk`](https://rstudio.github.io/crosstalk/) for inter-widget interactivty between a [`leaflet`](https://rstudio.github.io/leaflet/) maps and [`datatable`](https://rstudio.github.io/DT/) interactive tables in a [`flexdashboard`](https://rmarkdown.rstudio.com/flexdashboard/) layout.

> Crosstalk is an add-on to the [htmlwidgets](http://www.htmlwidgets.org/) package. It extends htmlwidgets with a set of classes, functions, and conventions for implementing cross-widget interactions (currently, linked brushing and filtering).

Selections in one htmlwidget will update the other htmlwidget. This behaviour allows for creation of simple tools that can be shared as HTML without the need for Shiny and a hosting service.

## Data

### Sources

All data are published.

* [Teaching schools](http://apps.nationalcollege.org.uk/s2ssd_new/index.cfm) from the National College for Teaching and Leadership, now known as the [Teaching Regulation Agency](https://www.gov.uk/government/organisations/teaching-regulation-agency)
* [Local authority boundaries](http://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2017-ultra-generalised-clipped-boundaries-in-united-kingdom-wgs84) from the [ONS Open Geography Portal](http://geoportal.statistics.gov.uk/)
* [Get Information About Schools](https://get-information-schools.service.gov.uk/) from the [Department for Ecucation](https://www.gov.uk/government/organisations/department-for-education)

You can find out more about teaching schools on the ['Teaching schools and system leadership: how you can get involved'](https://www.gov.uk/government/collections/teaching-schools-and-system-leadership-how-you-can-get-involved) collection on GOV.UK.

### Disclaimer

* This was built independently and not on behalf of the Teaching Regulation Agency
* Only schools with co-ordinates listed in [Get Information About Schools](https://get-information-schools.service.gov.uk/) could be mapped (nine are missing from the full dataset)
* This tool is not a replacement for the official [teaching schools](http://apps.nationalcollege.org.uk/s2ssd_new/index.cfm) service

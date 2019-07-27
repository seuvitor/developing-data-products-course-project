library(curl)
library(dplyr)
library(jsonlite)

fetchCountryData <- function() {
    jsonCountryData <- fromJSON("https://restcountries.eu/rest/v2/all")
    
    jsonCountryData %>%
    filter(sapply(jsonCountryData$latlng, length) == 2) %>%
    transmute(name,
              alpha2Code,
              flag,
              lat = sapply(latlng, "[[", 1),
              lng = sapply(latlng, "[[", 2))
}
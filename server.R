library(shiny)
library(leaflet)

source("countryDataFetcher.R")
countryData <- fetchCountryData()

shinyServer(function(input, output) {
    output$countryMap <- renderLeaflet({
        selectedCountryRow <- countryData[countryData$name == input$country, ]
        countryData %>%
            leaflet() %>%
            addTiles() %>%
            addMarkers(icon = makeIcon(iconUrl = countryData$flag,
                                       iconWidth = 40,
                                       iconHeight = 20),
                       clusterOptions = markerClusterOptions(maxClusterRadius = 40,
                                                             showCoverageOnHover = FALSE)) %>%
            setView(lng = selectedCountryRow$lng,
                    lat = selectedCountryRow$lat,
                    zoom = 4)
    })
})
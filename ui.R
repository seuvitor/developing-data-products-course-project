library(shiny)
library(leaflet)

source("countryDataFetcher.R")
countryData <- fetchCountryData()

shinyUI(fluidPage(
    titlePanel("Choose a country to see the map and flag!"),
    sidebarLayout(
        sidebarPanel(
            selectizeInput("country",
                           label = "Choose country",
                           choices = countryData$name,
                           selected = "Brazil"),
            h4("Documentation"),
            p("This Shiny app lets you choose a country to see its map and ",
              "flag."),
            p("Under the hood, it uses the http://restcountries.eu Rest API ",
              "to find the longitude and latitude of the country of your ",
              "choice and then it centers the view of a Leaflet Map on this ",
              "location."),
            p("Besides, it also fetches the flag images for the countries ",
              "and uses them as markers on the map."),
            p("Enjoy!")
        ),
        mainPanel(
            leafletOutput("countryMap")
        )
    )
))
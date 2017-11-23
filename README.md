# shiny-R
## [*] Welcome to Shiny

install.packages("shiny")
library(shiny)
runExample("01_hello")





## [*] Lesson 1: 01_hello - histogram

# Structure of a Shiny App
# (+) app.R has three components:
#   (1) a user interface object
#   (2) a server function
#   (3) a call to the shinyApp function

runApp("term")





## [*] Lesson 2 : Use R scripts and data

# Build a sophisticated app that visualizes US Census data.
# (+) Data : countries.rds(https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/census-app/data/counties.rds)
#   - the name of each country in the United States
#   - the total population of the country
#   - the percent of residents in the country who are White, Black, Hispanic, or Asian
counties <- readRDS("census-app/counties.rds")
head(counties)

## Components of the app
# (+) helpers.R
#   - A choropleth map is a map that use color to display the regional variation fo a variable.
#   - Reference : https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/census-app/helpers.R
# (+) app.R

# Loading files and file paths
install.packages(c("maps","mapproj"))
library(maps)
library(mapproj)
source("census-app/helpers.R")
counties <- readRDS("census-app/counties.rds")
percent_map(counties$white, "darkgreen", "% White")
percent_map(counties$black, "darkgreen", "% Black")
percent_map(counties$asian, "darkgreen", "% Asian")

# Execution - app.R
runApp("census-app")





## [*] Share your apps

runUrl("<the weblink>")
runGishub("<repository name>","<user name>")
runGist("<gist number>")

runGitHub("shiny-R","JeongJae-Kim")





## [*] Next study : Shinyapp.io

# Shinyapp.io is a platform as a service for hosting Shiny web apps(applications).


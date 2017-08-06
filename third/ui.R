library(shiny)
library(shinydashboard)
library(plotly)
library(rsconnect)
library(ggplot2)
library(shinythemes)
getwd()
facebook<-read.csv("data/PO文類型.csv",head = TRUE)
race<-read.csv("data/比賽項目.csv",head=TRUE)
assessment <- read.csv("data/assessment.csv",head=TRUE)
race$date=as.Date(paste0(race$年, "-", race$月, "-", race$日))
facebook$date=as.Date(paste0(facebook$年, "-", facebook$月, "-", facebook$日))


shinyUI(
  fluidPage(
    
    
    fluidRow(
      column(width = 12,
             box(
               title = "比賽項目聲量折線圖",
               status = "primary",
               width = 12,
               solidHeader = FALSE,
               collapsible = TRUE,
               selectInput("category","比賽項目:",c("Rhythmic Gymnastics",unique(as.character(race$比賽項目)))),
               plotlyOutput("race_line",height = "450px")))),
    

    fluidRow(
      column(width=12,
             box(
               title = "比賽項目長條圖",
               status="primary",
               width = 12,
               solidHeader=FALSE,
               collapsible=TRUE,
               plotlyOutput("race_count",height="450px")
             )))
    
    
  )
  
  
)

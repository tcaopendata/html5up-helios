library(shiny)
library(shinydashboard)
library(plotly)
library(rsconnect)
library(ggplot2)
library(shinythemes)
getwd()
facebook<-read.csv("data/PO文類型.csv",head = TRUE, fileEncoding = 'big5')
race<-read.csv("data/比賽項目.csv",head=TRUE, fileEncoding = 'big5')
assessment <- read.csv("data/assessment.csv",head=TRUE, fileEncoding = 'big5')
race$date=as.Date(paste0(race$年, "-", race$月, "-", race$日))
facebook$date=as.Date(paste0(facebook$年, "-", facebook$月, "-", facebook$日))


shinyUI(
  fluidPage(
　



    
    fluidRow(
      column(width = 12,
             box(
               title = "世大運綜合聲量折線圖",
               status = "primary",
               width = 12,
               solidHeader = FALSE,
               collapsible = TRUE,
               selectInput("category_all","項目:",c("",unique(as.character(facebook$大分)))),
               plotlyOutput("race_line_all",height = "450px")))),
    fluidRow(
      column(width=12,
             box(
               title = "PO文類別長條圖",
               status="primary",
               width = 12,
               solidHeader=FALSE,
               collapsible=TRUE,
               plotlyOutput("count",height="450px")
             )))


    
  )
  
  
)

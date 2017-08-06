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

sport <-read.csv("data/運動.csv",header = TRUE,fileEncoding = 'big5')
recommend <-read.csv("data/一般推廣.csv",header = TRUE,fileEncoding = 'big5')
a <-read.csv("data/a.csv",header = TRUE,fileEncoding = 'big5')
b <-read.csv("data/抽獎.csv",header = TRUE,fileEncoding = 'big5')
c <-read.csv("data/活動.csv",header = TRUE,fileEncoding = 'big5')
d <-read.csv("data/英文.csv",header = TRUE,fileEncoding = 'big5')
e <-read.csv("data/倒數.csv",header = TRUE,fileEncoding = 'big5')
f <-read.csv("data/售票.csv",header = TRUE,fileEncoding = 'big5')
g <-read.csv("data/開幕.csv",header = TRUE,fileEncoding = 'big5')
h <-read.csv("data/廣告贊助.csv",header = TRUE,fileEncoding = 'big5')
sport$date=as.Date(paste0(sport$year, "-", sport$月, "-", sport$日))
recommend$date=as.Date(paste0(recommend$year, "-", recommend$月, "-", recommend$日))
a$date=as.Date(paste0(a$year, "-", a$月, "-", a$日))
b$date=as.Date(paste0(b$year, "-", b$月, "-", b$日))
c$date=as.Date(paste0(c$year, "-", c$月, "-", c$日))
d$date=as.Date(paste0(d$year, "-", d$月, "-", d$日))
e$date=as.Date(paste0(e$year, "-", e$月, "-", e$日))
f$date=as.Date(paste0(f$year, "-", f$月, "-", f$日))
g$date=as.Date(paste0(g$year, "-", g$月, "-", g$日))
h$date=as.Date(paste0(h$year, "-", h$月, "-", h$日))






shinyUI(
  fluidPage(

    fluidRow(
      column(width=12,
             box(
               title = "各類型正負評",
               status="primary",
               width = 12,
               solidHeader=FALSE,
               collapsible=TRUE,
               plotlyOutput("assessment_count",height="450px")
             ))),
    fluidRow(
      column(width=12,
             box(
               title = "各類別佔負評比率",
               status="primary",
               width = 12,
               solidHeader=FALSE,
               collapsible=TRUE,
               plotlyOutput("pie",height="450px")
             ))),
    
    
    fluidRow(
      column(width=12,
             box(
               title = "各時間負評數",
               status="primary",
               width = 12,
               solidHeader=FALSE,
               collapsible=TRUE,
               plotlyOutput("count2",height="450px")
             )))

 
    )
         
      
      
    )
    
    
    
 
 
    


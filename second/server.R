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



shinyServer(function(input,output){
  
  
  
  
  output$assessment_count <- renderPlotly({
    
    plot_ly(assessment, x = ~分類, y = ~是否有負評, type = 'bar', name='負評')%>%
      add_trace(y= ~是否有正評, name='正評')%>%
      layout(yaxis = list(title = 'assessment'), barmode = 'stack')
    
  })
  output$count2 <- renderPlotly({
    
    plot_ly(x =a$date, y =a$negative, mode='lines+markers', type = 'scatter')%>%
      layout(xaxis = list(title = "時間軸"),
             yaxis = list (title = "負評數")) %>%
      add_trace(x=sport$date,y =sport$negative,name='運動') %>%
      add_trace(x=recommend$date,y =recommend$negative,name='一般推廣')%>%
      add_trace(x=b$date, y=b$negative,name='抽獎')%>%
      add_trace(x=c$date, y=c$negative,name='活動')%>%
      add_trace(x=d$date, y=d$negative,name='英文')%>%
      add_trace(x=e$date, y=e$negative,name='倒數')%>%
      add_trace(x=f$date, y=f$negative,name='售票')%>%
      add_trace(x=g$date, y=g$negative,name='開幕')%>%
      add_trace(x=h$date, y=h$negative,name='廣告贊助')
    
  })
  
  output$pie <- renderPlotly({
    
    plot_ly(labels = facebook$分類1, values = facebook$負評, type = 'pie',textposition = 'inside',
            textinfo = 'label+percent')%>%
      layout(xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
  })
  
  
  

  


  
  
  
  
  
  
})

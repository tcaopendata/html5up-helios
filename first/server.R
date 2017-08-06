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


 
  
  output$race_line_all<-renderPlotly({
    a<-subset(facebook,大分==input$category_all)
    
    plot_ly(a,x=~date,y=~likes_count_fb,type='scatter',mode="lines",name="按讚數")%>%
      add_trace(a,x=~date,y=~comments_count_fb,type='scatter',mode="lines",name="留言數")
  })
  output$count <- renderPlotly({
    
    p <- plot_ly(facebook, x = ~分類, y = ~likes_count_fb, type='bar', name='Facebook按讚數')%>%
      add_trace(y= ~comments_count_fb, name='Facebook留言數')%>%
      add_trace(y= ~shares_count_fb, name='Facebook分享數')%>%
      layout(yaxis = list(title='count'),barmode = 'group')
    
    
  })
  
  

  

  
})


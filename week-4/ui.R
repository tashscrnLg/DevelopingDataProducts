library(shiny)

shinyUI(fluidPage(
      titlePanel("Technical Analysis of Stocks"),
      sidebarLayout(
            sidebarPanel(
                  helpText("Input a valid stock symbol: Example Microsoft (MSFT). 
                           Select a date range to plot the stock prices"),
                  helpText("Information source is from yahoo finance."),
                  
                  textInput("symb", "Enter Symbol", "MSFT"),
                  
                  dateRangeInput("dates", 
                                 "Date range",
                                 start = Sys.Date()-365, 
                                 end = Sys.Date()
                                 ),
                  br(),
                  br(),
                  
                  p(strong("Technical Indicators")),
                  helpText("Technical Indicators are used as guides in trading stocks"),
                  checkboxInput("sma", label = "Simple Moving Average", value = FALSE),
                  checkboxInput("ema", label = "Exponential Moving Average", 
                                value = FALSE),
                  checkboxInput("rsi", label = "Relative Strength Indicator", 
                                value = FALSE),
                  checkboxInput("bb", label = "Bollinger Bands", 
                                value = FALSE),
                  checkboxInput("obv", label = "On Balance Volume", 
                                value = FALSE),
                  br()
                  
                  
                  ),
                
            mainPanel(tabsetPanel(type = "tabs", 
                                  tabPanel("Plot Stock Prices", plotOutput("plot1")),  
                                  tabPanel("Stock Returns", plotOutput("plot2"))
            ))
      )))
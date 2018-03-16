library(quantmod)

shinyServer(function(input, output) {

      
      output$plot1 <- renderPlot({
            data <- getSymbols(input$symb, src = "yahoo", 
                               from = input$dates[1],
                               to = input$dates[2],
                               auto.assign = FALSE)
            colnames(data)<- c("Open","High","Low", "Close","Volume", "Adjusted")
            
            ta ="addVo()" # Default
            if(input$sma) ta <- paste(ta,"addSMA()",sep=";")
            if(input$ema) ta <- paste(ta,"addEMA()",sep=";")
            if(input$rsi)  ta <- paste(ta,"addRSI()",sep=";")
            if(input$bb)  ta <- paste(ta,"addBBands()",sep=";")
            if(input$obv)  ta <- paste(ta,"addOBV()",sep=";")
            chartSeries(data,name=input$symb, TA=ta)
            
      })
      
      output$plot2 <- renderPlot({
            data <- getSymbols(input$symb, src = "yahoo", 
                               from = input$dates[1],
                               to = input$dates[2],
                               auto.assign = FALSE)
            
            colnames(data)<- c("Open","High","Low", "Close","Volume", "Adjusted")
            # Compute log Returns 
            dataReturns <- diff(log(data$Adjusted))
            main <- paste(input$symb, "Stock Returns", sep= " ")
            plot(dataReturns, main=main)
           
            
      })
      
})
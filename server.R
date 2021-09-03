library(shiny)
library(datasets)

data(mtcars)
shinyServer(function(input,output){
    model1 <- lm(mpg ~ hp, data = mtcars)
    model2 <- lm(mpg ~ wt, data = mtcars)
    model3 <- lm(mpg ~ hp+wt, data = mtcars)
    
    model1pred <- reactive({
        hpInput <- input$sliderHP
        predict(model1, newdata = data.frame(hp = hpInput))
    })
    
    model2pred <- reactive({
        WtInput <- input$sliderWt
        predict(model2, newdata = 
                    data.frame(wt = WtInput))
    })
    
    model3pred <- reactive({
        hpInput <- input$sliderHP
        WtInput <- input$sliderWt
        predict(model3, newdata = 
                    data.frame(hp = hpInput,
                               wt = WtInput))
    })
    
    output$plot1 <- renderPlot({
        hpInput <- input$sliderHP
        
        plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",
             ylab = "Miles Per Gallon",
             pch = 16)
        abline(model1, col = "red", lwd = 2)
    })
    
    output$plot2 <- renderPlot({
        WtInput <- input$sliderWt
        
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight (in 1000 pounds)",
             ylab = "Miles Per Gallon",
             pch = 16)
        abline(model2, col = "blue", lwd = 2)
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    output$pred2 <- renderText({
        model2pred()
    })
    
    output$pred3 <- renderText({
        model3pred()
    })
 
})
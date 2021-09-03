library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Miles Per Gallon from Horsepower and Weight"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderHP", "What is the horsepower of the car?", 52, 335, value = 123),
            sliderInput("sliderWt", "What is the weight (in 1000 ponuds) of the car?", 1.513, 5.424, value = 3.325),
            submitButton("Submit")
        ),
        mainPanel(
            h4("Please select horsepower or weight or both to predict MPG."),
            h4("Once you have selected, please click submit button."),
            h4("The predicted miles per gallons from your seleced parameters are shown in the textboxes below the graphs."),
            plotOutput("plot1"),
            plotOutput("plot2"),
            h4("Predicted Miles Per Gallon from Horsepower:"),
            textOutput("pred1"),
            h4("Predicted Miles Per Gallon from Weight:"),
            textOutput("pred2"),
            h4("Predicted Miles Per Gallon from Horsepower and Weight:"),
            textOutput("pred3")
        )
    )
))

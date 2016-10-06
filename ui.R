library(markdown)

ui <- fluidPage(
        # Application title
        titlePanel("Data Science Capstone Project - Next Word Prediction App"),
        
        # User interface controls
        sidebarLayout(
                sidebarPanel(
                        p("Input a word or phrase then press 'ENTER' or click 'Predict' to see the next word(s):"),	
                        textInput(inputId="text", label = ""),
                        submitButton("Predict"),
                        HTML('<script type="text/javascript"> 
                             document.getElementById("text").focus();
                             </script>')
                        ),
                
                mainPanel(
                        tabsetPanel(
                                
                                tabPanel("Result", 
                                         conditionalPanel(condition = "input.text != ''",
                                                          verbatimTextOutput("text"),
                                                          verbatimTextOutput("cleaned"), verbatimTextOutput("msg"),
                                                          selectInput("predicts","Word predictions:",choices=c(""))
                                         )
                                )
                        )
                )
                        ),
        
        fluidRow(HTML("<div style='margin-left:18px;margin-bottom:12px;color:navy;'><strong>Creation date: October 2016</strong></div>") )
        )

source("functions.R")

server <- function(input, output, session) {
        
        output$text <- renderText({
                paste("Input text is:", input$text)
        })
        
        observe({
                iniTime <- Sys.time()
                
                textCleansed <- clean(input$text)
                if(textCleansed != " ") 
                {
                        output$cleaned <- renderText({
                                paste0("Cleaned text: ",textCleansed)
                        })
                        
                        textCleansed <- gsub(" \\* "," ",textCleansed)    # not taking account of profanity terms
                        predictWords <- predict_model(textCleansed)
                        updateSelectInput(session = session, inputId = "predicts", choices = predictWords)
                        
                        endTime <- Sys.time()
                        output$msg <- renderText({
                                paste(msg, "\n", sprintf("- Processing Time = %6.3f msecs",1000*(endTime-iniTime)))
                        })
                        gc()
                }  
        })
}
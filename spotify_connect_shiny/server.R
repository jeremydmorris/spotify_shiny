#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(spotifyconnect)
library(tidyverse)

pp <- src_postgres(
    host='postgres_db',
    port=5432,
    user='postgres',
    password='docker',
    dbname='spotifyconnect'
)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$query_code <- renderText({
        qq <- getQueryString()
        my_code <- qq[['code']]
        if( is.null(my_code) ){
            my_code <- 'NOT DONE YET'
        }else{
            user_info <- spotifyconnect::register_user(my_code)
        }
        paste("Your code:\n", my_code,'\n',user_info$username)
    })

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})

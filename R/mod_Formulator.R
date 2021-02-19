#' Formulator UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Formulator_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        column(width = 4,
          shinydashboard::box(sliderInput(ns("v_cement"), label = "Cement (kg)", min = 100, max = 550, value = 275))
        ),
        column(width = 4,
          shinydashboard::box(textOutput(ns("concrete_prediction")))
        )
      )
    )
  )
}
    
#' Formulator Server Function
#'
#' @noRd 
mod_Formulator_server <- function(input, output, session){
  ns <- session$ns
  
  output$concrete_prediction <- renderText({
    paste("You chose:", input$v_cement)
  })
}
    
## To be copied in the UI
# mod_Formulator_ui("Formulator_ui_1")
    
## To be copied in the server
# callModule(mod_Formulator_server, "Formulator_ui_1")
 

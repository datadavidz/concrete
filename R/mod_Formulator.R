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
          shinydashboard::box(
            sliderInput(ns("v_cement"), label = "Cement (kg)", min = 100, max = 550, value = 275),
            sliderInput(ns("v_blast_furnace_slag"), label = "Blast Furnace Slag (kg)", min = 0, max = 375, value = 20),
            sliderInput(ns("v_fly_ash"), label = "Fly Ash (kg)", min = 0, max = 200, value = 0),
            sliderInput(ns("v_water"), label = "Water (kg)", min = 100, max = 250, value = 185),
            sliderInput(ns("v_superplasticizer"), label = "Super-plasticizer (kg)", min = 0, max = 35, value = 5),
            sliderInput(ns("v_coarse_aggregate"), label = "Coarse Aggregate (kg)", min = 800, max = 1150, value = 975),
            sliderInput(ns("v_fine_aggregate"), label = "Fine Aggregate (kg)", min = 575, max = 1000, value = 775),
            sliderInput(ns("v_age"), label = "Age (days)", min = 1, max = 365, value = 28)
          )
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
    
    prediction <- predict(
      model,
      tibble::tibble("cement" = input$v_cement,
             "blast_furnace_slag" = input$v_blast_furnace_slag,
             "fly_ash" = input$v_fly_ash,
             "water" = input$v_water,
             "superplasticizer" = input$v_superplasticizer,
             "coarse_aggregate" = input$v_coarse_aggregate,
             "fine_aggregate" = input$v_fine_aggregate,
             "age" = input$v_age
      )
    )
    
    paste("You chose:", round(prediction$.pred, 1), "MPa")
  })
}
    
## To be copied in the UI
# mod_Formulator_ui("Formulator_ui_1")
    
## To be copied in the server
# callModule(mod_Formulator_server, "Formulator_ui_1")
 

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
 
  )
}
    
#' Formulator Server Function
#'
#' @noRd 
mod_Formulator_server <- function(input, output, session){
  ns <- session$ns
 
}
    
## To be copied in the UI
# mod_Formulator_ui("Formulator_ui_1")
    
## To be copied in the server
# callModule(mod_Formulator_server, "Formulator_ui_1")
 

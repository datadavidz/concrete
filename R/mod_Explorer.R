#' Explorer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Explorer_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("concrete"),
    verbatimTextOutput(ns("formula"))
  )
}
    
#' Explorer Server Function
#'
#' @noRd 
mod_Explorer_server <- function(input, output, session, formulation){
  ns <- session$ns
  
  output$formula <- renderText({
    #paste(c("Cement:", formulation()$cement))
    glue::glue("Cement: {formulation()$cement} kg
                Blast Furnace Slag: {formulation()$blast_furnace_slag} kg
                Fly Ash: {formulation()$fly_ash} kg
                Water: {formulation()$water} kg
                Superplasticizer: {formulation()$superplasticizer} kg
                Coarse Aggregate: {formulation()$coarse_aggregate} kg
                Fine Aggregate: {formulation()$fine_aggregate} kg
                Age: {formulation()$age} days")
  })
  
}
    
## To be copied in the UI
# mod_Explorer_ui("Explorer_ui_1")
    
## To be copied in the server
# callModule(mod_Explorer_server, "Explorer_ui_1")
 

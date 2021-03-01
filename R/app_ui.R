#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "[concrete]"),
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          shinydashboard::menuItem(
            "Formulator",
            tabName = "formulator_tab",
            icon = icon("cog")
          ),
          shinydashboard::menuItem(
            "Explorer",
            tabName = "explorer_tab"
          )
        )
      ),
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          shinydashboard::tabItem(
            tabName = "formulator_tab",
            mod_Formulator_ui("Formulator_ui_1")
          ),
          shinydashboard::tabItem(
            tabName = "explorer_tab",
            mod_Explorer_ui("Explorer_ui_1")
          )
        )
      )
      
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'concrete'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}


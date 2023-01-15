library(shinydashboard)

# shinydashboard UI
ui_db <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    collapsed=FALSE,
    sidebarMenu(
      menuItem("Home", tabName = "my_name"),
      menuItem("Reports", tabName = "report_hub")
    )
  ),
  dashboardBody(
    fluidRow(
      valueBoxOutput("BoxDown", width = 4),
      valueBoxOutput("BoxUp", width = 4)
    )
  )
)

# server
server <- function(input, output) {
  output$BoxUp <- renderValueBox({
    valueBox(
      value = 100,
      subtitle = "Upregulated",
      icon = icon("arrow-up"),
      color = "red"
    )
  })
  
  output$BoxDown <- renderValueBox({
    valueBox(
      value = 50,
      subtitle = "Downregulated",
      icon = icon("arrow-down"),
      color = "olive"
    )
  })
}


# Run the shinydashboard app
shinyApp(ui_db, server)
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(readr)
library(stringr)
boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2020/2020-05-26/boston_cocktails.csv') |>
  mutate(ingredient = str_to_title(ingredient))

ingredient_list <- boston_cocktails$ingredient |> 
  unique() |>
  sort()
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("ingredient",
                        "Choose",
                        ingredient_list, 
                        multiple = T)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           tableOutput("drinks")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$drinks <- renderTable({
      print(input$ingredient)
      join1<- boston_cocktails |>
        filter(ingredient %in% input$ingredient) 
      join2 <- boston_cocktails %>%
        filter(name %in% join1$name)
      join2
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

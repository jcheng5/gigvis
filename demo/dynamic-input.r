library(gigvis)
library(shiny)

# Basic scatter plot
p <- gigvis(function() { head(mtcars, input$rows) },
            aes(x = "wt", y = "mpg"),
            mark_point()
)
view_dynamic(p, controls=numericInput('rows', 'Rows', 5))

require(shiny)
shinyUI(ui = bootstrapPage(
    title = 'Search Result Input Binding',
    tags$head(
        tags$script(type = 'text/javascript', src = 'multiActionInputBinding.js')
    ),
    uiOutput('multiActionExample'),
    uiOutput('msg')
))
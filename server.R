require(shiny)
source('multiAction.R')
shinyServer(function(input, output, session) {
    observeEvent(input$lgMultiActionExample, {
        output$lgMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$lgMultiActionExample, ']'
            ))
        })
    })
    observeEvent(input$monitor1, {
        output$monitorMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$monitor1, '] of actions watched by monitor 1'
            ))
        })
    })
    observeEvent(input$monitor2, {
        output$monitorMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$monitor2, '] of actions watched by monitor 2'
            ))
        })
    })
})
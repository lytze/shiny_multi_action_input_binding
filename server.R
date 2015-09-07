require(shiny)
source('multiAction.R')
shinyServer(function(input, output, session) {
    observeEvent(input$lgMultiActionExample, {
        output$lgMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$lgMultiActionExample$val, ']'
            ))
        })
        cat(paste('You Selected: [', input$lgMultiActionExample$val, ']\n'))
    })
    observeEvent(input$monitor1, {
        output$monitorMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$monitor1$val, '] of actions watched by monitor 1'
            ))
        })
        cat(paste('You Selected: [', input$monitor1$val, '] of actions watched by monitor 1\n'))
    })
    observeEvent(input$monitor2, {
        output$monitorMultiActionMsg <- renderUI({
            helpText(paste(
                'You Selected: [', input$monitor2$val, '] of actions watched by monitor 2'
            ))
        })
        cat(paste('You Selected: [', input$monitor2$val, '] of actions watched by monitor 2\n'))
    })
    observeEvent(input$lgMultiActionReset, {
        resetMultiAction(session, 'lgMultiActionExample')
    })
    observeEvent(input$lgMultiActionSet, {
        setMultiAction(session, 'lgMultiActionExample', input$lgMultiActionSetValue)
    })
    observeEvent(input$mnt1Reset, {
        resetMultiAction(session, 'monitor1')
    })
    observeEvent(input$mnt1Set, {
        setMultiAction(session, 'monitor1', input$mntSetValue)
    })
    observeEvent(input$mnt2Reset, {
        resetMultiAction(session, 'monitor2')
    })
    observeEvent(input$mnt2Set, {
        setMultiAction(session, 'monitor2', input$mntSetValue)
    })
})
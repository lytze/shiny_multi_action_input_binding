require(shiny)
shinyServer(function(input, output, session) {
    output$multiActionExample <- renderUI({
        div(
            id = 'multiActions',
            class = 'multi-action',
            uiOutput('item_1'),
            uiOutput('item_2'),
            uiOutput('item_3'),
            uiOutput('item_4'),
            uiOutput('item_5'),
            uiOutput('item_6'),
            uiOutput('item_7'),
            uiOutput('item_8'),
            uiOutput('item_9'),
            uiOutput('item_10')
        )
    })
    output_id <- paste('item_', 1:10, sep = '')
    for (i in 1:10) {
        local({
            i <- i
            output[[output_id[i]]] <- renderUI({
                actionLink(paste(output_id[i], 'Action', sep = ''),
                           paste('Action Link No.', i),
                           class = 'multi-action-item', which = i)
            })
        })
    }
    observeEvent(input$multiActions, {
        print(input$multiActions)
        output$msg <- renderUI({
            helpText(paste('You clicked action link No.', input$multiActions))
        })
    })
})
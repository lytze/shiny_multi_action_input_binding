require(shiny)
shinyServer(function(input, output, session) {
    output$multiActionExample <- renderUI({
        tags$ul(
            id = 'multiActions',
            class = 'multi-action list-group',
            style = 'width: 50%; text-align: center; margin: 50px;',
            tags$li(class = 'list-group-item', uiOutput('item_1')),
            tags$li(class = 'list-group-item', uiOutput('item_2')),
            tags$li(class = 'list-group-item', uiOutput('item_3')),
            tags$li(class = 'list-group-item', uiOutput('item_4')),
            tags$li(class = 'list-group-item', uiOutput('item_5')),
            tags$li(class = 'list-group-item', uiOutput('item_6')),
            tags$li(class = 'list-group-item', uiOutput('item_7')),
            tags$li(class = 'list-group-item', uiOutput('item_8')),
            tags$li(class = 'list-group-item', uiOutput('item_9')),
            tags$li(class = 'list-group-item', uiOutput('item_10'))
        )
    })
    output_id <- paste('item_', 1:10, sep = '')
    for (i in 1:10) {
        local({
            i <- i
            output[[output_id[i]]] <- renderUI({
                actionLink(paste(output_id[i], 'Action', sep = ''),
                           paste('Action Link No.', i),
                           class = 'multi-action-item')
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
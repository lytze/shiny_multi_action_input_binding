require(shiny)
source('multiAction.R')
shinyUI(ui = fluidPage(
    title = 'Search Result Input Binding',
    tags$head(
        tags$script(type = 'text/javascript', src = 'multiActionInputBinding.js')
    ),
    fluidRow(
        h4('Example For', tags$code('listGroupMultiAction()')),
        column(
            width = 6,
            wellPanel(
                listGroupMultiAction(
                    id = 'lgMultiActionExample',
                    label = 'List Group Multi Action Example',
                    items = c('Home', 'My Page', 'Settings', 'Logout'),
                    values = c('home', 'mypage', 'settings', 'logout')
                )
            )
        ),
        column(
            width = 6,
            uiOutput('lgMultiActionMsg'),
            actionButton('lgMultiActionReset', 'Reset Value'),
            textInput('lgMultiActionSetValue', ''),
            actionButton('lgMultiActionSet', 'Set Value')
        )
    ),
    fluidRow(
        h4('Example For', tags$code('setMultiActionMonitor()')),
        column(
            width = 6,
            wellPanel(
                setMultiActionMonitor('monitor1'),
                setMultiActionMonitor('monitor2', default = 'home'),
                tags$label('Actions for monitor 1', `for` = 'm1Actions'),
                br(),
                tags$ul(
                    id = 'm1Actions',
                    class = 'pagination',
                    tags$li(tags$a(
                        href = '#',
                        class = 'multi-action-global-item fa fa-angle-double-left',
                        which = 'leftmost',
                        watch = 'monitor1'
                    )),
                    tags$li(tags$a(
                        href = '#',
                        class = 'multi-action-global-item fa fa-angle-left',
                        which = 'left',
                        watch = 'monitor1'
                    )),
                    lapply(1:5, function(pg) {
                        tags$li(
                            tags$a(pg, href = '#',
                                   class = 'multi-action-global-item',
                                   which = pg,
                                   watch = 'monitor1')
                        )
                    }),
                    tags$li(tags$a(
                        href = '#',
                        class = 'multi-action-global-item fa fa-angle-right',
                        which = 'right',
                        watch = 'monitor1'
                    )),
                    tags$li(tags$a(
                        href = '#',
                        class = 'multi-action-global-item fa fa-angle-double-right',
                        which = 'rightmost',
                        watch = 'monitor1'
                    ))
                ),
                br(),
                tags$label('Actions for monitor 2', `for` = 'm2Actions'),
                br(),
                div(
                    id = 'm2Actions',
                    class = 'btn-group',
                    tags$button(
                        type = 'button', class = 'btn btn-default multi-action-global-item',
                        watch = 'monitor2', which = 'home',
                        icon('home'), 'Home'
                    ),
                    tags$button(
                        type = 'button', class = 'btn btn-default multi-action-global-item',
                        watch = 'monitor2', which = 'settings',
                        icon('cog'), 'Settings'
                    ),
                    div(
                        class = 'btn-group',
                        tags$button(
                            type = 'button', class = 'btn btn-default dropdown-toggle',
                            `data-toggle` = 'dropdown',
                            icon('user'), 'My', icon('caret-down')
                        ),
                        tags$ul(
                            class = 'dropdown-menu',
                            tags$li(
                                tags$a(icon('edit'), 'Profile', href = '#',
                                       watch = 'monitor2', which = 'profile',
                                       class = 'multi-action-global-item')
                            ),
                            tags$li(
                                tags$a(icon('file'), 'Files', href = '#',
                                       watch = 'monitor2', which = 'files',
                                       class = 'multi-action-global-item')
                            ),
                            tags$li(
                                tags$a(icon('power-off'), 'Logout', href = '#',
                                       watch = 'monitor2', which = 'logout',
                                       class = 'multi-action-global-item')
                            )
                        )
                    )
                ),
                br(),br(),
                helpText('This buttom is Still Wathched by Monitor 2'),
                tags$button(
                    id = 'aloneButton',
                    type = 'button', class = 'btn btn-default multi-action-global-item',
                    watch = 'monitor2', which = 'lonely-button', 
                    'Button Alone'
                )
            )
        ),
        column(
            width = 6,
            uiOutput('monitorMultiActionMsg'),
            actionButton('mnt1Reset', 'Reset Value of Monotor 1'),
            actionButton('mnt2Reset', 'Reset Value of Monotor 2'),
            textInput('mntSetValue', ''),
            actionButton('mnt1Set', 'Set Value of Monotor 1'),
            actionButton('mnt2Set', 'Set Value of Monotor 2')
        )
    )
))
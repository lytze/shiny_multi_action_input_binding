## Input Elements
listGroupMultiAction <- function(id, label = '', class_outer = '',
                                 items, values = NULL, ...) {
    if (is.null(values)) {
        values <- 1:length(items)
    } else if (length(values) != length(items)) {
        stop('items and values should have the same length')
    }
    div(
        class = paste('multi-action', class_outer),
        ...,
        id = id,
        if (label != '') {
            tags$label(label, `for` = id)
        } else NULL,
        tags$ul(
            class = 'list-group',
            mapply(FUN = function(item, value) {
                tags$a(
                    class = 'multi-action-item list-group-item',
                    which = value, watch = id,
                    item
                )
            }, item = items, value = values, SIMPLIFY = F)
        )
    )
}
setMultiActionMonitor <- function(id, default = NULL) {
    div(id = id, style = 'display: none;', class = 'multi-action', which = default)
}

## Util Functions
resetMultiAction <- function(session, inputId) {
    session$sendInputMessage(inputId, NULL)
}
setMultiAction <- function(session, inputId, value) {
    session$sendInputMessage(inputId, value)
}
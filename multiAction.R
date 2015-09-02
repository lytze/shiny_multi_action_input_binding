listGroupMultiAction <- function(id, label = '', class_outer = '',
                                 items, values = NULL, ...) {
    if (is.null(values)) {
        values <- 1:length(items)
    } else if (length(values) != length(items)) {
        stop('items and values should have the same length')
    }
    div(
        class = paste('multi-action-local', class_outer),
        ...,
        id = id,
        if (label != '') {
            tags$label(label, `for` = id)
        } else NULL,
        tags$ul(
            class = 'list-group',
            mapply(FUN = function(item, value) {
                tags$a(
                    class = 'multi-action-local-item list-group-item',
                    which = value,
                    item
                )
            }, item = items, value = values, SIMPLIFY = F)
        )
    )
}

setMultiActionMonitor <- function(id) {
    div(id = id, style = 'display: none;', class = 'multi-action-global')
}
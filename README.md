MultiActionInput implementation (R Shiny)
=========================================

### Introduction

MultiAction is a custom input binding in Shiny, which will listen to a group of actions and send values to one reactive `input$` object on the server side. This will be useful if you really get tired by writing comlicated observers listening to action button/links.  
Observers native in `shiny` are designed for listening single action. If you bind reactivities of a group of actions to one observer, the null values are trouble causing, triggering observer fire when one of the listened action button/link are rendered as reactive UI. This implementation is designed mainly to deal with such condition, dodging the problem of server side reactiveness by creating new input binding.

### Usage

#### Preparation

1. Copy the jQuery file into the `www/` directory in your application directory.
2. In your `ui.R`, add following lines into your ui page.

```R
tags$head(
    tags$script(type = 'text/javascript', src = 'multiActionInputBinding.js')
)
```

#### `listGroupMultiAction()`

This function will generate a bootstrap list group with each element in the list an action bind to the input object.

Arguments:

1. `id` is the inputId as all other input objects have, so that you can use `input$theIdYouUsed` to extract value or bind reactiveness
2. `label`
3. `class_outer` is the additional class attribute to the outer `<ul>` tag
4. `items` is a list/vector of ui objects, which will be written in the `<a class="list-group-item"></a>` tags. It's okay to have only text vector passed
5. `values` is a vector of the returned values when the corresponding items are clicked. Default value `NULL` meand the values are indeces of `items` (seq along)
6. `...` are other attributes

#### `setMultiActionMonitor()`

This function will output an hidden HTML div element serve as an moniter for a group of actions. You should set the monitor and use the id field to tell other HTML elements they are inspected by this monitor.

The only argument is `id`, which serves 2 functions. First this id is the reactive input object id, so you can `input$theIdYouUsed` to get the value or bind reactiveness. Meanwhile, if you add `class="multi-action-item" which="returnedValue" watch="theIdYouUsed"` to any HTML element, the element will be watched by the monitor and return value to the reactive input object upon click.

#### Visit the value

`input$yourMultiActionObj` is a list of 2 elements. The `cnt` element act as normal anctionButtom/Link object, and `input$yourMultiActionObj$val` renders the activated action.

#### `(re)setMultiAction()`

These functions allow you to reset/set the multi action object you registered. The shiny server's `session` object is required as one argument of these function. The `cnt` element will be set back to 0 after evaluation.

### Example

Clone the repo can run the shiny-app for examples

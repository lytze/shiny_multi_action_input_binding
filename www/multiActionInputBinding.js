jQuery(function($) {
    $(document).on("click", ".multi-action-item", function(evt) {
        var el = $(evt.target);
        var outer = $(".multi-action").has(el);
        // Change the which attr of the outer div
        outer.attr("which", $("li").has(el).index() + 1);
        // Raise the change info
        outer.trigger("change");
    });
    
    var multiActionInputBinding = new Shiny.InputBinding();
    $.extend(multiActionInputBinding, {
        find: function(scope) {
            return $(scope).find(".multi-action");
        },
        getValue: function(el) {
            return $(el).attr("which");
        },
        subscribe: function(el, callback) {
            $(el).on("change.multiActionInputBinding", function(e) {
                callback();
            });
        },
        unsubscribe: function(el) {
            $(el).off(".multiActionInputBinding");
        }
    });
    Shiny.inputBindings.register(multiActionInputBinding);
});
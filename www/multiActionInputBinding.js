jQuery(function($) {
    
    var multiActionLocalInputBinding = new Shiny.InputBinding();
    $(document).on("click", ".multi-action-local-item", function(evt) {
        var el = $(evt.target);
        var outer = $(".multi-action-local").has(el);
        // Change the which attr of the outer div
        outer.attr("which", el.attr("which"));
        // Raise the change info
        outer.trigger("change");
    });
    $.extend(multiActionLocalInputBinding, {
        find: function(scope) {
            return $(scope).find(".multi-action-local");
        },
        getValue: function(el) {
            return $(el).attr("which");
        },
        subscribe: function(el, callback) {
            $(el).on("change.multiActionLocalInputBinding", function(e) {
                callback();
            });
        },
        unsubscribe: function(el) {
            $(el).off(".multiActionLocalInputBinding");
        }
    });
    Shiny.inputBindings.register(multiActionLocalInputBinding);
    
    var multiActionGlobalInputBinding = new Shiny.InputBinding();
    $(document).on("click", ".multi-action-global-item", function(evt) {
        var el = $(evt.target);
        var monitor_id = el.attr("watch");
        var outer = $("#" + monitor_id);
        // Change the which attr of the outer div
        outer.attr("which", el.attr("which"));
        // Raise the change info
        outer.trigger("change");
    });
    $.extend(multiActionGlobalInputBinding, {
        find: function(scope) {
            return $(scope).find(".multi-action-global");
        },
        getValue: function(el) {
            return $(el).attr("which");
        },
        subscribe: function(el, callback) {
            $(el).on("change.multiActionGlobalInputBinding", function(e) {
                callback();
            });
        },
        unsubscribe: function(el) {
            $(el).off(".multiActionGlobalInputBinding");
        }
    });
    Shiny.inputBindings.register(multiActionGlobalInputBinding);
    
});
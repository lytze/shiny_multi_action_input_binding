jQuery(function($) {
    
    var multiActionInputBinding = new Shiny.InputBinding();
    multiActionActivate = function(evt) {
        var el = $(evt.target);
        var monitor_id = el.attr("watch");
        var outer = $("#" + monitor_id);
        // Change the which attr of the outer div
        outer.data("cnt", outer.data("cnt") + 1 || 0);
        outer.data("val", el.attr("which"));
        // Raise the change info
        outer.trigger("change");
    };
    $(document).on("click", ".multi-action-item *", function() {
        $(".multi-action-item").has($(this)).trigger("click");
    });
    $(document).on("click", ".multi-action-item", function(evt) {
        multiActionActivate(evt);
    });
    $.extend(multiActionInputBinding, {
        find: function(scope) {
            return $(scope).find(".multi-action");
        },
        getValue: function(el) {
            return {
                "cnt":$(el).data("cnt"),
                "val":$(el).data("val"),
            };
        },
        subscribe: function(el, callback) {
            $(el).on("change.multiActionInputBinding", function(e) {
                callback();
            });
        },
        unsubscribe: function(el) {
            $(el).off(".multiActionInputBinding");
        },
        receiveMessage: function(el, msg) {
            if (msg === null) {
                if ($(el).data("default") === 'y') {
                    $(el).data("val", $(el).attr("data-val"));
                } else {
                    $(el).data("val", null);
                }
            } else {
                $(el).data("val", msg);
            }
            $(el).data("cnt", 0);
            $(el).trigger("change");
        }
    });
    Shiny.inputBindings.register(multiActionInputBinding);
    
    $(document).on("click", "a.multi-action-item", function(a) {
        a.preventDefault();
    });

});
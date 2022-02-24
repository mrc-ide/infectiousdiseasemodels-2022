$(function() {
    $(".collapsible").each(function() {
        $(this).on("click", function() {
            $(this).next().toggle();
        });
    });
});

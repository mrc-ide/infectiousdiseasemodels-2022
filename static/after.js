$(function() {
    $(".show-after").each(function(index) {
        var after = $(this).attr("data-after");
        if (new Date() < new Date(after)) {
            $(this).hide();
        }
    });
});

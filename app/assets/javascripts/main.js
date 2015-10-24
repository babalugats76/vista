$(document).on("page:change",function() {
    $('html').waitForImages({
        finished: function() {
            console.log("finished pre-loading images");
        },
        each: function() {
            console.log($(this).attr('src'));
        },
        waitForAll: true
    });
    $('.phone_us').mask('(000) 000-0000');
});

$(document).on("page:change", function() {
    $(".nav li").removeClass("active");
    $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});
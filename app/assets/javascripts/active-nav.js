$(document).on("page:change",function () {
   $(".nav li").removeClass("active");
   $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});
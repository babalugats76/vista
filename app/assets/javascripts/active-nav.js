$(document).on("page:change",function () {
   $(".nav li").removeClass("active");
   $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});

$(document).ready(function(){
  $('.phone_us').mask('(000) 000-0000');
});
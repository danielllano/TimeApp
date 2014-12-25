$("ul.navbar-nav > li").click(function(){
  $("ul.navbar-nav > li").removeClass('active')
  $(this).addClass('active');
});
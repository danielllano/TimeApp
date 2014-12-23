$('.navbar-nav').on('click', 'li', function(e) {
  $('li').removeClass('active');
  var $this = $(this);
  if (!$this.hasClass('active')) {
    $this.addClass('active');
  }
  e.preventDefault();
});
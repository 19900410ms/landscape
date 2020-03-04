$(window).load(function () {
  $('.profile-background').fadeIn();

  $('.log-in__box__close__btn').on('click', function(e){
    e.preventDefault();
    $('.sing-up-background').fadeOut();
  });
});
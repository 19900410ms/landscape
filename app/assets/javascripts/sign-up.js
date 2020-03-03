$(function() {
  $('.modal-show').on('click', function(e){
    e.preventDefault();
    $('.log-in-background').fadeIn();
  });

  $('.log-in__box__close__btn').on('click', function(e){
    e.preventDefault();
    $('.log-in-background').fadeOut();
  });
});
$(window).load(function () {
  $('.sing-up-background').fadeIn();

  $('.log-in__box__close__btn').on('click', function(e){
    e.preventDefault();
    $('.sing-up-background').fadeOut();
  });
});
// $(function() {
//   $('.sign-up-modal').on('click', function(e){
//     e.preventDefault();
//     $('.sing-up-background').fadeIn();
//   });

//   $('.log-in__box__close__btn').on('click', function(e){
//     e.preventDefault();
//     $('.sing-up-background').fadeOut();
//   });
// });
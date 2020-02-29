$(function() {
  var file_field = document.querySelector('input[type=file]')

  $("#img-file").change(function() {
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onload = function() {
      var src = fileReader.result
      var html = '<img src="${src}" width="120" height="80">'
      $(".post-spot__form__bottom__preview").after(html);
    }
    fileReader.readAsDataURL(file);
  });
});
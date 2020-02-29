$(function() {
  var file_field = document.querySelector('input[type=file]')

  $("#img-file").change(function() {
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html =  `<div class='preview-image' data-image="${file.name}">
                      <div class=' preview-image__box'>
                        <div class='preview-image__box__photo'>
                          <img src=${src}>
                        </div>
                      </div>
                      <div class='preview-image__controll'>
                        <div class='preview-image__controll__delete'>削除</div>
                      </div>
                    </div>`
      $(".image-inline").after(html);
    }
    fileReader.readAsDataURL(file);
  });
  $(document).on("click", '.preview-image__controll__delete', function(){
    var target_image = $(this).parent().parent()
    target_image.remove();
    file_field.val("")
  })
});

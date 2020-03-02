$(function(){

  function buildHTML(comment) {
    var html = `<div class="review-index">
                  <div class="review-index__icon">
                    <img src="${review.user.profile.icon.url}">
                  </div>
                  <div class="review-index__comment">
                    <div class="review-index__comment__name">${review.user_nickname}</div>
                    <div class="review-index__comment__text">${review.text}</div>
                  </div>
                </div>`
    return html;
  }
  

  $('.review-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.review').append(html);
      $('.review-form__text__input').val('');
      $('.review-form__btn').prop('disabled', false);
      $('.review').animate({ scrollTop: $('.review')[0].scrollHeight });
      return false;
    })
    .fail(function() {
      alert('error');
    })
  })
})
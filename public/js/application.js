$(document).ready(function() {
  $('.spinner').hide();
  $('#button').click(function(event){
    event.preventDefault();
    var data = {username: $('#username').val()};
    $('form').hide();
    $('.spinner').show();
    $.post('/get_username', data,function(response) {
      $('.spinner').hide();
      $('html').html(response);
    });
    
  });
});





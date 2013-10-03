//= require_tree .

$(document).ready(function() {

  var activeClass = function(obj){
    $('.active').removeClass();
    $(obj).addClass('active');
    console.log(obj)
  }

  $('.nav li a').click(function() {
    var page = $(this).attr('href');
    if(page!=='/index'){
      $('#home').hide();
      $('#content').empty();
      $('#content').load('/views'+page);
    }else{
      $('#content').empty();
      $('#home').show();
    };
    activeClass(this);
    return false;
  });

  // $('.photo img').mouseover(function() {
  //     $(this).empty();
  //     $(this).attr('src', 'images/Andrea.png');
  //     $(this).mouseleave(function() {
  //       $(this).attr('src', 'images/Andrea1.png');
  //     })
  // })
});
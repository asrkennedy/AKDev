//= require_tree .

$(document).ready(function() {

  var activeClass = function(obj){
    $('.active').removeClass();
    $(obj).addClass('active');
    console.log(obj)
  };

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


  $('body').on({
    mouseenter: function() {
    var image = $(this).attr("src").replace(".png", "_pink.png");
    $(this).attr('src', image);
    },
    mouseleave: function() {
      var image = $(this).attr("src").replace("_pink.png", ".png");
      $(this).attr('src', image);
    }
  },  '.icon');

});
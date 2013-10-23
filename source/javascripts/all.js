//= require_tree .

$(document).ready(function() {

  var colors = {
    about: '#E34043',
    projects: '#AA5FD2',
    skills: '#EB6C98',
    contact: '#73E0B8'
  }

  var activeClass = function(obj){
    $('.active').removeClass();
    $(obj).addClass('active');
  };

  $('.nav li a').click(function() {
    var page = $(this).attr('href');
    var colorName = page.substring(1)
    if(page!=='/index'){
      $('#home').hide();
      $('#content').empty();
      $('#content').load('/views'+page);
      $('body').css('background-color', colors[colorName]);
    }else{
      $('#content').empty();
      $('#home').show();
      $('body').css('background-color', '#0097DA');
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
// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

//1. Scroll to top arrow
// Scroll to top
var $block =$('<div/>',{'class':'top-scroll'}).append('<a href="#"/>').hide().appendTo('body').click(function () {
  $('body,html').animate({scrollTop: 0}, 800);
  return false;
});

//initialization
var $window = $(window);

if ($window.scrollTop() > 35) {showElem();}
else {hideElem();}

//handlers
$window.scroll(function () {
  if ($(this).scrollTop() > 35) {showElem();}
  else {hideElem();}
});

//functions
function hideElem(){
  $block.fadeOut();
}
function showElem(){
  $block.fadeIn();
}

//2. Mobile menu
//Init mobile menu
$('#navigation').mobileMenu({
  triggerMenu:'#navigation-toggle',
  subMenuTrigger: ".sub-nav-toggle",
  animationSpeed:500
});

//3. Search bar dropdown
//search bar
$("#search-sort").selectbox({
  onChange: function (val, inst) {

    $(inst.input[0]).children().each(function(item){
      $(this).removeAttr('selected');
    });
    $(inst.input[0]).find('[value="'+val+'"]').attr('selected','selected');
  }
});

//4. Login window pop up
//Login pop up
$('.login-window').click(function (e){
  e.preventDefault();
  $('.overlay').removeClass('close').addClass('open');
});

$('.overlay-close').click(function (e) {
  e.preventDefault();
  $('.overlay').removeClass('open').addClass('close');

  setTimeout(function(){
    $('.overlay').removeClass('close');
  }, 500);
});

//1. Rating scrore init
//Rating star
$('.score').raty({
  width:130,
  score: 5,
  path: '/images/rate/',
  starOff : 'star-off.svg',
  starOn  : 'star-on.svg'
});

//2. Swiper slider
//Media slider
//init employee sliders
var mySwiper = new Swiper('.swiper-container',{
  slidesPerView:4,
});

$('.swiper-slide-active').css({'marginLeft':'-1px'});

//Media switch
$('.list--photo').click(function (e){
  e.preventDefault();

  var mediaFilter = $(this).attr('data-filter');

  $('.swiper-slide').hide();
  $('.' + mediaFilter).show();

  $('.swiper-wrapper').css('transform','translate3d(0px, 0px, 0px)');
  mySwiper.params.slideClass = mediaFilter;

  mySwiper.reInit();
  $('.swiper-slide-active').css({'marginLeft':'-1px'});
});

$('.list--video').click(function (e){
  e.preventDefault();

  var mediaFilter = $(this).attr('data-filter');
  $('.swiper-slide').hide();
  $('.' + mediaFilter).show();

  $('.swiper-wrapper').css('transform','translate3d(0px, 0px, 0px)');
  mySwiper.params.slideClass = mediaFilter;

  mySwiper.reInit();
  $('.swiper-slide-active').css({'marginLeft':'-1px'});
});

//media swipe visible slide
//Onload detect

if ($(window).width() >760 & $(window).width() <  992  ){
  mySwiper.params.slidesPerView=2;
  mySwiper.resizeFix();
}

else
if ($(window).width() < 767 & $(window).width() > 481){
  mySwiper.params.slidesPerView=3;
  mySwiper.resizeFix();

} else

if ($(window).width() < 480 & $(window).width() > 361){
  mySwiper.params.slidesPerView=2;
  mySwiper.resizeFix();
} else
if ($(window).width() < 360){
  mySwiper.params.slidesPerView=1;
  mySwiper.resizeFix();
}

else{
  mySwiper.params.slidesPerView=4;
  mySwiper.resizeFix();
}

if ($('.swiper-container').width() > 900 ){
  mySwiper.params.slidesPerView=5;
  mySwiper.resizeFix();
}

//Resize detect
$(window).resize(function(){

  if ($(window).width() >760 & $(window).width() <  992  ){
    mySwiper.params.slidesPerView=2;
    mySwiper.reInit();
  }

  else
  if ($(window).width() < 767 & $(window).width() > 481){
    mySwiper.params.slidesPerView=3;
    mySwiper.reInit();

  } else
  if ($(window).width() < 480 & $(window).width() > 361){
    mySwiper.params.slidesPerView=2;
    mySwiper.reInit();
  } else
  if ($(window).width() < 360){
    mySwiper.params.slidesPerView=1;
    mySwiper.reInit();
  }

  else{
    mySwiper.params.slidesPerView=4;
    mySwiper.reInit();
  }


});

//3. Slider item pop up
//boolian var
var toggle = true;

//pop up video media element
$('.media-video .movie__media-item').magnificPopup({
  //disableOn: 700,
  type: 'iframe',
  mainClass: 'mfp-fade',
  removalDelay: 160,
  preloader: false,

  fixedContentPos: false,

  gallery: {
    enabled: true,
    preload: [0,1] // Will preload 0 - before current, and 1 after the current image
  },

  disableOn:function () {
    return toggle;
  }
});

//pop up photo media element
$('.media-photo .movie__media-item').magnificPopup({
  type: 'image',
  closeOnContentClick: true,
  mainClass: 'mfp-fade',
  image: {
    verticalFit: true
  },

  gallery: {
    enabled: true,
    navigateByImgClick: true,
    preload: [0,1] // Will preload 0 - before current, and 1 after the current image
  },

  disableOn:function () {
    return toggle;
  }

});

//detect if was move after click
$('.movie__media .swiper-slide').on('mousedown', function(e){
  toggle = true;
  $(this).on('mousemove', function testMove(){
    toggle = false;
  });
});

//4. Dropdown init
//select
$("#select-sort").selectbox({
  onChange: function (val, inst) {

    $(inst.input[0]).children().each(function(item){
      $(this).removeAttr('selected');
    });
    $(inst.input[0]).find('[value="'+val+'"]').attr('selected','selected');
  }

});

//5. Datepicker init

//6. Reply comment form
// button more comments
$('#hide-comments').hide();

$('.comment-more').click(function (e) {
  e.preventDefault();
  $('#hide-comments').slideDown(400);
  $(this).hide();
});

//reply comment function
$('.comment__reply').click( function (e) {
  e.preventDefault();

  $('.comment').find('.comment-form').remove();
  $(this).parent().append("<form id='comment-form' class='comment-form' method='post'><textarea class='comment-form__text' placeholder='Add you comment here'></textarea><label class='comment-form__info'>250 characters left</label><button type='submit' class='btn btn-md btn--danger comment-form__btn'>add comment</button></form>");
});

//7. Timetable active element
$('.time-select__item').click(function (){
  $('.time-select__item').removeClass('active');
  $(this).addClass('active');
});

//8. Toggle between cinemas timetable and map with location
//change map - ticket list
$('#map-switch').click(function(ev){
  ev.preventDefault();

  $('.time-select').slideToggle(500);
  $('.map').slideToggle(500);

  $('.show-map').toggle();
  $('.show-time').toggle();
  $(this).blur();
});

$(window).load(function () {
  $('.map').addClass('hide-map');
});

//9. Scroll down navigation function
//scroll down
$('.comment-link').click(function (ev) {
  ev.preventDefault();
  $('html, body').stop().animate({'scrollTop': $('.comment-wrapper').offset().top-90}, 900, 'swing');
});

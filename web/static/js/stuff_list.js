//1. Dropdown init
//select
$(".select__sort").selectbox({
  onChange: function (val, inst) {

    $(inst.input[0]).children().each(function(item){
      $(this).removeAttr('selected');
    });
    $(inst.input[0]).find('[value="'+val+'"]').attr('selected','selected');
  }

});


//2. Datepicker init

//3. Rating scrore init
//Rating star
$('.score').raty({
  width:130,
  score: 0,
  path: '/images/rate/',
  starOff : 'star-off.svg',
  starOn  : 'star-on.svg'
});

//4. Sorting by category
// sorting function
$('.tags__item').click(function (e) {
  //prevent the default behaviour of the link
  e.preventDefault();

  //active sorted item
  $('.tags__item').removeClass('item-active');
  $(this).addClass('item-active');

  var filter = $(this).attr('data-filter');

  //show all the list items(this is needed to get the hidden ones shown)
  $(".movie--preview").show();
  $('.pagination').show();

  /*using the :not attribute and the filter class in it we are selecting
  only the list items that don't have that class and hide them '*/
  if ( filter.toLowerCase()!=='all'){
    $('.movie--preview:not(.' + filter + ')').hide();
    //Show pagination on filter = all;
    $('.pagination').hide();
  }
});

//5. Toggle function for additional content
//toggle timetable show
$('.movie__show-btn').click(function (ev) {
  ev.preventDefault();

  $(this).parents('.movie--preview').find('.time-select').slideToggle(500);
});

$('.time-select__item').click(function (){
  $('.time-select__item').removeClass('active');
  $(this).addClass('active');
});

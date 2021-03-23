$(function() {
  $('.slider').slick({
    //prevArrow: '<i class="fas fa-arrow-alt-circle-left"></i>',
    //nextArrow: '<i class="fas fa-arrow-alt-circle-right"></i>',
    autoplay: true,
    pauseOnFocus: false,
    autoplaySpeed: 3000,
    slidesToShow: 1,
    centerMode: true,
    centerPadding: '100px',
    focusOnSelect: true,
    dots: true,
    variableWidth: true
  })
});

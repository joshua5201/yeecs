
var current = 1;
$(document).ready(function(){

  //set intro height
  
  var w = $(window).width();
  //menubtn functions
  $("#menubtn").on('click', function(e){
    e.preventDefault();
    $("#menublack").fadeIn("fast");
    $("#menu-side").removeClass("menu-slideOut");
    $("#menu-side").addClass("menu-slideIn");
    $("#menu-side").css("left", 0);

  });
  $("#menublack").on('click', function(e){
    e.preventDefault();
    $("#menublack").fadeOut("fast");
    $("#menu-side").removeClass("menu-slideIn");
    $("#menu-side").addClass("menu-slideOut");
    $("#menu-side").css("left", -800);

  });

  $(".p-index-img").css("height", $(".p-index-img").width()*1.2);


  $.each([ 1, 2, 3 ], function( index, i ){	
    var sidenews = "#sidenews" + i;
    var slide = "#slide" + i;

    $( sidenews ).hover(function(){
      $( sidenews ).removeClass("side-Out");
      $( sidenews ).addClass("side-On");
    }, function(){
      $( sidenews ).removeClass("side-On");
      $( sidenews ).addClass("side-Out");
    });

    $( slide ).hover(function(){
      $( slide ).removeClass("slide-Out");
      $( slide ).addClass("slide-On");
    }, function(){
      $( slide ).removeClass("slide-On");
      $( slide ).addClass("slide-Out");
    });
  });

  $.each([ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], function( index, i ){	
    var submenuInit = "#submenu-w" + i;
    $( submenuInit ).css("display", "none");
  });

  if( w >= 769 ){
  $("#menu1").addClass("menu-w-On");
  $("#submenu-w1").css("display", "flex");

  $.each([ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], function( index, i ){	
    var menuSelect = "#menu" + i;

    $( menuSelect ).css("cursor", "pointer");
    $( menuSelect ).hover(function(){
      var menuOld = "#menu" + current;
      var submenuOld = "#submenu-w" + current;
      var submenuNew = "#submenu-w" + i;

      $( menuOld ).removeClass("menu-w-On");
      $( menuSelect ).addClass("menu-w-On");
      $( submenuOld ).css("display", "none");
      $( submenuNew ).css("display", "flex");

      current = i;

    });
  });
  };
});


$(window).resize(function(){
  var w = $(window).width();

  $(".p-index-img").css("height", $(".p-index-img").width()*1.2);

  if( w >= 769 ){

  $.each([ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], function( index, i ){	
    var menuSelect = "#menu" + i;

    $( menuSelect ).hover(function(){
      var menuOld = "#menu" + current;
      var submenuOld = "#submenu-w" + current;
      var submenuNew = "#submenu-w" + i;

      $( menuOld ).removeClass("menu-w-On");
      $( menuSelect ).addClass("menu-w-On");
      $( submenuOld ).css("display", "none");
      $( submenuNew ).css("display", "flex");

      current = i;

    });
  });
  } else{
      var submenuOld = "#submenu-w" + current;
      var menuOld = "#menu" + current;
      $( submenuOld ).css("display", "none");
      $( menuOld ).removeClass("menu-w-On");
  };

});



var current = 1;

function checkStageRight( i, tmp_pos) {
  var submenu = "#submenu-w" + i;
  var submenuInner = "#submenu-w-inner" + i;
  var submenuOuter = "#submenu-w-outer" + i;
  var subControlLeft = "#subControl-left" + i;
  var subControlRight = "#subControl-right" + i;
  if (1-$( submenuInner ).height() < tmp_pos - $( submenu ).height()) {
    $( subControlRight ).css("display", "block");
    $( subControlRight ).css("cursor", "pointer");
    $( subControlRight ).css("opacity", 1);

    $( subControlRight ).click( function(){
      tmp_pos -= $( submenu ).height();
      $( submenuInner ).css("top", tmp_pos);

      checkStageLeft( i, tmp_pos);
      checkStageRight( i, tmp_pos);

    });

  }
  else {
    $( subControlRight ).css("cursor", "default");
    $( subControlRight ).css("opacity", 0.1);
    $( subControlRight ).css("display", "none");
  }

}

function checkStageLeft( i, tmp_pos) {
  var submenu = "#submenu-w" + i;
  var submenuInner = "#submenu-w-inner" + i;
  var submenuOuter = "#submenu-w-outer" + i;
  var subControlLeft = "#subControl-left" + i;
  var subControlRight = "#subControl-right" + i;
  if (tmp_pos + $( submenu ).height() <= 0) {
    $( subControlLeft ).css("display", "block");
    $( subControlLeft ).css("cursor", "pointer");
    $( subControlLeft ).css("opacity", 1);

    $( subControlLeft ).click( function(){
      tmp_pos += $( submenu ).height();
      $( submenuInner ).css("top", tmp_pos);

      checkStageRight( i, tmp_pos);
      checkStageLeft( i, tmp_pos);

    });

  }
  else {
    $( subControlLeft ).css("cursor", "default");
    $( subControlLeft ).css("opacity", 0.1);
    $( subControlLeft ).css("display", "none");
  }

}

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




  $.each([ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], function( index, i ){	
    var submenuInit = "#submenu-w" + i;
    $( submenuInit ).css("display", "none");
  });

  if( w >= 769 ){
    //$("#menu1").addClass("menu-w-On");
    //$("#submenu-w1").css("display", "flex");

    $.each([ 1, 2, 3, 4, 5, 6, 7, 8, 9 ], function( index, i ){	
      var menuSelect = "#menu" + i;
      var submenu = "#submenu-w" + i;
      var submenuInner = "#submenu-w-inner" + i;
      var submenuOuter = "#submenu-w-outer" + i;
      var subControlLeft = "#subControl-left" + i;
      var subControlRight = "#subControl-right" + i;


      var tmp_pos = 0;
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

        $(".submenu-inner").css("top", 0);
        tmp_pos = 0;

        // Submenu control
        var menu_pos = $( submenuInner ).offset();
        $(".sub-control-left").css("left", menu_pos.left-50);
        $(".sub-control-right").css("left", menu_pos.left+$( submenuOuter).width()+2 );


        $( subControlLeft ).css("cursor", "default");
        $( subControlLeft ).css("opacity", 0.1);
        $( subControlLeft ).css("display", "none");
        checkStageRight( i, tmp_pos);
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
      var submenu = "#submenu-w" + i;
      var submenuInner = "#submenu-w-inner" + i;
      var submenuOuter = "#submenu-w-outer" + i;
      var subControlLeft = "#subControl-left" + i;
      var subControlRight = "#subControl-right" + i;


      var tmp_pos = 0;
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

        $(".submenu-inner").css("top", 0);
        tmp_pos = 0;

        // Submenu control
        var menu_pos = $( submenuInner ).offset();
        $(".sub-control-left").css("left", menu_pos.left-50);
        $(".sub-control-right").css("left", menu_pos.left+$( submenuOuter).width()+2 );


        $( subControlLeft ).css("cursor", "default");
        $( subControlLeft ).css("opacity", 0.1);
        $( subControlLeft ).css("display", "none");
        checkStageRight( i, tmp_pos);
      });

    });
  } else{
    var submenuOld = "#submenu-w" + current;
    var menuOld = "#menu" + current;
    $( submenuOld ).css("display", "none");
    $( menuOld ).removeClass("menu-w-On");
  };

});


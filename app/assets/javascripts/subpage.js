
$(document).ready(function(){
  var w = $("#box-side").width();
  $("#display-side").css("width",w);

  var p_index_height = $(".p-index-img").height();
  $(".p-index-word").css("height", p_index_height*0.7);
  $(".news-img-atList").css("height", $(".news-img-atList").width()/4*2.5);

  $(window).resize(function(){
    var w = $("#box-side").width();
    $("#display-side").css("width",w);

    var p_index_height = $(".p-index-img").height();
    $(".p-index-word").css("height", p_index_height*0.7);
    $(".news-img-atList").css("height", $(".news-img-atList").width()/4*2.5);

  });


});



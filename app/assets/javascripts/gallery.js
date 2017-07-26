
$(document).ready(function(){
  var $overlay = $('<div id="overlay"></div>');
  var $image = $("<img>");

  //An image to overlay
  $overlay.append($image);

  //Add overlay
  $("body").append($overlay);

  //click the image and a scaled version of the full size image will appear
  $("#photo-gallery img").click( function(event) {
    event.preventDefault();
    console.log("gogo");
    var imageLocation = $(this).data("largeImage");

    //update overlay with the image linked in the link
    $image.attr("src", imageLocation);

    //show the overlay
    $overlay.show();
  });

  $("#overlay").click(function() {
    $( "#overlay" ).hide();
  });

  $("#photo-gallery div").css("max-height", $("#photo-gallery div").width()*9/16);

  var w = $(window).width();
  $(window).resize(function(){
    $("#photo-gallery div").css("max-height", $("#photo-gallery div").width()*9/16);
    if($(this).width() != width){
      width = $(this).width();
      location.reload();
    }
  });

});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function showMyTrips(){
  $("#my_trips").removeClass("hidden");
  $("#past_trips").addClass("hidden");
  $("#bookmarked_trips").addClass("hidden");
  $("#my_trips_link").addClass("selected");
  $("#past_trips_link").removeClass("selected");
  $("#bookmarked_trips_link").removeClass("selected");
}
  
function showPastTrips(){
  $("#my_trips").addClass("hidden");
  $("#past_trips").removeClass("hidden");
  $("#bookmarked_trips").addClass("hidden");
  $("#my_trips_link").removeClass("selected");
  $("#past_trips_link").addClass("selected");
  $("#bookmarked_trips_link").removeClass("selected");
}
  
function showBookmarkedTrips(){
  $("#my_trips").addClass("hidden");
  $("#past_trips").addClass("hidden");
  $("#bookmarked_trips").removeClass("hidden");
  $("#my_trips_link").removeClass("selected");
  $("#past_trips_link").removeClass("selected");
  $("#bookmarked_trips_link").addClass("selected");
}
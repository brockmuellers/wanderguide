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
//= require jquery-ui
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

function showTripDays(){
  $("#trip_days").removeClass("hidden");
  $("#trip_activities").addClass("hidden");
  $("#trip_map").addClass("hidden");
  $("#trip_calendar").addClass("hidden");
  $("#trip_days_link").addClass("selected");
  $("#trip_activities_link").removeClass("selected");
  $("#trip_map_link").removeClass("selected");
  $("#trip_calendar_link").removeClass("selected");
}

function showTripActivities(){
  $("#trip_days").addClass("hidden");
  $("#trip_activities").removeClass("hidden");
  $("#trip_map").addClass("hidden");
  $("#trip_calendar").addClass("hidden");
  $("#trip_days_link").removeClass("selected");
  $("#trip_activities_link").addClass("selected");
  $("#trip_map_link").removeClass("selected");
  $("#trip_calendar_link").removeClass("selected");
}

function showTripCalendar(){
  $("#trip_days").addClass("hidden");
  $("#trip_activities").addClass("hidden");
  $("#trip_map").addClass("hidden");
  $("#trip_calendar").removeClass("hidden");
  $("#trip_days_link").removeClass("selected");
  $("#trip_activities_link").removeClass("selected");
  $("#trip_map_link").removeClass("selected");
  $("#trip_calendar_link").addClass("selected");
}

function showDayActivities(){
  $("#day_activities").removeClass("hidden");
  $("#day_map").addClass("hidden");
  $("#day_calendar").addClass("hidden");
  $("#day_activities_link").addClass("selected");
  $("#day_map_link").removeClass("selected");
  $("#day_calendar_link").removeClass("selected");
}

function showDayMap(){
  $("#day_activities").addClass("hidden");
  $("#day_map").removeClass("hidden");
  $("#day_calendar").addClass("hidden");
  $("#day_activities_link").removeClass("selected");
  $("#day_map_link").addClass("selected");
  $("#day_calendar_link").removeClass("selected");
}

function showDayCalendar(){
  $("#day_activities").addClass("hidden");
  $("#day_map").addClass("hidden");
  $("#day_calendar").removeClass("hidden");
  $("#day_activities_link").removeClass("selected");
  $("#day_map_link").removeClass("selected");
  $("#day_calendar_link").addClass("selected");
}


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showMyTrips = ->
  $("#my_trips").removeClass "hidden"
  $("#past_trips").addClass "hidden"
  $("#bookmarked_trips").addClass "hidden"
  $("#my_trips_link").addClass "selected"
  $("#past_trips_link").removeClass "selected"
  $("#bookmarked_trips_link").removeClass "selected"
  
showPastTrips = ->
  $("#my_trips").addClass "hidden"
  $("#past_trips").removeClass "hidden"
  $("#bookmarked_trips").addClass "hidden"
  $("#my_trips_link").removeClass "selected"
  $("#past_trips_link").addClass "selected"
  $("#bookmarked_trips_link").removeClass "selected"
  
showBookmarkedTrips = ->
  $("#my_trips").addClass "hidden"
  $("#past_trips").addClass "hidden"
  $("#bookmarked_trips").removeClass "hidden"
  $("#my_trips_link").removeClass "selected"
  $("#past_trips_link").removeClass "selected"
  $("#bookmarked_trips_link").addClass "selected"
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()	
		
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    options = types: ["(regions)"]
    $(".location_text_field").each ->
      autocomplete = new google.maps.places.Autocomplete($(this)[0], options)
      location_field = this
      google.maps.event.addListener autocomplete, "place_changed", ->
        place = autocomplete.getPlace()
        $(location_field).siblings(".reference").val place.reference
        $(location_field).siblings(".lat").val place.geometry.location.lat()
        $(location_field).siblings(".lng").val place.geometry.location.lng()
    event.preventDefault()
  
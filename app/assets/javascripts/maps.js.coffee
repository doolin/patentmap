# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  patent_location = []
    
  initialize = ->
    mapOptions =
      zoom: 8
      center: new google.maps.LatLng(43.0328, -89.4981)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: false
      panControl: false
      streetViewControl: false
      streetViewControlOptions: false
    window.map = new google.maps.Map(document.getElementById("map_container"), mapOptions)
  
  
  render_patents_on_map = (patents) ->
    bounds = new google.maps.LatLngBounds()
    markers = []
    $.each patents, (i, item) ->
      console.log item
      prop_loc = new google.maps.LatLng(item[0], item[1])
      markers[i] = new google.maps.Marker
        icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{i+1}|D54F27|ffffff"
        position: prop_loc 
        map: window.map
      bounds.extend markers[i].getPosition()    
    window.map.fitBounds bounds
    
  request = $.ajax
            url: window.location
            cache: false
            dataType: "json"   
    
  request.success (data) ->
    $.each data, (i, patent) ->
      patent_location.push([patent["lat"], patent["lon"]])  
    render_patents_on_map(patent_location)
  
  google.maps.event.addDomListener $(document), "load", initialize()  
 
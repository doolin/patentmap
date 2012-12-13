# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

patent_map = ->
  patent_location = []
  bounds = new google.maps.LatLngBounds()
  markers = []
  mapContainer = []
  
  mapOptions = 
    zoom: 8
    center: new google.maps.LatLng(43.0328, -89.4981)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    mapTypeControl: false
    panControl: false
    streetViewControl: false
    streetViewControlOptions: false
  
  initialize = ->
    mapContainer = new google.maps.Map(document.getElementById("map_container"), mapOptions)  
  
  render_patents_on_map = (patents) ->
    $.each patents, (i, item) ->
      prop_loc = new google.maps.LatLng(item[0], item[1])
      markers[i] = new google.maps.Marker
        icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{i+1}|D54F27|ffffff"
        position: prop_loc 
        map: mapContainer
      bounds.extend markers[i].getPosition()    
    mapContainer.fitBounds bounds
  
  load_remote_patents_success = (data) ->
    $.each data, (i, patent) ->
      patent_location.push([patent["lat"], patent["lon"]])  
    render_patents_on_map(patent_location)
  
  load_remote_patents_fail = (jqXHR, textStatus) ->
    alert "Request failed: " + textStatus
  
  load_remote_patents = ->    
    $.ajax  
      url: window.location
      cache: false
      dataType: "json"
      success: (data) -> load_remote_patents_success(data)
      fail: (jqXHR, textStatus) -> load_remote_patents_fail(jqXHR, textStatus)
        
  google.maps.event.addDomListener $(document), "load", initialize()  
  load_remote_patents()
              
$ ->
  patent_map()
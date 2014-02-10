
<html lan="en">
	<head>
	<meta charset="utf-8" />
    <title>Geo View Time Slider -</title>
	<link type="text/css" rel="stylesheet" href="map/css/960/min/960.css" />
		<link type="text/css" rel="stylesheet" href="map/css/960/min/960_16_col.css" />
		<link type="text/css" rel="stylesheet" href="map/css/normalize/min/normalize.css" />
		<link type="text/css" rel="stylesheet" href="map/css/prettify/min/prettify.css" />
		<link type="text/css" rel="stylesheet" href="map/css/style.css" />
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	    <script type="text/javascript" src="map/js/modernizr-2.0.6/modernizr.min.js"></script>
		
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />	
    
    <script>
    /*
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 365,
      values: [ 1, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
       	
        $('#map_canvas').gmap({'zoom': 2, 'disableDefaultUI':true}).bind('init', function(evt,map) { 
	    $.getJSON( '/datesort?val1='+ui.values[0]+'&val2='+ui.values[1], function(data) {
		
		$.each(data.array, function(i, arr) {
		   
			$('#map_canvas').gmap('addMarker', { 
				'position': new google.maps.LatLng(arr.latitude, arr.longitude), 
				'bounds': true 
			}).mouseover(function() {
				$('#map_canvas').gmap('openInfoWindow', { 'content': '<img src=' + arr.bkUrl+ ' alt="Hello world" width="100" height="100">' }, this);
			});
		 $('#map_canvas').gmap('set', 'MarkerClusterer', new MarkerClusterer($('#map_canvas').gmap('get', 'map'), $('#map_canvas').gmap('get', 'markers')));
		});
	});
    
});	
        
                
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " - " + $( "#slider-range" ).slider( "values", 1 ) );
  });
  */
     
     $(function() {
             
             $( "#slider-range" ).slider({
                         range: true,
                         max: $.now(),
                         min: ($.now()-(365*24*3600*1000)),
                         values: [ ($.now()-(1*24*3600*1000)), $.now()  ],
                         slide: function( event, ui ) {
                             $( "#amount" ).val( new Date(ui.values[ 0 ]) + " - " + new Date(ui.values[ 1 ]) );
                             
                             $('#map_canvas').gmap('find', 'markers', { }, function(marker) {
                                if(marker.timestamp < ui.values[ 1 ] && marker.timestamp > ui.values[ 0 ]){
                                    marker.setVisible(true);
                                }else{
                                    marker.setVisible(false);
                                }
                                $('#map_canvas').gmap('refresh'); 
                            });
                             
                         }
                     });
                     
           
             $( "#amount" ).val( new Date($( "#slider-range" ).slider( "values", 0 )) +
                     " - " + new Date($( "#slider-range" ).slider( "values", 1 )) );
             });
        
          
            $(function() { 
                demo.add(function() {
                    $('#map_canvas').gmap({'zoom': 2, 'disableDefaultUI':true}).bind('init', function(evt, map) { 
                        var bounds = map.getBounds();
                        var southWest = bounds.getSouthWest();
                        var northEast = bounds.getNorthEast();
                        var lngSpan = northEast.lng() - southWest.lng();
                        var latSpan = northEast.lat() - southWest.lat();
                        alert(new Date($.now()));
                        var i =100;
                        alert(new Date($.now()-i*1000*24*3600));
                        $.getJSON( '/geojson', function(data) {
			
		                $.each(data.array, function(i, arr) {
		   
			            $('#map_canvas').gmap('addMarker', { 
				        'position': new google.maps.LatLng(arr.latitude, arr.longitude), 
				        'bounds': true,
				        'timestamp':arr.createDate 
			             }).mouseover(function() {
				         $('#map_canvas').gmap('openInfoWindow', { 'content': '<img src=' + arr.bkUrl+ ' alt="Hello world" width="100" height="100"> <br> <p>'+ arr.createDate +' </p>' }, this);
			});
		// $('#map_canvas').gmap('set', 'MarkerClusterer', new MarkerClusterer($('#map_canvas').gmap('get', 'map'), $('#map_canvas').gmap('get', 'markers')));
		});
	});
                                                
                       
                       
                        $(this).gmap('set', 'MarkerClusterer', new MarkerClusterer(map, $(this).gmap('get', 'markers'), { 'ignoreHidden': true }));
                        
                    });
                }).load();
            });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </script>
    
    
    
    
    
    
		
	</head>
	
  <body>
  <div id="map_canvas" class="map" style="left:10% width:80% ;height:80%"></div>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
		
		<script type="text/javascript" src="map/js/underscore-1.2.2/underscore.min.js"></script>
		<script type="text/javascript" src="map/js/backbone-0.5.3/backbone.min.js"></script>
		<script type="text/javascript" src="map/js/prettify/prettify.min.js"></script>
		<script type="text/javascript" src="map/js/demo.js"></script>
		<script type="text/javascript" src="map/js/markerclustererplus-2.0.6/markerclusterer.js"></script>
		<script type="text/javascript" src="map/ui/jquery.ui.map.js"></script>
		
		<script type="text/javascript">
   
        </script>
        
        
  <p>
  <label for="amount">Date range:</label>
  <input type="text" id="amount" style="border: 0; color: #f6931f; font-weight: bold; width:80% " />
</p>
 
<div id="slider-range"></div>      
        
        
        
  </body>
  </html>	
	




	
	
	
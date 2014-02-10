
<html>
	<head>
	<title>Map Streams</title>
	<link type="text/css" rel="stylesheet" href="map/css/960/min/960.css" />
		<link type="text/css" rel="stylesheet" href="map/css/960/min/960_16_col.css" />
		<link type="text/css" rel="stylesheet" href="map/css/normalize/min/normalize.css" />
		<link type="text/css" rel="stylesheet" href="map/css/prettify/min/prettify.css" />
		<link type="text/css" rel="stylesheet" href="map/css/style.css" />
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	    <script type="text/javascript" src="map/js/modernizr-2.0.6/modernizr.min.js"></script>
		
	</head>
	
  <body>
  <div id="map_canvas" class="map" style="left:10% width:80% ;height:80%"></div>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
		<script type="text/javascript" src="map/js/jquery-1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="map/js/underscore-1.2.2/underscore.min.js"></script>
		<script type="text/javascript" src="map/js/backbone-0.5.3/backbone.min.js"></script>
		<script type="text/javascript" src="map/js/prettify/prettify.min.js"></script>
		<script type="text/javascript" src="map/js/demo.js"></script>
		<script type="text/javascript" src="map/js/markerclustererplus-2.0.6/markerclusterer.js"></script>
		<script type="text/javascript" src="map/ui/jquery.ui.map.js"></script>
		
		<script type="text/javascript">
    $(function()
    {       

	
	$('#map_canvas').gmap({'zoom': 2, 'disableDefaultUI':true}).bind('init', function(evt,map) { 
	$.getJSON( '/geojson', function(data) {
			
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
});
        </script>
  </body>
  </html>	
	




	
	
	
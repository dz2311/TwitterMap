<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#search {
    line-height:30px;
    background-color:#eeeeee;
    height:510px;
    width:180px;
    float:left;
    padding:5px;	      
}
#text {
    line-height:30px;
    background-color:#ffffff;
    height:200px;
    width:150px;
    float:left;
    padding:5px;	      
}
#map {
    width:1020px;
	height:500px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}

    </style>
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
  <div id="header">
<h1>Twitter Map</h1>
</div>

<div id = "search">
Please type in the fileter TOPIC<br>
<!-- <form action="HelloWorld?flag=3"> -->
<input id = "getData" type="text" name="topic"><br>
<button id="topicSubmit" class = "btn" onclick = "getTopic()"> Submit</button>

<!-- </form> -->
</div>

<div id="map"></div>
    <script async defer 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBuTjgH4r5E1jd-0M0el0xUArtqrz0UvKI&callback=initMap">
    </script>
  <script>
  function initMap() {
	    map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: 40.7960891, lng: -73.8982279}, 
	    zoom: 10
	});
	map.addListener('click', function(e) {
	  var marker = new google.maps.Marker({
	    position: {lat: e.latLng.lat(), lng: e.latLng.lng()},
	    map: map
	  });
	});
	}
	function getTopic()
	{
		var mapOptions = {
				zoom:10,
				center: {lat: 40.7960891, lng: -73.8982279}
		}
		var topic = document.getElementById("getData").value;	
		$.get("http://localhost:8080/Transportation/HelloWorld?flag=" + topic, function(data, status){
	    	//document.getElementById("map").innerHTML = data;
	    	alert("hahaha");
		var dataop = data.split('\n');
		var map = new google.maps.Map(document.getElementById("map"), mapOptions);
		for(i=0;i<101;i+=2)
		{
			var myLatlng = new google.maps.LatLng(dataop[i],dataop[i+1]);
			var marker = new google.maps.Marker({
				position: myLatlng
			});
			marker.setMap(map);
		}
			
	})};
	/*document.getElementById("topicSubmit").addEventListener("click", function(){
		var topic = document.getElementById("topicSubmit").value;
	    $.get("http://localhost:8080/twitter1/T?flag=" + topic + get_downloadinfo, function(data, status){
	    	document.getElementById("map").innerHTML = data;
	    	//alert("dfdfd");
	    });

	}); */
	
  </script>
  </body>
</html>
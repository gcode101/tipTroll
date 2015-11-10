
var ready = function(){
  //Start geolocation

  var proId = []; //returned from the API
  var allLatlng = []; //returned from the API
  var allMarkers = []; //returned from the API
  var proName = []; //returned from the API
  var infowindow = null;
  var pos;
  var userCords;
  var tempMarkerHolder = [];

  if (!document.getElementById('map-canvas')) {
    return false;
  }

  //Fire up Google maps and place inside the map-canvas div
  var mapOptions = {
    zoom: 5,
    center: new google.maps.LatLng(37.09024, -100.712891),
    panControl: false,
    panControlOptions: {
      position: google.maps.ControlPosition.BOTTOM_LEFT
    },
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.LARGE,
      position: google.maps.ControlPosition.RIGHT_CENTER
    },
    scaleControl: false
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


  if (navigator.geolocation) {
    function error(err) {
      console.warn('ERROR(' + err.code + '): ' + err.message);
    }

    function success(pos){
      userCords = pos.coords;
      //return userCords;
    }

    // Get the user's current position
    navigator.geolocation.getCurrentPosition(success, error);
  } else {
    alert('Geolocation is not supported in your browser');
  }
  //End Geo location

  //Adding infowindow option
  infowindow = new google.maps.InfoWindow({
    content: "holding..."
  });

  //grab form data
  $('#chooseZip').submit(function() { // bind function to submit event of form

    //define and set variables
    var userZip = $("#textZip").val();

    var accessURL;

    if(userZip){
      accessURL = '/professionals/search';
    } else {
      accessURL = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/locSearch?lat=" + userCords.latitude + "&lng=" + userCords.longitude;
    }


    //Use the zip code and return all market ids in area.
    $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: accessURL,
      data: {
        zipCode: userZip,
      },
      success: function (data) {
        var counter = 0;
        for (var i = 0; i < data.professional.length; i++) {
          person = data.professional[i];

          var address = person.job_location;
          add_marker(map, address);
        };
      }
    }); // end ajax

    return false; // important: prevent the form from submitting
  }); // end submit

  // $('.location').each(function(idx, item) {
  //   add_marker(map, $(item).text());
  // });


  function add_marker(map, address) {
    new google.maps.Geocoder().geocode( { 'address': address }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng();
        map.setCenter(results[0].geometry.location);
        map.setZoom(13);

        var myLatlng = new google.maps.LatLng(latitude,longitude);

        //set the markers.
        var allMarkers = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: "Barbers",
          html:
          '<div class="markerPop">' +
          '<h1>' + "Barbers" + '</h1>' +
          '<h3>' + results['Address'] + '</h3>' +
          '<p>' + results['Products'] + '</p>' +
          '<p>' + results['Schedule'] + '</p>' +
          '</div>'
        });

          google.maps.event.addListener(allMarkers, 'click', function () {
            infowindow.setContent(this.html);
            infowindow.open(map, this);
          });
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      }); // end geocoder
    }
}

$(document).ready(ready);
$(document).on('page:load', ready);










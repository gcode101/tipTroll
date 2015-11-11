
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
    var profession = $("#profession").val();

    var accessURL;

    if(userZip){
      accessURL = '/professionals/search';
    } else {
      alert("Please enter a zip code.");
      return false;
      // accessURL = "http://search.ams.usda.gov/farmersmarkets/v1/data.svc/locSearch?lat=" + userCords.latitude + "&lng=" + userCords.longitude;
    }


    //Use the zip code and return all market ids in area.
    $.ajax({
      type: "GET",
      dataType: "json",
      url: accessURL,
      data: {
        zipCode: userZip,
        profession: profession
      },
      success: function (pros) {
        console.log(pros);
        var counter = 0;
        for (var i = 0; i < pros.length; i++) {
          person = pros[i];
          var address = person.job_location;
          var name = person.name;
          var jobTitle = person.job_title;
          var score = person.average_rating;
          add_marker(map, address, name, jobTitle, score);
        };
      }
    }); // end ajax

    return false; // important: prevent the form from submitting
  }); // end submit

  // $('.location').each(function(idx, item) {
  //   add_marker(map, $(item).text());
  // });


  function add_marker(map, address, name, job_title, score) {
    new google.maps.Geocoder().geocode( { 'address': address }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng();
        map.setCenter(results[0].geometry.location);
        map.setZoom(13);

        var myLatlng = new google.maps.LatLng(latitude,longitude);
        var rating;
        //set the markers
        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: "Pros",
          html:
            '<div class="markerPop">' +
            '<h1>' + name + '</h1>' +
            '<h3>' + job_title + '</h3>' +
            '<p>' + address + '</p>' +
            '<p class="average_rating" data-score="' + score +'"></p>' +
            '</div>',
        });

        google.maps.event.addListener(marker, 'click', function () {
          infowindow.setContent(this.html);
          infowindow.open(map, this);
          $('.average_rating').raty({
            starOn: 'assets/star-on.png', // <%= image_path('star-on.png') %>
            starOff: 'assets/star-off.png', // <%= image_path('star-off.png') %>
            readOnly: true,
            score: score
          })
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      } // end if
    }); // end geocoder
  }
}

$(document).ready(ready);
$(document).on('page:load', ready);










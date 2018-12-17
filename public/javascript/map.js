var mapStyle, markers, beer, type;
function map(beer, type) {
  $.getJSON("/json/style.json", function (json) {
    mapStyle = json;
  });

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      search(beer, position.coords.latitude, position.coords.longitude, type);
    }, function (error) {
      if (error.code == error.PERMISSION_DENIED)
        console.warn("You denied geolocation, the data may contain some errors.")
      $.getJSON("https://ipapi.co/json", function (json) {
        search(beer, json["latitude"], json["longitude"], type);
      });
    });
  } else {
    console.warn("Your browser doesn't support geolocation, the data may contain some errors.")
    $.getJSON("https://ipapi.co/json", function (json) {
      search(beer, json["latitude"], json["longitude"], type);
    });
  };
};

function search(beer, lat, lng, type) {
  $.ajax({
    type: 'GET',
    url: '/location',
    data: {
      lat: lat,
      lng: lng,
      term: beer,
      type: type
    },
    contentType: 'application/json',
    dataType: 'json'
  }).done(function (data) {
    bars = data.data;
    newMap(mapStyle, bars, lat, lng);
  });
};

function newMap(style, bars, lat, lng) {
  var map = new GMaps({
    div: '#map',
    disableDefaultUI: true,
    styles: style
  });

  var latLong = [];
  if (bars[0]) {
    bars.forEach(function (bar) {
      map.addMarker({
        lat: bar.latitude,
        lng: bar.longitude,
        title: bar.name,
        icon: '/img/beer32.png',
        infoWindow: {
          content: bar.name + '<br>' + bar.address + '<br><a href="bars/' + bar.id + '">Voir</a>'
        }
      });
      latLong.push({
        lat: bar.latitude,
        lng: bar.longitude
      });
      barCard(bar);
    });

    map.addMarker({
      lat: lat,
      lng: lng,
      title: 'User',
      icon: '/img/dot.svg'
    });
    latLong.push({
      lat: lat,
      lng: lng
    });

    map.fitLatLngBounds(latLong);
    $('[data-toggle="popover"]').popover();
  } else {
    $("#map").html("Oh non, nous n'avons pas trouvé la bière que vous cherchez :'(");
  };
};

function barCard(bar) {
  var has_beer;
  if (bar.draft_beer) {
    has_beer = "Ce bar a la bière que tu cherches en pression :)"
  } else {
    has_beer = ""
  };
  var card = '<div class="card mb-4"><img src="' + bar.photo + '" class="card-img-top" alt="beer")><div class="card-body"><h5>' + bar.name + '</h5><p>' + bar.address + '</p><p>' + bar.draft_number + ' bières en pression</p><p>' + has_beer + ' </p><p><a href="bars/' + bar.id + '" class="text-h">Voir</a>'
  if (bar.hasOwnProperty('beers')) {
    card += '<button type="button" class="text-r ml-3" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" data-content="' + bar.beers.join("<br>") + '">Bières</button></div></div>';
  };
  $("#result-card").append(card);
};

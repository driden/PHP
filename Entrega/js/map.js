function initMap() {
    const uluru = {
        lat: -34.890357, 
        lng: -56.106040099999994
    };
    
    const map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: uluru
    });
    const marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
/*
  function initMap(lat, long) {
    const uluru = {lat: lat, lng: long};
    const map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: uluru
    });
    const marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
  */
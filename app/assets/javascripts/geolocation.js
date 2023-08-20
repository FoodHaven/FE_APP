document.getElementById("location").addEventListener("click", getLocation)

  function getLocation() {
    var spinner = document.getElementById('spinner');
    spinner.style.display = 'block';

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        function(position) {
          var latitude = position.coords.latitude;
          var longitude = position.coords.longitude;

          var latitudeField = document.getElementById('latitude-field');
          var longitudeField = document.getElementById('longitude-field');

          if (latitudeField && longitudeField) {
            latitudeField.value = latitude;
            longitudeField.value = longitude;
          }
          spinner.style.display = 'none';
        },
        function(error) {
          console.error('Error getting geolocation:', error);
          spinner.style.display = 'none';
        }
      );
    } else { 
      x.innerHTML = "Geolocation is not supported by this browser.";
      spinner.style.display = 'none';
    }
  }
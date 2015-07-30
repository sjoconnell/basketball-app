(function() {
  "use strict";

  angular.module("app").controller("gamesCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("api/v1/games.json").then(function(response) {
        $scope.games = response.data.games;
      });
    };

    window.scope = $scope;

    function initialize() {
      var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
      var mapOptions = {
        zoom: 4,
        center: myLatlng
      }
      var map = new google.maps.Map(document.getElementById('map'), mapOptions);

      var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Hello World!'
      });
    }

    google.maps.event.addDomListener(window, 'load', initialize);

  });

}());
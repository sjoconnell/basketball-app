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
        var mapOptions = {
          center: { lat: -34.397, lng: 150.644},
          zoom: 8
        };
        var map = new google.maps.Map(document.getElementById('map'),
            mapOptions);
      }
      
      google.maps.event.addDomListener(window, 'load', initialize);

  });

}());
(function() {
  "use strict";

  angular.module("app").controller("gamesCtrl", function($scope, $http) {

    window.scope = $scope;

    function initialize() {
      var center = new google.maps.LatLng(41.9439, -87.6648);
      var mapOptions = {
        zoom: 12,
        center: center
      }
      var map = new google.maps.Map(document.getElementById('map'), mapOptions);

      if(!$scope.games){
        $http.get("api/v1/games.json").then(function(response) {
          $scope.games = response.data.games;
          for(var i = 0; i < $scope.games.length; i++){
            var game = $scope.games[i];
            var myLatlng = new google.maps.LatLng(game.lat,game.long);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Hello World!'
            });
          }
        });
      }

      
      
    }

    google.maps.event.addDomListener(window, 'load', initialize);

  });

}());

// (41.909962,-87.666761)
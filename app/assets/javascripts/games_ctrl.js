(function() {
  "use strict";

  angular.module("app").controller("gamesCtrl", function($scope, $http) {

    window.scope = $scope;
    var infowindow;
    $scope.gameinfo;

    function setinfowindow(map, marker) {
      if(infowindow){
        infowindow.close();
      }

      $scope.gameinfo = ({
        address: marker.address,
        title: marker.title,
        start_time: marker.start_time,
        end_time: marker.end_time,
        id: marker.game_id,
        spots_left: marker.spots_left
      });

      infowindow = new google.maps.InfoWindow({
        content: "<a href='/games/" + marker.game_id + "'>" + marker.title + "</a>"
      });

      infowindow.open(map, marker);
      $scope.$apply();
    };


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
            var bounds = new google.maps.LatLngBounds();
          for(var i = 0; i < $scope.games.length; i++){
            var game = $scope.games[i];
            var myLatlng = new google.maps.LatLng(game.lat,game.long);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: game.title,
                game_id: game.id,
                address: game.address,
                start_time: game.start_time,
                end_time: game.end_time,
                spots_left: ((game.players_allowed)-(game.players_joined))

            });
            bounds.extend(marker.position);
            google.maps.event.addListener(marker, 'click', function() {
              setinfowindow(map, this)
            });
            map.fitBounds(bounds);
          }
        });
      }      
    }


    google.maps.event.addDomListener(window, 'load', initialize);

  });

}());

(function() {
  "use strict";

  angular.module("app").controller("gamesCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("api/v1/games.json").then(function(response) {
        $scope.games = response.data;
      });
    };

    window.scope = $scope;
  });

}());
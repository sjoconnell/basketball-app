(function() {
  "use strict";

  angular.module("app").controller("gamesCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("api/v1/games.json").then(function(response) {
        $scope.games = response.data;
      });
    };

    // $scope.addemployee = function(firstname, lastname, email)  {
    //   var employee = {
    //     first_name: firstname,
    //     last_name: lastname,
    //     email: email
    //   };

    //   $http.post("api/v1/employees.json", employee).then(function(response){$scope.employees.push(employee);
    //   }, function(error) {
    //     $scope.errors = error.data.errors;
    //   });
    // };

    window.scope = $scope;
  });

}());
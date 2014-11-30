(function(){

  var app = angular.module("gu.components.navigation");
  app.controller("gu.components.navigation.Controller",
  [ "$scope", "gu.data.User", "gu.util.services.StateHandler", "$location", "$window",

  function ($scope, User, StateHandler, $location, $window) {

    function init(){
      $scope.state = StateHandler.getInstance();
      $scope.logout = logout;
    };

    function logout(){
      User.currentUser.logout().then(logoutSuccess, logoutFail);
    };

    function logoutSuccess(){
      $scope.state.success();
      $window.location.reload();
    };

    function logoutFail(){
      $scope.state.fatal();
    };

    init();
  }]);

}());

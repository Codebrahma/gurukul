angular.module("gu.sections.session")

.controller("gu.sections.session.LoginController",
  ["$scope", "$window", "gu.data.User", "$location",
  function($scope, $window, User, $location){

  function init(){
    $scope.user = {};
    $scope.login = login;
  }

  function login(){
    User.login($scope.user).then(loginSuccess, loginFailure);
  };

  function loginSuccess(){
    redirect();
  };

  function loginFailure(){

  };

  function redirect(){
    $window.location.reload();
  };

  init();

}]);

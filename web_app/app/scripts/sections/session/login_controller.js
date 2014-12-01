angular.module("gu.sections.session")

.controller("gu.sections.session.LoginController",
  ["$scope", "$window", "gu.data.User", "gu.util.services.StateHandler",
  function($scope, $window, User, StateHandler){

    function init(){
      $scope.user = {};
      $scope.login = login;
      $scope.state = StateHandler.getInstance();
    }

    function login(){
      $scope.state.initiate();
      User.login($scope.user).then(loginSuccess, loginFailure);
    };

    function loginSuccess(){
      $scope.state.success();
      _.defer(redirect);
    };

    function loginFailure(){
      $scope.state.fatal("Unable to login user.");
    };

    function redirect(){
      $window.location.reload();
    };

    init();

  }
]);

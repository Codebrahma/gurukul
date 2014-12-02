angular.module("gu.sections.session")

.controller("gu.sections.session.RegisterController",
  ["$scope", "gu.data.User", "gu.util.services.StateHandler",
  function($scope, User, StateHandler){

    function init(){
      $scope.user = {};
      $scope.register = register;
      $scope.state = StateHandler.getInstance();
    }

    function register(){
      function loginSuccess(){
        $scope.state.success();
        $scope.registered = true;
      };

      function loginFailure(){
        $scope.state.fatal("Unable to register user");
      };

      $scope.state.initiate();
      new User({ user: $scope.user }).$save(loginSuccess, loginFailure);
    };

    init();

  }
]);

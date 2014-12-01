(function(){
  var app = angular.module("gu.components.courseList");
  app.controller("gu.components.courseList.Controller",
    [ "$scope", "gu.data.Course", "gu.util.services.StateHandler",
    function($scope, Course, StateHandler){
      function init(){
        $scope.state = StateHandler.getInstance();
        loadCourses();
      };

      function loadCourses(){
        $scope.state.initiate();
        $scope.courses = Course.query();
        $scope.courses.$promise(loadSuccess, loadFailure);
      };

      function loadSuccess(){
        $scope.state.success();
      };

      function loadFailure(){
        $scope.state.fatal();
      };

      init();
    }
  ]);
}());

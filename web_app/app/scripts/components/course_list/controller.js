(function(){
  var app = angular.module("gu.components.courseList");
  app.controller("gu.components.courseList.Controller",
    [ "$scope", "gu.data.Course", "gu.util.services.StateHandler", "gu.data.UserCourse",
    function($scope, Course, StateHandler, UserCourse){
      function init(){
        $scope.courseListState = StateHandler.getInstance();
        $scope.startCourseState = StateHandler.getInstance();
        $scope.startCourse = startCourse;
        loadCourses();
      };

      function loadCourses(){
        function loadSuccess(){
          $scope.courseListState.success();
        };

        function loadFailure(){
        $scope.courseListState.fatal("Failed to fetch courses");
        };

        $scope.courseListState.initiate();
        $scope.courses = Course.query();
        $scope.courses.$promise(loadSuccess, loadFailure);
      };

      function startCourse(course){
        function loadSuccess(){
          $scope.startCourseState.success();
        };

        function loadFailure(){
          $scope.startCourseState.fatal("Failed to star course "+ course.name);
        };

        $scope.startCourseState.initiate();
        new UserCourse({ course_id: course.id }).$save(loadSuccess, loadFailure);
      };

      init();
    }
  ]);
}());

(function(){
  angular.module("gu.sections.courses")
  .controller("gu.sections.courses.ShowController", ["$scope", "course",
    function($scope, course){
      function init(){
        $scope.course = course;
      }
      init();
    }
  ]);
}());

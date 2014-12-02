(function(){
  var app = angular.module("gu.components.courseList");
  app.directive("guCourseList", [function(){
    return{
      scope: {
        filter: "="
      },
      replace: true,
      templateUrl: "app/scripts/components/course_list/template.html",
      controller: "gu.components.courseList.Controller"
    };
  }]);

}());

(function(){
  var app = angular.module("gu.data");
  app.factory("gu.data.UserCourse",
    ["$resource", "$q",

    function($resource, $q){

      var Resource = $resource(gu.apiFor("courses/:course_id/user_courses/:id/"), { id: "@id", course_id: "@course_id" },{
        update: { method: 'PUT' }
      }),
      proto = Resource.prototype;

      return Resource;
    }
  ]);

}());

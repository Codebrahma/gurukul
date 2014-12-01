(function(){
  var app = angular.module("gu.data");
  app.factory("gu.data.Course",
    ["$resource", "$q",

    function($resource, $q){

      var Resource = $resource(gu.apiFor("courses/:id/"), { id: "@id" }),
      proto = Resource.prototype;

      return Resource;
    }
  ]);

}());

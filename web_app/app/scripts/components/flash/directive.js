(function(){
  var app = angular.module("gu.components.flash");
  app.directive("guFlash", [function(){
    return{
      scope:{},
      replace: true,
      templateUrl: "app/scripts/components/flash/template.html",
      controller: "gu.components.flash.Controller"
    };
  }]);
}());

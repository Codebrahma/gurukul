(function(){

  var app = angular.module("gu.components.navigation");

  app.directive("guNavigation", [function(){
    return{
      scope: {
        currentSession: "="
      },
      replace: true,

      templateUrl: "app/scripts/components/navigation/template.html",
      controller: "gu.components.navigation.Controller",

      link: function($scope, $element, $attributes){
        // your DOM manipulation logic for this component goes here
      }
    };
  }]);

}());

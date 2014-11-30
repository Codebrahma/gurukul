(function(){

  var app = angular.module("gu.components.footer");

  app.directive("guFooter", [function(){
    return{
      scope: {
        currentSession: "="
      },
      replace: true,

      templateUrl: "app/scripts/components/footer/template.html",
      // controller: "gu.components.footer.Controller",

      link: function($scope, $element, $attributes){
        // your DOM manipulation logic for this component goes here
      }
    };
  }]);

}());

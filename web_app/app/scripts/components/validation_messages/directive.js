(function(){

  var app = angular.module("gu.components.validationMessages");

  app.directive("guValidationMessages", [function(){
    return{
      scope: {
        formElement: "=",
        validationTypes: "="
      },
      replace: true,

      templateUrl: "app/scripts/components/validation_messages/template.html",
      controller: "gu.components.validationMessages.Controller",

      link: function($scope, $element, $attributes){
        // your DOM manipulation logic for this component goes here
      }
    };
  }]);

}());

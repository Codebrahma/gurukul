(function(){

  var app = angular.module("gu.components.validationMessages");
  app.controller("gu.components.validationMessages.Controller",
  [ "$scope", function($scope) {

    function init(){
      $scope.messages = gu.messages.validation;
    };

    init();
  }]);

}());

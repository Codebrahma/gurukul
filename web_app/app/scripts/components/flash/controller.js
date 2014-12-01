(function(){
  var app = angular.module("gu.components.flash");
  app.controller("gu.components.flash.Controller", [ "$scope", "$rootScope",
    function($scope, $rootScope){
      function init(){
        $rootScope.$on("gu.events.flash", function(event, flashConfig){
          $scope.flashConfig = flashConfig;
          $scope.closeFlash = false;
        });

        $rootScope.$on('$routeChangeStart', function(event){
          $scope.flashConfig = null;
          $scope.closeFlash = true;
        });

        $scope.close = close;
      };

      function close(){
        $scope.closeFlash = true;
      };

      init();
    }
  ]);
}());

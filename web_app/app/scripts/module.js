'use strict';

angular.module('gu', [
  'gu.data',
  'gu.util',
  'gu.sections',
  'gu.components',
  'ngAnimate',
  'ngMessages',
  'ngRoute',
  'ngTouch',
  'LocalStorageModule',
])

.config(["$httpProvider", function ($httpProvider) {
  $httpProvider.interceptors.push(["$window", "$rootScope", "$q", "localStorageService",
    function ($window, $rootScope, $q, localStorageService) {
      function isCurrentUserPersisted(){
        return (localStorageService.get("currentUser") ? true : false);
      };

      return {
        response: function(response) {
          var d = response.data;

          if(!response.data.code){
            return response;
          };

          if(d.code == 200){
            response.data = d.message;
            return response;
          } else if(d.code == 400){
            // SHOW VALIDATION ERRORS
            $rootScope.$broadcast("kd.events.flash",{
              type: "danger",
              message: d.message
            });
          } else if(d.code == 5001 && isCurrentUserPersisted()){
            // SIGNOUT USER
            localStorageService.clearAll();
            $window.alert("Your session has expired. Please login to continue.");
            $window.location.href = "/";
          };

          return $q.reject(response.data);
        }
      };
  }]);
}]);

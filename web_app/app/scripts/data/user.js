(function(){
  var app = angular.module("gu.data");
  app.factory("gu.data.User",
    ["$resource", "$q", "localStorageService", "$window",

    function($resource, $q, localStorageService, $window){

      var User = $resource(gu.apiFor("users/:user_id/"),
        { id: "@id" }, {
          signIn: { method: "POST", url: '/users/sign_in' },
          signOut: { method: "DELETE", url: '/users/sign_out' }
        }
      ),
      proto = User.prototype;
      User.currentUser = null;

      User.login = function(u){
        var defer = $q.defer();
        User.signIn({user: u}).$promise.then(function(response){
          if(response.id) {
            // set the current user so that it is globally accessible
            newSession(response);
            defer.resolve();
          } else {
            defer.reject();
          };
        }, function(){
          defer.reject();
        });
        return defer.promise;
      };

      proto.logout = function(){
        var defer = $q.defer(),
            self = this;
        self.$signOut().then(function(response){
          if(response){
            clearSession();
            defer.resolve();
          } else {
            defer.reject();
          }
        }, function(){
          defer.reject();
        });
        return defer.promise;
      };

      User.getCurrentUser = function(){
        return User.currentUser;
      };

      User.isLoggedIn = function(){
        return User.reload().currentUser ? true : false;
      };

      // When the page is refreshed the current user is lost.
      // this function restores the current user from localStorage
      User.reload = function(){
        var localData = localStorageService.get('currentUser');
        if(localData){
          User.currentUser = new User(localStorageService.get('currentUser'));
        };
        return User;
      };

      function clearSession(){
        // clear the credentials cookies
        User.currentUser = null;
        // clear local storage
        localStorageService.clearAll();
      };

      function newSession(userJSON){
        User.currentUser = new User(userJSON);
        // set the object in localStorage for persistence
        localStorageService.set('currentUser', userJSON);
      };

      return User;
    }
  ]);

}());

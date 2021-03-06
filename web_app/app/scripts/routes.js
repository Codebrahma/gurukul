angular.module("gu")

.config(["$routeProvider",

function($routeProvider){
  //
  // Route resolutions
  //

  // This resolution is for the logged in user, ensures that the views are
  // rendered only if the user is logged in.
  var currentUser = {
    currentUser: ["gu.data.User", "$q", function(User, $q){
      // every time you open a new route let's make sure the current user
      // will be available even if the page is refreshed
      var defer = $q.defer();

      // reloads the current user from local storage
      User.reload();

      // resolve the promise
      defer.resolve();
      return defer.promise;
    }]
  };

  //
  // Route declarations
  //
  $routeProvider

  // Login Page
  .when('/login', {
    templateUrl: 'app/scripts/sections/session/login.html',
    controller: 'gu.sections.session.LoginController'
  })

  // Home index page
  .when('/home', {
    templateUrl: 'app/scripts/sections/home/index.html',
    resolve: currentUser
  })

  // Default Route
  .otherwise({
    redirectTo: '/login',
  });
}])

.run(["$rootScope", "gu.data.User", "$location", function($rootScope, User, $location){
  $rootScope.$on('$routeChangeStart', function(){
    if(!User.isLoggedIn()){
      $location.path('/login');
    } else {
      if($location.path() == "/login"){
        $location.path("/home");
      };
    };
  });
}]);

(function(){
  angular.module("gu")
  .controller("gu.MasterController",[ "$scope", "gu.data.User",
    function($scope, User){
      var self = this;

      function init(){
        self.messages = gu.messages;

        $scope.$root.$on('$routeChangeStart', function(event){
          if(User.isLoggedIn()){
            self.currentSession = true;
          } else {
            self.currentSession = false;
          };
        });
      };

      init();
    }
  ]);
}());

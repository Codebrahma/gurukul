(function(){
  angular.module("gu")
  .controller("gu.MasterController",[ "$scope",
    function($scope){
      var self = this;

      function init(){
        self.messages = gu.messages;
      };

      init();
    }
  ]);
}());

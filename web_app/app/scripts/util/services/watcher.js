angular.module("gu.util.services")
.factory("gu.util.services.Watcher", [ "$window", function( $window ){

  function Service(ctrlScope){
    this.ctrlScope = ctrlScope;
  };

  Service.prototype.setOnRefreshGroup = function(callback) {
    var self = this,
        r = self.ctrlScope.refreshOn || [ ];
    angular.forEach(r, function(prop){
      self.ctrlScope.$watch(function(){
        return self.ctrlScope[prop];
      }, function(nv, ov){
        callback(nv, ov);
      });
    });
  };

  Service.getInstance = function(ctrlScope){
    return new Service(ctrlScope);
  };

  return Service;
}]);

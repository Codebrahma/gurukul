angular.module("gu.util.services")
.service("gu.util.services.Constantizer",function( ){
   function convertToMethodName(name){
     splitted = name.toLowerCase().trim().replace(/[ \/,+-]/g, "_").replace(/_{2,}/g, "_").split("_");
     angular.forEach(splitted, function(str, index){
       splitted[index] = capitalizeFirst(str);
     });
     return uncapitalizeFirst(splitted.join(""));
   };

   function capitalizeFirst(str){
     return str.charAt(0).toUpperCase() + str.slice(1);
   };

   function uncapitalizeFirst(str){
     return str.charAt(0).toLowerCase() + str.slice(1);
   };

   return{
     forClass: function(klass){
       this.klass = klass
       return this;
     },
     onProperty: function(propName){
       this.propName = propName;
       return this;
     },
     withData: function(arr){
      var self = this;
      angular.forEach(arr, function(a){
        self.klass[convertToMethodName(a[self.propName])] = function(){
          return a;
        };
      });
     }
   };
});

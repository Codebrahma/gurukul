// GLOBAL NAMESPACE
var gu = { };

// GLOBAL CONSTANTS
gu.ROOT_API_URL = "/api/";

// GLOBAL FUNCTIONS
gu.apiFor = function(path){
  return gu.ROOT_API_URL + path;
};


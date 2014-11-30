angular.module('gu').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('app/scripts/components/footer/template.html',
    "<div class=\"container\">\n" +
    "  <div class=\"footer\">\n" +
    "    <p><span class=\"glyphicon glyphicon-heart\"></span> from the <a href=\"http://codebrahma.com\">Codebrahma</a> team.</p>\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('app/scripts/components/navigation/template.html',
    "<div class=\"container\">\n" +
    "  <div class=\"header\">\n" +
    "    <h3 class=\"text-muted\">Gurukul</h3>\n" +
    "\n" +
    "    <ul class=\"nav nav-pills pull-right\">\n" +
    "      <li data-ng-if=\"masterCtrl.currentSession\">\n" +
    "        <a data-ng-click=\"logout()\">Logout</a>\n" +
    "      </li>\n" +
    "    </ul>\n" +
    "  </div>\n" +
    "</div>\n"
  );


  $templateCache.put('app/scripts/sections/home/index.html',
    "<h1>Welcome</h1>\n"
  );


  $templateCache.put('app/scripts/sections/session/login.html',
    "<div class=\"container\">\n" +
    "  <div class=\"row\">\n" +
    "    <div class=\"col-md-4 col-md-offset-4\">\n" +
    "      <form name=\"login_form\" novalidate=\"novalidate\">\n" +
    "        <div class=\"form-group\">\n" +
    "          <input type=\"text\"\n" +
    "                 class=\"form-control\"\n" +
    "                 placeholder=\"Email\"\n" +
    "                 name=\"uid\"\n" +
    "                 required\n" +
    "                 data-ng-model=\"user.uid\" />\n" +
    "        </div>\n" +
    "        <div class=\"form-group\">\n" +
    "          <input type=\"password\"\n" +
    "                 class=\"form-control\"\n" +
    "                 placeholder=\"Password\"\n" +
    "                 name=\"password\"\n" +
    "                 required\n" +
    "                 data-ng-model=\"user.password\" />\n" +
    "        </div>\n" +
    "\n" +
    "        <button class=\"btn btn-primary btn-block\"\n" +
    "                role=\"button\"\n" +
    "                data-ng-disabled=\"login_form.$invalid\"\n" +
    "                data-ng-click=\"login()\">\n" +
    "                Login\n" +
    "        </button>\n" +
    "      </form>\n" +
    "    </div>\n" +
    "\n" +
    "  </div>\n" +
    "</div>\n"
  );

}]);

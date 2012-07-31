Inject.setModuleRoot("/javascripts/app/");
Inject.enableDebug(true);
Inject.addRule(/jquery/, {
  path: "vendor/jquery/jquery.js",
  pointcuts: {
    after: function() {
      module.setExports(jQuery.noConflict);
      delete window["jQuery"];
      return delete window["$"];
    }
  }
});
Inject.addRule(/jqueryui/, {
  path: "vendor/jquery/jquery-ui-1.8.21.custom.min.js",
  pointcuts: {
    before: function() {
      var jQuery;
      return jQuery = require("jquery");
    }
  }
});
Inject.addRule(/underscore/, {
  path: "vendor/underscore/underscore.js",
  pointcuts: {
    after: function() {
      module.setExports(_.noConflict);
      return delete window["_"];
    }
  }
});
Inject.addRule(/backbone/, {
  path: "vendor/backbone/backbone.js",
  pointcuts: {
    before: function() {
      var _;
      return _ = require("underscore");
    }
  }
});
require.run("bootloader");
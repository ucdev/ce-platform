/*! app/collections/activity_finledgers
* 	@requires: app,app/models/activity_finledger
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finledgers
*/
define("app/collections/activity_finledgers",["require","app","app/models"],function(require,app) {
	var Activity_finledgerModel = require("app/models/activity_finledger");

	var Activity_finledgers = app.Collection.extend({
		url: '/activity_finledgers/',
		model: Activity_finledgerModel
	});

	module.setExports(Activity_finledgers);
});

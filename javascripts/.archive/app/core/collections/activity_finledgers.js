/*! app/collections/activity_finledgers
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finledgers
*/
define("app/collections/activity_finledgers",function(require,app) {
	var Activity_finledgerModel = require("app/models/activity_finledger");

	app.collections.Activity_finledgers = app.Collection.extend({
		url: '/activity_finledgers/',
		model: Activity_finledgerModel
	});

	exports.app = app;
});

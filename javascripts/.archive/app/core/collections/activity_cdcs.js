/*! app/collections/activity_cdcs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_cdcs
*/
define("app/collections/activity_cdcs",function(require,app) {
	var Activity_cdcModel = require("app/models/activity_cdc");

	app.collections.Activity_cdcs = app.Collection.extend({
		url: '/activity_cdcs/',
		model: Activity_cdcModel
	});

	exports.app = app;
});

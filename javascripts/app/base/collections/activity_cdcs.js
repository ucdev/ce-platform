/*! app/collections/activity_cdcs
* 	@requires: app,app/models/activity_cdc
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_cdcs
*/
define("app/collections/activity_cdcs",["require","app","app/models"],function(require,app) {
	var Activity_cdcModel = require("app/models/activity_cdc");

	var Activity_cdcs = app.Collection.extend({
		url: '/activity_cdcs/',
		model: Activity_cdcModel
	});

	module.setExports(Activity_cdcs);
});

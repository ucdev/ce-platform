/*! app/collections/activity_cdcs
* 	@requires: app,app/collection,app/models/activity_cdc
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_cdcs
*/
define("app/collections/activity_cdcs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_cdcModel = require("app/models/activity_cdc");
	
	Activity_cdcs = AppCollection.extend({
		url: '/activity_cdcs/',
		model: Activity_cdcModel
	});

	module.setExports(Activity_cdcs);
});

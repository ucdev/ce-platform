/*! app/collections/activity_specialtylms
* 	@requires: app,app/models/activity_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_specialtylms
*/
define("app/collections/activity_specialtylms",["require","app","app/models"],function(require,app) {
	var Activity_specialtylmModel = require("app/models/activity_specialtylm");

	var Activity_specialtylms = app.Collection.extend({
		url: '/activity_specialtylms/',
		model: Activity_specialtylmModel
	});

	module.setExports(Activity_specialtylms);
});

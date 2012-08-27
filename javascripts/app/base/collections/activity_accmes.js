/*! app/collections/activity_accmes
* 	@requires: app,app/models/activity_accme
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_accmes
*/
define("app/collections/activity_accmes",["require","app","app/models"],function(require,app) {
	var Activity_accmeModel = require("app/models/activity_accme");

	var Activity_accmes = app.Collection.extend({
		url: '/activity_accmes/',
		model: Activity_accmeModel
	});

	module.setExports(Activity_accmes);
});

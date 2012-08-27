/*! app/collections/activity_accmes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_accmes
*/
define("app/collections/activity_accmes",function(require,app) {
	var Activity_accmeModel = require("app/models/activity_accme");

	app.collections.Activity_accmes = app.Collection.extend({
		url: '/activity_accmes/',
		model: Activity_accmeModel
	});

	exports.app = app;
});

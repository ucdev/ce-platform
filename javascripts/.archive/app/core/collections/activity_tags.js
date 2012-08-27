/*! app/collections/activity_tags
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tags
*/
define("app/collections/activity_tags",function(require,app) {
	var Activity_tagModel = require("app/models/activity_tag");

	app.collections.Activity_tags = app.Collection.extend({
		url: '/activity_tags/',
		model: Activity_tagModel
	});

	exports.app = app;
});

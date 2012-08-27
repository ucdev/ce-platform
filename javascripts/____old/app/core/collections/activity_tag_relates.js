/*! app/collections/activity_tag_relates
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tag_relates
*/
define("app/collections/activity_tag_relates",function(require,app) {
	var Activity_tag_relateModel = require("app/models/activity_tag_relate");

	app.collections.Activity_tag_relates = app.Collection.extend({
		url: '/activity_tag_relates/',
		model: Activity_tag_relateModel
	});

	exports.app = app;
});

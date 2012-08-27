/*! app/collections/activity_tag_relates
* 	@requires: app,app/models/activity_tag_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tag_relates
*/
define("app/collections/activity_tag_relates",["require","app","app/models"],function(require,app) {
	var Activity_tag_relateModel = require("app/models/activity_tag_relate");

	var Activity_tag_relates = app.Collection.extend({
		url: '/activity_tag_relates/',
		model: Activity_tag_relateModel
	});

	module.setExports(Activity_tag_relates);
});

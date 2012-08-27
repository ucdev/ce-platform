/*! app/collections/activity_tags
* 	@requires: app,app/models/activity_tag
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tags
*/
define("app/collections/activity_tags",["require","app","app/models"],function(require,app) {
	var Activity_tagModel = require("app/models/activity_tag");

	var Activity_tags = app.Collection.extend({
		url: '/activity_tags/',
		model: Activity_tagModel
	});

	module.setExports(Activity_tags);
});

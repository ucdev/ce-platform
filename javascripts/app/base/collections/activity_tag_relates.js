/*! app/collections/activity_tag_relates
* 	@requires: app,app/collection,app/models/activity_tag_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tag_relates
*/
define("app/collections/activity_tag_relates",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_tag_relateModel = require("app/models/activity_tag_relate");
	
	Activity_tag_relates = AppCollection.extend({
		url: '/activity_tag_relates/',
		model: Activity_tag_relateModel
	});

	module.setExports(Activity_tag_relates);
});

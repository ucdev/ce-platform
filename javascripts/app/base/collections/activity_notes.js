/*! app/collections/activity_notes
* 	@requires: app,app/models/activity_note
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_notes
*/
define("app/collections/activity_notes",["require","app","app/models"],function(require,app) {
	var Activity_noteModel = require("app/models/activity_note");

	var Activity_notes = app.Collection.extend({
		url: '/activity_notes/',
		model: Activity_noteModel
	});

	module.setExports(Activity_notes);
});

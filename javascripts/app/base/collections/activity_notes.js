/*! app/collections/activity_notes
* 	@requires: app,app/collection,app/models/activity_note
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_notes
*/
define("app/collections/activity_notes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_noteModel = require("app/models/activity_note");
	
	Activity_notes = AppCollection.extend({
		url: '/activity_notes/',
		model: Activity_noteModel
	});

	module.setExports(Activity_notes);
});

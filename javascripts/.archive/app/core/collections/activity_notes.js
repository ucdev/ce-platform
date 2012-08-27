/*! app/collections/activity_notes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_notes
*/
define("app/collections/activity_notes",function(require,app) {
	var Activity_noteModel = require("app/models/activity_note");

	app.collections.Activity_notes = app.Collection.extend({
		url: '/activity_notes/',
		model: Activity_noteModel
	});

	exports.app = app;
});

/*! app/collections/person_notes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_notes
*/
define("app/collections/person_notes",function(require,app) {
	var Person_noteModel = require("app/models/person_note");

	app.collections.Person_notes = app.Collection.extend({
		url: '/person_notes/',
		model: Person_noteModel
	});

	exports.app = app;
});

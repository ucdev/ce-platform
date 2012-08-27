/*! app/collections/person_notes
* 	@requires: app,app/models/person_note
* 	@extends: app.Collection
* 	@exports: app.collections.Person_notes
*/
define("app/collections/person_notes",["require","app","app/models"],function(require,app) {
	var Person_noteModel = require("app/models/person_note");

	var Person_notes = app.Collection.extend({
		url: '/person_notes/',
		model: Person_noteModel
	});

	module.setExports(Person_notes);
});

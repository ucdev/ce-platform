/*! app/collections/person_notes
* 	@requires: app,app/collection,app/models/person_note
* 	@extends: app.Collection
* 	@exports: app.collections.Person_notes
*/
define("app/collections/person_notes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_noteModel = require("app/models/person_note");
	
	Person_notes = AppCollection.extend({
		url: '/person_notes/',
		model: Person_noteModel
	});

	module.setExports(Person_notes);
});

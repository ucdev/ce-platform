/*! app/collections/person_prefs
* 	@requires: app,app/collection,app/models/person_pref
* 	@extends: app.Collection
* 	@exports: app.collections.Person_prefs
*/
define("app/collections/person_prefs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Person_prefModel = require("app/models/person_pref");
	
	Person_prefs = AppCollection.extend({
		url: '/person_prefs/',
		model: Person_prefModel
	});

	module.setExports(Person_prefs);
});

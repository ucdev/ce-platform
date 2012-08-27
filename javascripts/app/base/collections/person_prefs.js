/*! app/collections/person_prefs
* 	@requires: app,app/models/person_pref
* 	@extends: app.Collection
* 	@exports: app.collections.Person_prefs
*/
define("app/collections/person_prefs",["require","app","app/models"],function(require,app) {
	var Person_prefModel = require("app/models/person_pref");

	var Person_prefs = app.Collection.extend({
		url: '/person_prefs/',
		model: Person_prefModel
	});

	module.setExports(Person_prefs);
});

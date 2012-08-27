/*! app/collections/person_prefs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Person_prefs
*/
define("app/collections/person_prefs",function(require,app) {
	var Person_prefModel = require("app/models/person_pref");

	app.collections.Person_prefs = app.Collection.extend({
		url: '/person_prefs/',
		model: Person_prefModel
	});

	exports.app = app;
});

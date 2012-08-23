/*! app/core/collections/Person_prefs */
define("app/core/collections/Person_prefs",function() {
	var Person_prefs = Backbone.Collection.extend({
			url: '/person_prefs/',
			model: models.Person_pref
		});

	exports.Person_prefs = Person_prefs;
});

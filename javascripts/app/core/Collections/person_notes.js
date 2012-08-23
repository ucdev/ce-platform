/*! app/core/collections/Person_notes */
define("app/core/collections/Person_notes",function() {
	var Person_notes = Backbone.Collection.extend({
			url: '/person_notes/',
			model: models.Person_note
		});

	exports.Person_notes = Person_notes;
});

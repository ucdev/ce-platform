/*! app/core/collections/Person_interest_excepts */
define("app/core/collections/Person_interest_excepts",function() {
	var Person_interest_excepts = Backbone.Collection.extend({
			url: '/person_interest_excepts/',
			model: models.Person_interest_except
		});

	exports.Person_interest_excepts = Person_interest_excepts;
});

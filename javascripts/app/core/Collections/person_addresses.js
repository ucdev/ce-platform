/*! app/core/collections/Person_addresses */
define("app/core/collections/Person_addresses",function() {
	var Person_addresses = Backbone.Collection.extend({
			url: '/person_addresses/',
			model: models.Person_address
		});

	exports.Person_addresses = Person_addresses;
});

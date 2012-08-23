/*! app/core/collections/Person_clients */
define("app/core/collections/Person_clients",function() {
	var Person_clients = Backbone.Collection.extend({
			url: '/person_clients/',
			model: models.Person_client
		});

	exports.Person_clients = Person_clients;
});

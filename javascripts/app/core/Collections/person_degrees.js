/*! app/core/collections/Person_degrees */
define("app/core/collections/Person_degrees",function() {
	var Person_degrees = Backbone.Collection.extend({
			url: '/person_degrees/',
			model: models.Person_degree
		});

	exports.Person_degrees = Person_degrees;
});

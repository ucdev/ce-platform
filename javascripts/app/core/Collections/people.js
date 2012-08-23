/*! app/core/collections/People */
define("app/core/collections/People",function() {
	var People = Backbone.Collection.extend({
			url: '/people/',
			model: models.Person
		});

	exports.People = People;
});

/*! app/core/collections/Occupations */
define("app/core/collections/Occupations",function() {
	var Occupations = Backbone.Collection.extend({
			url: '/occupations/',
			model: models.Occupation
		});

	exports.Occupations = Occupations;
});

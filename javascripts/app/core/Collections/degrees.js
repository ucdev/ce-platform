/*! app/core/collections/Degrees */
define("app/core/collections/Degrees",function() {
	var Degrees = Backbone.Collection.extend({
			url: '/degrees/',
			model: models.Degree
		});

	exports.Degrees = Degrees;
});

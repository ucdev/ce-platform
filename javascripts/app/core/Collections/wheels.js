/*! app/core/collections/Wheels */
define("app/core/collections/Wheels",function() {
	var Wheels = Backbone.Collection.extend({
			url: '/wheels/',
			model: models.Wheel
		});

	exports.Wheels = Wheels;
});

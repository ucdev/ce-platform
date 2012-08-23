/*! app/core/collections/Locations */
define("app/core/collections/Locations",function() {
	var Locations = Backbone.Collection.extend({
			url: '/locations/',
			model: models.Location
		});

	exports.Locations = Locations;
});

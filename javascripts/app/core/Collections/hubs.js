/*! app/core/collections/Hubs */
define("app/core/collections/Hubs",function() {
	var Hubs = Backbone.Collection.extend({
			url: '/hubs/',
			model: models.Hub
		});

	exports.Hubs = Hubs;
});

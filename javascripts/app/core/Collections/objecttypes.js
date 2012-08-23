/*! app/core/collections/Objecttypes */
define("app/core/collections/Objecttypes",function() {
	var Objecttypes = Backbone.Collection.extend({
			url: '/objecttypes/',
			model: models.Objecttype
		});

	exports.Objecttypes = Objecttypes;
});

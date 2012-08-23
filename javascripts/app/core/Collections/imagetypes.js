/*! app/core/collections/Imagetypes */
define("app/core/collections/Imagetypes",function() {
	var Imagetypes = Backbone.Collection.extend({
			url: '/imagetypes/',
			model: models.Imagetype
		});

	exports.Imagetypes = Imagetypes;
});

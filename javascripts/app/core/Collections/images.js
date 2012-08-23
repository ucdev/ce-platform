/*! app/core/collections/Images */
define("app/core/collections/Images",function() {
	var Images = Backbone.Collection.extend({
			url: '/images/',
			model: models.Image
		});

	exports.Images = Images;
});

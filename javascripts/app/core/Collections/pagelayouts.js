/*! app/core/collections/Pagelayouts */
define("app/core/collections/Pagelayouts",function() {
	var Pagelayouts = Backbone.Collection.extend({
			url: '/pagelayouts/',
			model: models.Pagelayout
		});

	exports.Pagelayouts = Pagelayouts;
});

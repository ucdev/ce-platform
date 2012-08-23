/*! app/core/collections/Pages */
define("app/core/collections/Pages",function() {
	var Pages = Backbone.Collection.extend({
			url: '/pages/',
			model: models.Page
		});

	exports.Pages = Pages;
});

/*! app/core/collections/Models */
define("app/core/collections/Models",function() {
	var Models = Backbone.Collection.extend({
			url: '/models/',
			model: models.Model
		});

	exports.Models = Models;
});

/*! app/core/collections/Categories */
define("app/core/collections/Categories",function() {
	var Categories = Backbone.Collection.extend({
			url: '/categories/',
			model: models.Category
		});

	exports.Categories = Categories;
});

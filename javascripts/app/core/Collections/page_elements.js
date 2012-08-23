/*! app/core/collections/Page_elements */
define("app/core/collections/Page_elements",function() {
	var Page_elements = Backbone.Collection.extend({
			url: '/page_elements/',
			model: models.Page_element
		});

	exports.Page_elements = Page_elements;
});

/*! app/core/collections/Page_sections */
define("app/core/collections/Page_sections",function() {
	var Page_sections = Backbone.Collection.extend({
			url: '/page_sections/',
			model: models.Page_section
		});

	exports.Page_sections = Page_sections;
});

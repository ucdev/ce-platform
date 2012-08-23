/*! app/core/collections/Pagelayoutmenu_pages */
define("app/core/collections/Pagelayoutmenu_pages",function() {
	var Pagelayoutmenu_pages = Backbone.Collection.extend({
			url: '/pagelayoutmenu_pages/',
			model: models.Pagelayoutmenu_page
		});

	exports.Pagelayoutmenu_pages = Pagelayoutmenu_pages;
});

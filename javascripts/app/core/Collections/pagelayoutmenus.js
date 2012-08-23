/*! app/core/collections/Pagelayoutmenus */
define("app/core/collections/Pagelayoutmenus",function() {
	var Pagelayoutmenus = Backbone.Collection.extend({
			url: '/pagelayoutmenus/',
			model: models.Pagelayoutmenu
		});

	exports.Pagelayoutmenus = Pagelayoutmenus;
});

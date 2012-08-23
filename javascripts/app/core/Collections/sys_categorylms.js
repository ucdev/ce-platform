/*! app/core/collections/Sys_categorylms */
define("app/core/collections/Sys_categorylms",function() {
	var Sys_categorylms = Backbone.Collection.extend({
			url: '/sys_categorylms/',
			model: models.Sys_categorylm
		});

	exports.Sys_categorylms = Sys_categorylms;
});

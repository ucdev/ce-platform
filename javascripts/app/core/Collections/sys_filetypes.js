/*! app/core/collections/Sys_filetypes */
define("app/core/collections/Sys_filetypes",function() {
	var Sys_filetypes = Backbone.Collection.extend({
			url: '/sys_filetypes/',
			model: models.Sys_filetype
		});

	exports.Sys_filetypes = Sys_filetypes;
});

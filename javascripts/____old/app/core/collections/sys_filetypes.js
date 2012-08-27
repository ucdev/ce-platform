/*! app/collections/sys_filetypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_filetypes
*/
define("app/collections/sys_filetypes",function(require,app) {
	var Sys_filetypeModel = require("app/models/sys_filetype");

	app.collections.Sys_filetypes = app.Collection.extend({
		url: '/sys_filetypes/',
		model: Sys_filetypeModel
	});

	exports.app = app;
});

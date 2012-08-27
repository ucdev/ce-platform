/*! app/collections/sys_filetypes
* 	@requires: app,app/models/sys_filetype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_filetypes
*/
define("app/collections/sys_filetypes",["require","app","app/models"],function(require,app) {
	var Sys_filetypeModel = require("app/models/sys_filetype");

	var Sys_filetypes = app.Collection.extend({
		url: '/sys_filetypes/',
		model: Sys_filetypeModel
	});

	module.setExports(Sys_filetypes);
});

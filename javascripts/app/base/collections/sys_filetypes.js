/*! app/collections/sys_filetypes
* 	@requires: app,app/collection,app/models/sys_filetype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_filetypes
*/
define("app/collections/sys_filetypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_filetypeModel = require("app/models/sys_filetype");
	
	Sys_filetypes = AppCollection.extend({
		url: '/sys_filetypes/',
		model: Sys_filetypeModel
	});

	module.setExports(Sys_filetypes);
});

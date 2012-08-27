/*! app/collections/sys_emailstyles
* 	@requires: app,app/collection,app/models/sys_emailstyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_emailstyles
*/
define("app/collections/sys_emailstyles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_emailstyleModel = require("app/models/sys_emailstyle");
	
	Sys_emailstyles = AppCollection.extend({
		url: '/sys_emailstyles/',
		model: Sys_emailstyleModel
	});

	module.setExports(Sys_emailstyles);
});

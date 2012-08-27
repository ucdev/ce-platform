/*! app/collections/sys_emailstyles
* 	@requires: app,app/models/sys_emailstyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_emailstyles
*/
define("app/collections/sys_emailstyles",["require","app","app/models"],function(require,app) {
	var Sys_emailstyleModel = require("app/models/sys_emailstyle");

	var Sys_emailstyles = app.Collection.extend({
		url: '/sys_emailstyles/',
		model: Sys_emailstyleModel
	});

	module.setExports(Sys_emailstyles);
});

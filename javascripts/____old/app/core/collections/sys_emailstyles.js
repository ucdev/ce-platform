/*! app/collections/sys_emailstyles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_emailstyles
*/
define("app/collections/sys_emailstyles",function(require,app) {
	var Sys_emailstyleModel = require("app/models/sys_emailstyle");

	app.collections.Sys_emailstyles = app.Collection.extend({
		url: '/sys_emailstyles/',
		model: Sys_emailstyleModel
	});

	exports.app = app;
});

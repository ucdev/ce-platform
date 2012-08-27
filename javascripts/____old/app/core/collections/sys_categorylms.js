/*! app/collections/sys_categorylms
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_categorylms
*/
define("app/collections/sys_categorylms",function(require,app) {
	var Sys_categorylmModel = require("app/models/sys_categorylm");

	app.collections.Sys_categorylms = app.Collection.extend({
		url: '/sys_categorylms/',
		model: Sys_categorylmModel
	});

	exports.app = app;
});

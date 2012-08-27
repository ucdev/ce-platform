/*! app/collections/sys_categorylms
* 	@requires: app,app/models/sys_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_categorylms
*/
define("app/collections/sys_categorylms",["require","app","app/models"],function(require,app) {
	var Sys_categorylmModel = require("app/models/sys_categorylm");

	var Sys_categorylms = app.Collection.extend({
		url: '/sys_categorylms/',
		model: Sys_categorylmModel
	});

	module.setExports(Sys_categorylms);
});

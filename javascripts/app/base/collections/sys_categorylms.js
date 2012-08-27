/*! app/collections/sys_categorylms
* 	@requires: app,app/collection,app/models/sys_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_categorylms
*/
define("app/collections/sys_categorylms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Sys_categorylmModel = require("app/models/sys_categorylm");
	
	Sys_categorylms = AppCollection.extend({
		url: '/sys_categorylms/',
		model: Sys_categorylmModel
	});

	module.setExports(Sys_categorylms);
});

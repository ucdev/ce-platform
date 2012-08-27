/*! app/collections/processmanagers
* 	@requires: app,app/collection,app/models/processmanager
* 	@extends: app.Collection
* 	@exports: app.collections.Processmanagers
*/
define("app/collections/processmanagers",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ProcessmanagerModel = require("app/models/processmanager");
	
	Processmanagers = AppCollection.extend({
		url: '/processmanagers/',
		model: ProcessmanagerModel
	});

	module.setExports(Processmanagers);
});

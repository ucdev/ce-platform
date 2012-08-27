/*! app/collections/processsteps
* 	@requires: app,app/collection,app/models/processstep
* 	@extends: app.Collection
* 	@exports: app.collections.Processsteps
*/
define("app/collections/processsteps",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ProcessstepModel = require("app/models/processstep");
	
	Processsteps = AppCollection.extend({
		url: '/processsteps/',
		model: ProcessstepModel
	});

	module.setExports(Processsteps);
});

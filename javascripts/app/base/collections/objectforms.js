/*! app/collections/objectforms
* 	@requires: app,app/collection,app/models/objectform
* 	@extends: app.Collection
* 	@exports: app.collections.Objectforms
*/
define("app/collections/objectforms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjectformModel = require("app/models/objectform");
	
	Objectforms = AppCollection.extend({
		url: '/objectforms/',
		model: ObjectformModel
	});

	module.setExports(Objectforms);
});

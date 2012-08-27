/*! app/collections/objectdatas
* 	@requires: app,app/collection,app/models/objectdatum
* 	@extends: app.Collection
* 	@exports: app.collections.Objectdatas
*/
define("app/collections/objectdatas",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjectdatumModel = require("app/models/objectdatum");
	
	Objectdatas = AppCollection.extend({
		url: '/objectdatas/',
		model: ObjectdatumModel
	});

	module.setExports(Objectdatas);
});

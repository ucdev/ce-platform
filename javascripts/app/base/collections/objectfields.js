/*! app/collections/objectfields
* 	@requires: app,app/collection,app/models/objectfield
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfields
*/
define("app/collections/objectfields",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjectfieldModel = require("app/models/objectfield");
	
	Objectfields = AppCollection.extend({
		url: '/objectfields/',
		model: ObjectfieldModel
	});

	module.setExports(Objectfields);
});

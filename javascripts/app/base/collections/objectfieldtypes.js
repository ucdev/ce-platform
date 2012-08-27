/*! app/collections/objectfieldtypes
* 	@requires: app,app/collection,app/models/objectfieldtype
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfieldtypes
*/
define("app/collections/objectfieldtypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjectfieldtypeModel = require("app/models/objectfieldtype");
	
	Objectfieldtypes = AppCollection.extend({
		url: '/objectfieldtypes/',
		model: ObjectfieldtypeModel
	});

	module.setExports(Objectfieldtypes);
});

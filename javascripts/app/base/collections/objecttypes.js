/*! app/collections/objecttypes
* 	@requires: app,app/collection,app/models/objecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Objecttypes
*/
define("app/collections/objecttypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjecttypeModel = require("app/models/objecttype");
	
	Objecttypes = AppCollection.extend({
		url: '/objecttypes/',
		model: ObjecttypeModel
	});

	module.setExports(Objecttypes);
});

/*! app/collections/objects
* 	@requires: app,app/collection,app/models/object
* 	@extends: app.Collection
* 	@exports: app.collections.Objects
*/
define("app/collections/objects",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ObjectModel = require("app/models/object");
	
	Objects = AppCollection.extend({
		url: '/objects/',
		model: ObjectModel
	});

	module.setExports(Objects);
});

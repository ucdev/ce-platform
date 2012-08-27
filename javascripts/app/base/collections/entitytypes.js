/*! app/collections/entitytypes
* 	@requires: app,app/collection,app/models/entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entitytypes
*/
define("app/collections/entitytypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var EntitytypeModel = require("app/models/entitytype");
	
	Entitytypes = AppCollection.extend({
		url: '/entitytypes/',
		model: EntitytypeModel
	});

	module.setExports(Entitytypes);
});

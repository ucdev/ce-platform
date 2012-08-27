/*! app/collections/entity_entitytypes
* 	@requires: app,app/collection,app/models/entity_entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entitytypes
*/
define("app/collections/entity_entitytypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_entitytypeModel = require("app/models/entity_entitytype");
	
	Entity_entitytypes = AppCollection.extend({
		url: '/entity_entitytypes/',
		model: Entity_entitytypeModel
	});

	module.setExports(Entity_entitytypes);
});

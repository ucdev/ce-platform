/*! app/collections/entities
* 	@requires: app,app/collection,app/models/entity
* 	@extends: app.Collection
* 	@exports: app.collections.Entities
*/
define("app/collections/entities",["require"],function(require) {
	var AppCollection = require("app/collection");
	var EntityModel = require("app/models/entity");
	
	Entities = AppCollection.extend({
		url: '/entities/',
		model: EntityModel
	});

	module.setExports(Entities);
});

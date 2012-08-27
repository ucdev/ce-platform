/*! app/collections/entity_persons
* 	@requires: app,app/collection,app/models/entity_person
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_persons
*/
define("app/collections/entity_persons",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_personModel = require("app/models/entity_person");
	
	Entity_persons = AppCollection.extend({
		url: '/entity_persons/',
		model: Entity_personModel
	});

	module.setExports(Entity_persons);
});

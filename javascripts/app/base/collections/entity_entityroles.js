/*! app/collections/entity_entityroles
* 	@requires: app,app/collection,app/models/entity_entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entityroles
*/
define("app/collections/entity_entityroles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_entityroleModel = require("app/models/entity_entityrole");
	
	Entity_entityroles = AppCollection.extend({
		url: '/entity_entityroles/',
		model: Entity_entityroleModel
	});

	module.setExports(Entity_entityroles);
});

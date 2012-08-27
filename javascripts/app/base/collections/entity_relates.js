/*! app/collections/entity_relates
* 	@requires: app,app/collection,app/models/entity_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_relates
*/
define("app/collections/entity_relates",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_relateModel = require("app/models/entity_relate");
	
	Entity_relates = AppCollection.extend({
		url: '/entity_relates/',
		model: Entity_relateModel
	});

	module.setExports(Entity_relates);
});

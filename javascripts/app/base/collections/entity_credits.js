/*! app/collections/entity_credits
* 	@requires: app,app/collection,app/models/entity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_credits
*/
define("app/collections/entity_credits",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Entity_creditModel = require("app/models/entity_credit");
	
	Entity_credits = AppCollection.extend({
		url: '/entity_credits/',
		model: Entity_creditModel
	});

	module.setExports(Entity_credits);
});

/*! app/collections/entity_credits
* 	@requires: app,app/models/entity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_credits
*/
define("app/collections/entity_credits",["require","app","app/models"],function(require,app) {
	var Entity_creditModel = require("app/models/entity_credit");

	var Entity_credits = app.Collection.extend({
		url: '/entity_credits/',
		model: Entity_creditModel
	});

	module.setExports(Entity_credits);
});

/*! app/collections/entity_credits
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_credits
*/
define("app/collections/entity_credits",function(require,app) {
	var Entity_creditModel = require("app/models/entity_credit");

	app.collections.Entity_credits = app.Collection.extend({
		url: '/entity_credits/',
		model: Entity_creditModel
	});

	exports.app = app;
});

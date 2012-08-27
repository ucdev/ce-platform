/*! app/collections/entity_entityroles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entityroles
*/
define("app/collections/entity_entityroles",function(require,app) {
	var Entity_entityroleModel = require("app/models/entity_entityrole");

	app.collections.Entity_entityroles = app.Collection.extend({
		url: '/entity_entityroles/',
		model: Entity_entityroleModel
	});

	exports.app = app;
});

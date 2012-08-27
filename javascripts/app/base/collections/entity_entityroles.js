/*! app/collections/entity_entityroles
* 	@requires: app,app/models/entity_entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entityroles
*/
define("app/collections/entity_entityroles",["require","app","app/models"],function(require,app) {
	var Entity_entityroleModel = require("app/models/entity_entityrole");

	var Entity_entityroles = app.Collection.extend({
		url: '/entity_entityroles/',
		model: Entity_entityroleModel
	});

	module.setExports(Entity_entityroles);
});

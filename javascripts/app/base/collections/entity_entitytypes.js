/*! app/collections/entity_entitytypes
* 	@requires: app,app/models/entity_entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entitytypes
*/
define("app/collections/entity_entitytypes",["require","app","app/models"],function(require,app) {
	var Entity_entitytypeModel = require("app/models/entity_entitytype");

	var Entity_entitytypes = app.Collection.extend({
		url: '/entity_entitytypes/',
		model: Entity_entitytypeModel
	});

	module.setExports(Entity_entitytypes);
});

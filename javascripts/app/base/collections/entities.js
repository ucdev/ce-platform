/*! app/collections/entities
* 	@requires: app,app/models/entity
* 	@extends: app.Collection
* 	@exports: app.collections.Entities
*/
define("app/collections/entities",["require","app","app/models"],function(require,app) {
	var EntityModel = require("app/models/entity");

	var Entities = app.Collection.extend({
		url: '/entities/',
		model: EntityModel
	});

	module.setExports(Entities);
});

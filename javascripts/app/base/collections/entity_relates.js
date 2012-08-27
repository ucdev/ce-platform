/*! app/collections/entity_relates
* 	@requires: app,app/models/entity_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_relates
*/
define("app/collections/entity_relates",["require","app","app/models"],function(require,app) {
	var Entity_relateModel = require("app/models/entity_relate");

	var Entity_relates = app.Collection.extend({
		url: '/entity_relates/',
		model: Entity_relateModel
	});

	module.setExports(Entity_relates);
});

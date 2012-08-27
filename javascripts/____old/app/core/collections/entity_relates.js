/*! app/collections/entity_relates
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_relates
*/
define("app/collections/entity_relates",function(require,app) {
	var Entity_relateModel = require("app/models/entity_relate");

	app.collections.Entity_relates = app.Collection.extend({
		url: '/entity_relates/',
		model: Entity_relateModel
	});

	exports.app = app;
});

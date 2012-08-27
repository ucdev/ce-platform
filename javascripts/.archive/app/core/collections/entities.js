/*! app/collections/entities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entities
*/
define("app/collections/entities",function(require,app) {
	var EntityModel = require("app/models/entity");

	app.collections.Entities = app.Collection.extend({
		url: '/entities/',
		model: EntityModel
	});

	exports.app = app;
});

/*! app/collections/entity_entitytypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entitytypes
*/
define("app/collections/entity_entitytypes",function(require,app) {
	var Entity_entitytypeModel = require("app/models/entity_entitytype");

	app.collections.Entity_entitytypes = app.Collection.extend({
		url: '/entity_entitytypes/',
		model: Entity_entitytypeModel
	});

	exports.app = app;
});

/*! app/collections/entity_persons
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_persons
*/
define("app/collections/entity_persons",function(require,app) {
	var Entity_personModel = require("app/models/entity_person");

	app.collections.Entity_persons = app.Collection.extend({
		url: '/entity_persons/',
		model: Entity_personModel
	});

	exports.app = app;
});

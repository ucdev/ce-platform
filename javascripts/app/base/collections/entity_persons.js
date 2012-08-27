/*! app/collections/entity_persons
* 	@requires: app,app/models/entity_person
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_persons
*/
define("app/collections/entity_persons",["require","app","app/models"],function(require,app) {
	var Entity_personModel = require("app/models/entity_person");

	var Entity_persons = app.Collection.extend({
		url: '/entity_persons/',
		model: Entity_personModel
	});

	module.setExports(Entity_persons);
});

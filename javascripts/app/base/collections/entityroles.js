/*! app/collections/entityroles
* 	@requires: app,app/collection,app/models/entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entityroles
*/
define("app/collections/entityroles",["require"],function(require) {
	var AppCollection = require("app/collection");
	var EntityroleModel = require("app/models/entityrole");
	
	Entityroles = AppCollection.extend({
		url: '/entityroles/',
		model: EntityroleModel
	});

	module.setExports(Entityroles);
});

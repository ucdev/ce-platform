/*! app/collections/entityroles
* 	@requires: app,app/models/entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entityroles
*/
define("app/collections/entityroles",["require","app","app/models"],function(require,app) {
	var EntityroleModel = require("app/models/entityrole");

	var Entityroles = app.Collection.extend({
		url: '/entityroles/',
		model: EntityroleModel
	});

	module.setExports(Entityroles);
});

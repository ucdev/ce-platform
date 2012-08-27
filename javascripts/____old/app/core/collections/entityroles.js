/*! app/collections/entityroles
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entityroles
*/
define("app/collections/entityroles",function(require,app) {
	var EntityroleModel = require("app/models/entityrole");

	app.collections.Entityroles = app.Collection.extend({
		url: '/entityroles/',
		model: EntityroleModel
	});

	exports.app = app;
});

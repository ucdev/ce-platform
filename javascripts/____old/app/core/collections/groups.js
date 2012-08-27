/*! app/collections/groups
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Groups
*/
define("app/collections/groups",function(require,app) {
	var GroupModel = require("app/models/group");

	app.collections.Groups = app.Collection.extend({
		url: '/groups/',
		model: GroupModel
	});

	exports.app = app;
});

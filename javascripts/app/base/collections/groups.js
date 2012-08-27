/*! app/collections/groups
* 	@requires: app,app/models/group
* 	@extends: app.Collection
* 	@exports: app.collections.Groups
*/
define("app/collections/groups",["require","app","app/models"],function(require,app) {
	var GroupModel = require("app/models/group");

	var Groups = app.Collection.extend({
		url: '/groups/',
		model: GroupModel
	});

	module.setExports(Groups);
});

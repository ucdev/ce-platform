/*! app/collections/groups
* 	@requires: app,app/collection,app/models/group
* 	@extends: app.Collection
* 	@exports: app.collections.Groups
*/
define("app/collections/groups",["require"],function(require) {
	var AppCollection = require("app/collection");
	var GroupModel = require("app/models/group");
	
	Groups = AppCollection.extend({
		url: '/groups/',
		model: GroupModel
	});

	module.setExports(Groups);
});

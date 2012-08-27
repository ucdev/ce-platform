/*! app/collections/actions
* 	@requires: app,app/collection,app/models/action
* 	@extends: app.Collection
* 	@exports: app.collections.Actions
*/
define("app/collections/actions",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ActionModel = require("app/models/action");
	
	Actions = AppCollection.extend({
		url: '/actions/',
		model: ActionModel
	});

	module.setExports(Actions);
});

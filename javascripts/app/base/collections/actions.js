/*! app/collections/actions
* 	@requires: app,app/models/action
* 	@extends: app.Collection
* 	@exports: app.collections.Actions
*/
define("app/collections/actions",["require","app","app/models"],function(require,app) {
	var ActionModel = require("app/models/action");

	var Actions = app.Collection.extend({
		url: '/actions/',
		model: ActionModel
	});

	module.setExports(Actions);
});

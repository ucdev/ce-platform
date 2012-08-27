/*! app/collections/actions
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Actions
*/
define("app/collections/actions",function(require,app) {
	var ActionModel = require("app/models/action");

	app.collections.Actions = app.Collection.extend({
		url: '/actions/',
		model: ActionModel
	});

	exports.app = app;
});

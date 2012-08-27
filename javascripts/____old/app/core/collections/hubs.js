/*! app/collections/hubs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Hubs
*/
define("app/collections/hubs",function(require,app) {
	var HubModel = require("app/models/hub");

	app.collections.Hubs = app.Collection.extend({
		url: '/hubs/',
		model: HubModel
	});

	exports.app = app;
});

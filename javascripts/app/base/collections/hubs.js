/*! app/collections/hubs
* 	@requires: app,app/models/hub
* 	@extends: app.Collection
* 	@exports: app.collections.Hubs
*/
define("app/collections/hubs",["require","app","app/models"],function(require,app) {
	var HubModel = require("app/models/hub");

	var Hubs = app.Collection.extend({
		url: '/hubs/',
		model: HubModel
	});

	module.setExports(Hubs);
});

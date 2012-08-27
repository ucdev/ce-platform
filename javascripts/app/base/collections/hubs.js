/*! app/collections/hubs
* 	@requires: app,app/collection,app/models/hub
* 	@extends: app.Collection
* 	@exports: app.collections.Hubs
*/
define("app/collections/hubs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var HubModel = require("app/models/hub");
	
	Hubs = AppCollection.extend({
		url: '/hubs/',
		model: HubModel
	});

	module.setExports(Hubs);
});

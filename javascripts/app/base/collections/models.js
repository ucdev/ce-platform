/*! app/collections/models
* 	@requires: app,app/collection,app/models/model
* 	@extends: app.Collection
* 	@exports: app.collections.Models
*/
define("app/collections/models",["require"],function(require) {
	var AppCollection = require("app/collection");
	var ModelModel = require("app/models/model");
	
	Models = AppCollection.extend({
		url: '/models/',
		model: ModelModel
	});

	module.setExports(Models);
});

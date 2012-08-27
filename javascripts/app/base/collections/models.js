/*! app/collections/models
* 	@requires: app,app/models/model
* 	@extends: app.Collection
* 	@exports: app.collections.Models
*/
define("app/collections/models",["require","app","app/models"],function(require,app) {
	var ModelModel = require("app/models/model");

	var Models = app.Collection.extend({
		url: '/models/',
		model: ModelModel
	});

	module.setExports(Models);
});

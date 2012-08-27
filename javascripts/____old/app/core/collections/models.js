/*! app/collections/models
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Models
*/
define("app/collections/models",function(require,app) {
	var ModelModel = require("app/models/model");

	app.collections.Models = app.Collection.extend({
		url: '/models/',
		model: ModelModel
	});

	exports.app = app;
});

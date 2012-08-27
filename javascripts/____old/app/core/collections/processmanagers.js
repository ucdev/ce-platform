/*! app/collections/processmanagers
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Processmanagers
*/
define("app/collections/processmanagers",function(require,app) {
	var ProcessmanagerModel = require("app/models/processmanager");

	app.collections.Processmanagers = app.Collection.extend({
		url: '/processmanagers/',
		model: ProcessmanagerModel
	});

	exports.app = app;
});

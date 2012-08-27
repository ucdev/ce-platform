/*! app/collections/entitytypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Entitytypes
*/
define("app/collections/entitytypes",function(require,app) {
	var EntitytypeModel = require("app/models/entitytype");

	app.collections.Entitytypes = app.Collection.extend({
		url: '/entitytypes/',
		model: EntitytypeModel
	});

	exports.app = app;
});

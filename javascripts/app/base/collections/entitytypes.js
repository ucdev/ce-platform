/*! app/collections/entitytypes
* 	@requires: app,app/models/entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entitytypes
*/
define("app/collections/entitytypes",["require","app","app/models"],function(require,app) {
	var EntitytypeModel = require("app/models/entitytype");

	var Entitytypes = app.Collection.extend({
		url: '/entitytypes/',
		model: EntitytypeModel
	});

	module.setExports(Entitytypes);
});

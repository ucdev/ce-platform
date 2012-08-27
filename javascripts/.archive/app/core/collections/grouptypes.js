/*! app/collections/grouptypes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Grouptypes
*/
define("app/collections/grouptypes",function(require,app) {
	var GrouptypeModel = require("app/models/grouptype");

	app.collections.Grouptypes = app.Collection.extend({
		url: '/grouptypes/',
		model: GrouptypeModel
	});

	exports.app = app;
});

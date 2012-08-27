/*! app/collections/grouptypes
* 	@requires: app,app/models/grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Grouptypes
*/
define("app/collections/grouptypes",["require","app","app/models"],function(require,app) {
	var GrouptypeModel = require("app/models/grouptype");

	var Grouptypes = app.Collection.extend({
		url: '/grouptypes/',
		model: GrouptypeModel
	});

	module.setExports(Grouptypes);
});

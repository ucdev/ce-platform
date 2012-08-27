/*! app/collections/grouptypes
* 	@requires: app,app/collection,app/models/grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Grouptypes
*/
define("app/collections/grouptypes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var GrouptypeModel = require("app/models/grouptype");
	
	Grouptypes = AppCollection.extend({
		url: '/grouptypes/',
		model: GrouptypeModel
	});

	module.setExports(Grouptypes);
});

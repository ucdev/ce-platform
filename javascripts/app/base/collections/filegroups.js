/*! app/collections/filegroups
* 	@requires: app,app/collection,app/models/filegroup
* 	@extends: app.Collection
* 	@exports: app.collections.Filegroups
*/
define("app/collections/filegroups",["require"],function(require) {
	var AppCollection = require("app/collection");
	var FilegroupModel = require("app/models/filegroup");
	
	Filegroups = AppCollection.extend({
		url: '/filegroups/',
		model: FilegroupModel
	});

	module.setExports(Filegroups);
});

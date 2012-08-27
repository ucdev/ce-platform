/*! app/collections/filegroups
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Filegroups
*/
define("app/collections/filegroups",function(require,app) {
	var FilegroupModel = require("app/models/filegroup");

	app.collections.Filegroups = app.Collection.extend({
		url: '/filegroups/',
		model: FilegroupModel
	});

	exports.app = app;
});

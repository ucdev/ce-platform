/*! app/collections/filegroups
* 	@requires: app,app/models/filegroup
* 	@extends: app.Collection
* 	@exports: app.collections.Filegroups
*/
define("app/collections/filegroups",["require","app","app/models"],function(require,app) {
	var FilegroupModel = require("app/models/filegroup");

	var Filegroups = app.Collection.extend({
		url: '/filegroups/',
		model: FilegroupModel
	});

	module.setExports(Filegroups);
});

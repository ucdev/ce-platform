/*! app/collections/processmanagers
* 	@requires: app,app/models/processmanager
* 	@extends: app.Collection
* 	@exports: app.collections.Processmanagers
*/
define("app/collections/processmanagers",["require","app","app/models"],function(require,app) {
	var ProcessmanagerModel = require("app/models/processmanager");

	var Processmanagers = app.Collection.extend({
		url: '/processmanagers/',
		model: ProcessmanagerModel
	});

	module.setExports(Processmanagers);
});

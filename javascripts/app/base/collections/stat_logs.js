/*! app/collections/stat_logs
* 	@requires: app,app/collection,app/models/stat_log
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_logs
*/
define("app/collections/stat_logs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Stat_logModel = require("app/models/stat_log");
	
	Stat_logs = AppCollection.extend({
		url: '/stat_logs/',
		model: Stat_logModel
	});

	module.setExports(Stat_logs);
});

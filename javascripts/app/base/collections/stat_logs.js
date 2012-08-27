/*! app/collections/stat_logs
* 	@requires: app,app/models/stat_log
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_logs
*/
define("app/collections/stat_logs",["require","app","app/models"],function(require,app) {
	var Stat_logModel = require("app/models/stat_log");

	var Stat_logs = app.Collection.extend({
		url: '/stat_logs/',
		model: Stat_logModel
	});

	module.setExports(Stat_logs);
});

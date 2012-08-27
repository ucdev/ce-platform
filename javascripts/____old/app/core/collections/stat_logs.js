/*! app/collections/stat_logs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_logs
*/
define("app/collections/stat_logs",function(require,app) {
	var Stat_logModel = require("app/models/stat_log");

	app.collections.Stat_logs = app.Collection.extend({
		url: '/stat_logs/',
		model: Stat_logModel
	});

	exports.app = app;
});

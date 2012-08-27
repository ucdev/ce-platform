/*! app/collections/histories
* 	@requires: app,app/models/history
* 	@extends: app.Collection
* 	@exports: app.collections.Histories
*/
define("app/collections/histories",["require","app","app/models"],function(require,app) {
	var HistoryModel = require("app/models/history");

	var Histories = app.Collection.extend({
		url: '/histories/',
		model: HistoryModel
	});

	module.setExports(Histories);
});

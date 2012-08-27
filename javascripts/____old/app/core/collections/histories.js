/*! app/collections/histories
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Histories
*/
define("app/collections/histories",function(require,app) {
	var HistoryModel = require("app/models/history");

	app.collections.Histories = app.Collection.extend({
		url: '/histories/',
		model: HistoryModel
	});

	exports.app = app;
});

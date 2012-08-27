/*! app/collections/histories
* 	@requires: app,app/collection,app/models/history
* 	@extends: app.Collection
* 	@exports: app.collections.Histories
*/
define("app/collections/histories",["require"],function(require) {
	var AppCollection = require("app/collection");
	var HistoryModel = require("app/models/history");
	
	Histories = AppCollection.extend({
		url: '/histories/',
		model: HistoryModel
	});

	module.setExports(Histories);
});

/*! app/collections/stat_entries
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_entries
*/
define("app/collections/stat_entries",function(require,app) {
	var Stat_entryModel = require("app/models/stat_entry");

	app.collections.Stat_entries = app.Collection.extend({
		url: '/stat_entries/',
		model: Stat_entryModel
	});

	exports.app = app;
});

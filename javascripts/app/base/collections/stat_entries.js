/*! app/collections/stat_entries
* 	@requires: app,app/collection,app/models/stat_entry
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_entries
*/
define("app/collections/stat_entries",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Stat_entryModel = require("app/models/stat_entry");
	
	Stat_entries = AppCollection.extend({
		url: '/stat_entries/',
		model: Stat_entryModel
	});

	module.setExports(Stat_entries);
});

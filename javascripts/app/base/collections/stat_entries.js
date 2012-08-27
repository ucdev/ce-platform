/*! app/collections/stat_entries
* 	@requires: app,app/models/stat_entry
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_entries
*/
define("app/collections/stat_entries",["require","app","app/models"],function(require,app) {
	var Stat_entryModel = require("app/models/stat_entry");

	var Stat_entries = app.Collection.extend({
		url: '/stat_entries/',
		model: Stat_entryModel
	});

	module.setExports(Stat_entries);
});

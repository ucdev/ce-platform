/*! app/core/collections/Stat_entries */
define("app/core/collections/Stat_entries",function() {
	var Stat_entries = Backbone.Collection.extend({
			url: '/stat_entries/',
			model: models.Stat_entry
		});

	exports.Stat_entries = Stat_entries;
});

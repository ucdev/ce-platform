/*! app/core/collections/Stat_logs */
define("app/core/collections/Stat_logs",function() {
	var Stat_logs = Backbone.Collection.extend({
			url: '/stat_logs/',
			model: models.Stat_log
		});

	exports.Stat_logs = Stat_logs;
});

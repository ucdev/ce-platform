/*! app/core/collections/Processes */
define("app/core/collections/Processes",function() {
	var Processes = Backbone.Collection.extend({
			url: '/processes/',
			model: models.Process
		});

	exports.Processes = Processes;
});

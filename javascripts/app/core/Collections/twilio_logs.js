/*! app/core/collections/Twilio_logs */
define("app/core/collections/Twilio_logs",function() {
	var Twilio_logs = Backbone.Collection.extend({
			url: '/twilio_logs/',
			model: models.Twilio_log
		});

	exports.Twilio_logs = Twilio_logs;
});

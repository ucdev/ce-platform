/*! app/collections/twilio_logs
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Twilio_logs
*/
define("app/collections/twilio_logs",function(require,app) {
	var Twilio_logModel = require("app/models/twilio_log");

	app.collections.Twilio_logs = app.Collection.extend({
		url: '/twilio_logs/',
		model: Twilio_logModel
	});

	exports.app = app;
});

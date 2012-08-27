/*! app/collections/twilio_logs
* 	@requires: app,app/models/twilio_log
* 	@extends: app.Collection
* 	@exports: app.collections.Twilio_logs
*/
define("app/collections/twilio_logs",["require","app","app/models"],function(require,app) {
	var Twilio_logModel = require("app/models/twilio_log");

	var Twilio_logs = app.Collection.extend({
		url: '/twilio_logs/',
		model: Twilio_logModel
	});

	module.setExports(Twilio_logs);
});

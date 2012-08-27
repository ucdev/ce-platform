/*! app/collections/twilio_logs
* 	@requires: app,app/collection,app/models/twilio_log
* 	@extends: app.Collection
* 	@exports: app.collections.Twilio_logs
*/
define("app/collections/twilio_logs",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Twilio_logModel = require("app/models/twilio_log");
	
	Twilio_logs = AppCollection.extend({
		url: '/twilio_logs/',
		model: Twilio_logModel
	});

	module.setExports(Twilio_logs);
});

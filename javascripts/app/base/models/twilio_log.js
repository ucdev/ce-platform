/*! app/models/twilio_log 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Twilio_log
*/
define("app/models/twilio_log",["require"],function(require) {
	var AppModel = require("app/model");
	var Twilio_logModel = AppModel.extend({
		url: function() {
			base = "/api/twilio_logs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Twilio_logModel)
});

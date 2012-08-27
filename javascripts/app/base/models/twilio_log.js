/*! app/models/twilio_log 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Twilio_log
*/
define("app/models/twilio_log",["require","app"],function(require,app) {
	var Twilio_logModel = app.Model.extend({
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

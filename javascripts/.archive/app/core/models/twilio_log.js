/*! app/models/twilio_log 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Twilio_log
*/
define("app/models/Twilio_log",function(require,app) {
	app.models.Twilio_log = app.Model.extend({
			url: function() {
				base = "/api/twilio_logs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

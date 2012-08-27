/*! app/models/attendee 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee
*/
define("app/models/Attendee",function(require,app) {
	app.models.Attendee = app.Model.extend({
			url: function() {
				base = "/api/attendees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

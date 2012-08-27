/*! app/models/attendee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee
*/
define("app/models/attendee",["require","app"],function(require,app) {
	var AttendeeModel = app.Model.extend({
		url: function() {
			base = "/api/attendees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeeModel)
});

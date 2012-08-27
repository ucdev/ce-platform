/*! app/models/attendee 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee
*/
define("app/models/attendee",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeeModel = AppModel.extend({
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

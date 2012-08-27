/*! app/models/attendee_step 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_step
*/
define("app/models/attendee_step",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_stepModel = AppModel.extend({
		url: function() {
			base = "/api/attendee_steps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_stepModel)
});

/*! app/models/attendee_step 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_step
*/
define("app/models/attendee_step",["require","app"],function(require,app) {
	var Attendee_stepModel = app.Model.extend({
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

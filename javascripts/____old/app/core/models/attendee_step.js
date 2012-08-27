/*! app/models/attendee_step 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_step
*/
define("app/models/Attendee_step",function(require,app) {
	app.models.Attendee_step = app.Model.extend({
			url: function() {
				base = "/api/attendee_steps/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

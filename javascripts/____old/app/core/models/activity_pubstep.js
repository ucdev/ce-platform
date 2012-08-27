/*! app/models/activity_pubstep 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubstep
*/
define("app/models/Activity_pubstep",function(require,app) {
	app.models.Activity_pubstep = app.Model.extend({
			url: function() {
				base = "/api/activity_pubsteps/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

/*! app/models/activity_pubstep 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubstep
*/
define("app/models/activity_pubstep",["require","app"],function(require,app) {
	var Activity_pubstepModel = app.Model.extend({
		url: function() {
			base = "/api/activity_pubsteps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_pubstepModel)
});

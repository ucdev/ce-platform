/*! app/models/activity_step 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_step
*/
define("app/models/activity_step",["require","app"],function(require,app) {
	var Activity_stepModel = app.Model.extend({
		url: function() {
			base = "/api/activity_steps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_stepModel)
});

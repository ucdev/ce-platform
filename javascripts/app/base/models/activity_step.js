/*! app/models/activity_step 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_step
*/
define("app/models/activity_step",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_stepModel = AppModel.extend({
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

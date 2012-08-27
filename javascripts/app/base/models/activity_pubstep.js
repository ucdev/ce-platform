/*! app/models/activity_pubstep 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubstep
*/
define("app/models/activity_pubstep",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_pubstepModel = AppModel.extend({
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

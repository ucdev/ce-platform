/*! app/models/activity_application 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_application
*/
define("app/models/activity_application",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_applicationModel = AppModel.extend({
		url: function() {
			base = "/api/activity_applications/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_applicationModel)
});

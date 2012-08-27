/*! app/models/activity_application 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_application
*/
define("app/models/activity_application",["require","app"],function(require,app) {
	var Activity_applicationModel = app.Model.extend({
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

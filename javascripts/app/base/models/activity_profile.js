/*! app/models/activity_profile 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_profile
*/
define("app/models/activity_profile",["require","app"],function(require,app) {
	var Activity_profileModel = app.Model.extend({
		url: function() {
			base = "/api/activity_profiles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_profileModel)
});

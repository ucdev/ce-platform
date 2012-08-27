/*! app/models/activity_user 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_user
*/
define("app/models/activity_user",["require","app"],function(require,app) {
	var Activity_userModel = app.Model.extend({
		url: function() {
			base = "/api/activity_users/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_userModel)
});

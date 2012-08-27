/*! app/models/activity_user 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_user
*/
define("app/models/activity_user",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_userModel = AppModel.extend({
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

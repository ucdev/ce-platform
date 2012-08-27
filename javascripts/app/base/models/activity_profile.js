/*! app/models/activity_profile 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_profile
*/
define("app/models/activity_profile",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_profileModel = AppModel.extend({
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

/*! app/models/activity_profile 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_profile
*/
define("app/models/Activity_profile",function(require,app) {
	app.models.Activity_profile = app.Model.extend({
			url: function() {
				base = "/api/activity_profiles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

/*! app/models/activity_user 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_user
*/
define("app/models/Activity_user",function(require,app) {
	app.models.Activity_user = app.Model.extend({
			url: function() {
				base = "/api/activity_users/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

/*! app/models/activity_step 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_step
*/
define("app/models/Activity_step",function(require,app) {
	app.models.Activity_step = app.Model.extend({
			url: function() {
				base = "/api/activity_steps/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

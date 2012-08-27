/*! app/models/activity_container 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_container
*/
define("app/models/Activity_container",function(require,app) {
	app.models.Activity_container = app.Model.extend({
			url: function() {
				base = "/api/activity_containers/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

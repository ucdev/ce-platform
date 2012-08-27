/*! app/models/activity_application 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_application
*/
define("app/models/Activity_application",function(require,app) {
	app.models.Activity_application = app.Model.extend({
			url: function() {
				base = "/api/activity_applications/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

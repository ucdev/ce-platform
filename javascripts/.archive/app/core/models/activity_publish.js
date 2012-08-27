/*! app/models/activity_publish 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_publish
*/
define("app/models/Activity_publish",function(require,app) {
	app.models.Activity_publish = app.Model.extend({
			url: function() {
				base = "/api/activity_publishes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

/*! app/models/activity_publish 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_publish
*/
define("app/models/activity_publish",["require","app"],function(require,app) {
	var Activity_publishModel = app.Model.extend({
		url: function() {
			base = "/api/activity_publishes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_publishModel)
});

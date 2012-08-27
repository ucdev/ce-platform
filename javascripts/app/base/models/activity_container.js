/*! app/models/activity_container 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_container
*/
define("app/models/activity_container",["require","app"],function(require,app) {
	var Activity_containerModel = app.Model.extend({
		url: function() {
			base = "/api/activity_containers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_containerModel)
});

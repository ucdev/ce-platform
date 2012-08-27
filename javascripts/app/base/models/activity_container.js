/*! app/models/activity_container 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_container
*/
define("app/models/activity_container",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_containerModel = AppModel.extend({
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

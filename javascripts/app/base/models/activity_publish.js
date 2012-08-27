/*! app/models/activity_publish 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_publish
*/
define("app/models/activity_publish",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_publishModel = AppModel.extend({
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

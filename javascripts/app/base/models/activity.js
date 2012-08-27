/*! app/models/activity 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity
*/
define("app/models/activity",["require"],function(require) {
	var AppModel = require("app/model");
	var ActivityModel = AppModel.extend({
		url: function() {
			base = "/api/activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ActivityModel)
});

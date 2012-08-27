/*! app/models/activity_other 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_other
*/
define("app/models/activity_other",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_otherModel = AppModel.extend({
		url: function() {
			base = "/api/activity_others/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_otherModel)
});

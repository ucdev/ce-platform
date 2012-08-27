/*! app/models/activity_finbudget 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finbudget
*/
define("app/models/activity_finbudget",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finbudgetModel = AppModel.extend({
		url: function() {
			base = "/api/activity_finbudgets/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finbudgetModel)
});

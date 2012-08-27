/*! app/models/activity_credit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_credit
*/
define("app/models/activity_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_creditModel = AppModel.extend({
		url: function() {
			base = "/api/activity_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_creditModel)
});

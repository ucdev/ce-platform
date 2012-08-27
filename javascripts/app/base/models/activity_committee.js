/*! app/models/activity_committee 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_committee
*/
define("app/models/activity_committee",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_committeeModel = AppModel.extend({
		url: function() {
			base = "/api/activity_committees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_committeeModel)
});

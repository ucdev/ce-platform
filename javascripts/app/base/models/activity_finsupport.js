/*! app/models/activity_finsupport 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finsupport
*/
define("app/models/activity_finsupport",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finsupportModel = AppModel.extend({
		url: function() {
			base = "/api/activity_finsupports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finsupportModel)
});

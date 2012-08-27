/*! app/models/processstep_activity 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep_activity
*/
define("app/models/processstep_activity",["require"],function(require) {
	var AppModel = require("app/model");
	var Processstep_activityModel = AppModel.extend({
		url: function() {
			base = "/api/processstep_activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Processstep_activityModel)
});

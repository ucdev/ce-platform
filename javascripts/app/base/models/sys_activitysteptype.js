/*! app/models/sys_activitysteptype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitysteptype
*/
define("app/models/sys_activitysteptype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activitysteptypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_activitysteptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitysteptypeModel)
});

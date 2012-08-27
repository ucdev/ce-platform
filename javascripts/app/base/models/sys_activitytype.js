/*! app/models/sys_activitytype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitytype
*/
define("app/models/sys_activitytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activitytypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_activitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitytypeModel)
});

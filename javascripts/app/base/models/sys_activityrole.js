/*! app/models/sys_activityrole 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activityrole
*/
define("app/models/sys_activityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activityroleModel = AppModel.extend({
		url: function() {
			base = "/api/sys_activityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activityroleModel)
});

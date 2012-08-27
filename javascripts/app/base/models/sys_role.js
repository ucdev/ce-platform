/*! app/models/sys_role 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_role
*/
define("app/models/sys_role",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_roleModel = AppModel.extend({
		url: function() {
			base = "/api/sys_roles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_roleModel)
});

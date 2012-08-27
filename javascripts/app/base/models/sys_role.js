/*! app/models/sys_role 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_role
*/
define("app/models/sys_role",["require","app"],function(require,app) {
	var Sys_roleModel = app.Model.extend({
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

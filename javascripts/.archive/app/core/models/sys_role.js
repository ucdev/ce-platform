/*! app/models/sys_role 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_role
*/
define("app/models/Sys_role",function(require,app) {
	app.models.Sys_role = app.Model.extend({
			url: function() {
				base = "/api/sys_roles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

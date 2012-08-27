/*! app/models/sys_profn 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_profn
*/
define("app/models/sys_profn",["require","app"],function(require,app) {
	var Sys_profnModel = app.Model.extend({
		url: function() {
			base = "/api/sys_profns/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_profnModel)
});

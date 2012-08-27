/*! app/models/sys_orgtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_orgtype
*/
define("app/models/sys_orgtype",["require","app"],function(require,app) {
	var Sys_orgtypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_orgtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_orgtypeModel)
});

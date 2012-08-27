/*! app/models/sys_prinemp 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_prinemp
*/
define("app/models/sys_prinemp",["require","app"],function(require,app) {
	var Sys_prinempModel = app.Model.extend({
		url: function() {
			base = "/api/sys_prinemps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_prinempModel)
});

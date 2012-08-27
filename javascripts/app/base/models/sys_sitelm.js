/*! app/models/sys_sitelm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_sitelm
*/
define("app/models/sys_sitelm",["require","app"],function(require,app) {
	var Sys_sitelmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_sitelms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_sitelmModel)
});

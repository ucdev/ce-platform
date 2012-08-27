/*! app/models/sys_funrn 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrn
*/
define("app/models/sys_funrn",["require","app"],function(require,app) {
	var Sys_funrnModel = app.Model.extend({
		url: function() {
			base = "/api/sys_funrns/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_funrnModel)
});

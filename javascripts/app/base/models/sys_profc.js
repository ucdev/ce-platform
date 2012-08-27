/*! app/models/sys_profc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_profc
*/
define("app/models/sys_profc",["require","app"],function(require,app) {
	var Sys_profcModel = app.Model.extend({
		url: function() {
			base = "/api/sys_profcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_profcModel)
});

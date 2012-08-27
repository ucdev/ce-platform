/*! app/models/sys_cbofund 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbofund
*/
define("app/models/sys_cbofund",["require","app"],function(require,app) {
	var Sys_cbofundModel = app.Model.extend({
		url: function() {
			base = "/api/sys_cbofunds/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_cbofundModel)
});

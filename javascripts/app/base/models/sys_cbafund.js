/*! app/models/sys_cbafund 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbafund
*/
define("app/models/sys_cbafund",["require","app"],function(require,app) {
	var Sys_cbafundModel = app.Model.extend({
		url: function() {
			base = "/api/sys_cbafunds/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_cbafundModel)
});

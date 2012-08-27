/*! app/models/sys_cbofund 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbofund
*/
define("app/models/sys_cbofund",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_cbofundModel = AppModel.extend({
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

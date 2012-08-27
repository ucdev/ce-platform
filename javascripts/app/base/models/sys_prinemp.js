/*! app/models/sys_prinemp 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_prinemp
*/
define("app/models/sys_prinemp",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_prinempModel = AppModel.extend({
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

/*! app/models/sys_sitelm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_sitelm
*/
define("app/models/sys_sitelm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_sitelmModel = AppModel.extend({
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

/*! app/models/sys_funrn 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrn
*/
define("app/models/sys_funrn",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_funrnModel = AppModel.extend({
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

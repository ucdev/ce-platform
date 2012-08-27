/*! app/models/sys_profc 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profc
*/
define("app/models/sys_profc",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_profcModel = AppModel.extend({
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

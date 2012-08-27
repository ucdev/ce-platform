/*! app/models/sys_ethnicity 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_ethnicity
*/
define("app/models/sys_ethnicity",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_ethnicityModel = AppModel.extend({
		url: function() {
			base = "/api/sys_ethnicities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_ethnicityModel)
});

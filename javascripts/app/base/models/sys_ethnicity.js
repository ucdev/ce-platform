/*! app/models/sys_ethnicity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_ethnicity
*/
define("app/models/sys_ethnicity",["require","app"],function(require,app) {
	var Sys_ethnicityModel = app.Model.extend({
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

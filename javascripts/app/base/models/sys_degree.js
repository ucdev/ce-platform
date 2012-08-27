/*! app/models/sys_degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_degree
*/
define("app/models/sys_degree",["require","app"],function(require,app) {
	var Sys_degreeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_degreeModel)
});

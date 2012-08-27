/*! app/models/sys_degree 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_degree
*/
define("app/models/sys_degree",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_degreeModel = AppModel.extend({
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

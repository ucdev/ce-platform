/*! app/models/sys_occclass 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_occclass
*/
define("app/models/sys_occclass",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_occclassModel = AppModel.extend({
		url: function() {
			base = "/api/sys_occclasses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_occclassModel)
});

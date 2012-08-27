/*! app/models/sys_stepstatu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_stepstatu
*/
define("app/models/sys_stepstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stepstatuModel = AppModel.extend({
		url: function() {
			base = "/api/sys_stepstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stepstatuModel)
});

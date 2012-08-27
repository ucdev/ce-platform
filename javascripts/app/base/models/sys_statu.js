/*! app/models/sys_statu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_statu
*/
define("app/models/sys_statu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_statuModel = AppModel.extend({
		url: function() {
			base = "/api/sys_statuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_statuModel)
});

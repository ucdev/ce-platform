/*! app/models/sys_personstatu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_personstatu
*/
define("app/models/sys_personstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_personstatuModel = AppModel.extend({
		url: function() {
			base = "/api/sys_personstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_personstatuModel)
});

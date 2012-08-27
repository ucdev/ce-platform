/*! app/models/sys_assessresultstatu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessresultstatu
*/
define("app/models/sys_assessresultstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assessresultstatuModel = AppModel.extend({
		url: function() {
			base = "/api/sys_assessresultstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assessresultstatuModel)
});

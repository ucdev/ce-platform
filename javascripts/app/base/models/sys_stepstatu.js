/*! app/models/sys_stepstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_stepstatu
*/
define("app/models/sys_stepstatu",["require","app"],function(require,app) {
	var Sys_stepstatuModel = app.Model.extend({
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

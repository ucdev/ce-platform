/*! app/models/sys_personstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_personstatu
*/
define("app/models/sys_personstatu",["require","app"],function(require,app) {
	var Sys_personstatuModel = app.Model.extend({
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

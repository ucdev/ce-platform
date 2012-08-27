/*! app/models/sys_statu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_statu
*/
define("app/models/sys_statu",["require","app"],function(require,app) {
	var Sys_statuModel = app.Model.extend({
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

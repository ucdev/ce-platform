/*! app/models/sys_assessresultstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessresultstatu
*/
define("app/models/sys_assessresultstatu",["require","app"],function(require,app) {
	var Sys_assessresultstatuModel = app.Model.extend({
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

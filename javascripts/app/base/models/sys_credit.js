/*! app/models/sys_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_credit
*/
define("app/models/sys_credit",["require","app"],function(require,app) {
	var Sys_creditModel = app.Model.extend({
		url: function() {
			base = "/api/sys_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_creditModel)
});

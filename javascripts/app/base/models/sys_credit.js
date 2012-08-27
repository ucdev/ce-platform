/*! app/models/sys_credit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_credit
*/
define("app/models/sys_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_creditModel = AppModel.extend({
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

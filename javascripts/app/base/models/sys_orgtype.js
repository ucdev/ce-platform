/*! app/models/sys_orgtype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_orgtype
*/
define("app/models/sys_orgtype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_orgtypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_orgtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_orgtypeModel)
});

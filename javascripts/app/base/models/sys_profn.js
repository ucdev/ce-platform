/*! app/models/sys_profn 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profn
*/
define("app/models/sys_profn",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_profnModel = AppModel.extend({
		url: function() {
			base = "/api/sys_profns/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_profnModel)
});

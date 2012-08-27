/*! app/models/sys_funrc 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrc
*/
define("app/models/sys_funrc",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_funrcModel = AppModel.extend({
		url: function() {
			base = "/api/sys_funrcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_funrcModel)
});

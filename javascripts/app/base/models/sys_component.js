/*! app/models/sys_component 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_component
*/
define("app/models/sys_component",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_componentModel = AppModel.extend({
		url: function() {
			base = "/api/sys_components/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_componentModel)
});

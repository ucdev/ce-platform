/*! app/models/sys_state 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_state
*/
define("app/models/sys_state",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stateModel = AppModel.extend({
		url: function() {
			base = "/api/sys_states/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stateModel)
});

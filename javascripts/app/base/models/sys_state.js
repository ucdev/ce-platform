/*! app/models/sys_state 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_state
*/
define("app/models/sys_state",["require","app"],function(require,app) {
	var Sys_stateModel = app.Model.extend({
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

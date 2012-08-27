/*! app/models/sys_state 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_state
*/
define("app/models/Sys_state",function(require,app) {
	app.models.Sys_state = app.Model.extend({
			url: function() {
				base = "/api/sys_states/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

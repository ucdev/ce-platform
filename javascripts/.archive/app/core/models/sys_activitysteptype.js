/*! app/models/sys_activitysteptype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitysteptype
*/
define("app/models/Sys_activitysteptype",function(require,app) {
	app.models.Sys_activitysteptype = app.Model.extend({
			url: function() {
				base = "/api/sys_activitysteptypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

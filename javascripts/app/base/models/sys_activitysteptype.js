/*! app/models/sys_activitysteptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitysteptype
*/
define("app/models/sys_activitysteptype",["require","app"],function(require,app) {
	var Sys_activitysteptypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_activitysteptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitysteptypeModel)
});

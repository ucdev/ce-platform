/*! app/models/sys_activityrole 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activityrole
*/
define("app/models/Sys_activityrole",function(require,app) {
	app.models.Sys_activityrole = app.Model.extend({
			url: function() {
				base = "/api/sys_activityroles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

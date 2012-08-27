/*! app/models/sys_activitytype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitytype
*/
define("app/models/Sys_activitytype",function(require,app) {
	app.models.Sys_activitytype = app.Model.extend({
			url: function() {
				base = "/api/sys_activitytypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

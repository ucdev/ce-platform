/*! app/models/sys_activitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitytype
*/
define("app/models/sys_activitytype",["require","app"],function(require,app) {
	var Sys_activitytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_activitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitytypeModel)
});

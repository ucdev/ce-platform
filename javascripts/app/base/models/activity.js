/*! app/models/activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity
*/
define("app/models/activity",["require","app"],function(require,app) {
	var ActivityModel = app.Model.extend({
		url: function() {
			base = "/api/activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ActivityModel)
});

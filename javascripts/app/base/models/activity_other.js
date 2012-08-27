/*! app/models/activity_other 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_other
*/
define("app/models/activity_other",["require","app"],function(require,app) {
	var Activity_otherModel = app.Model.extend({
		url: function() {
			base = "/api/activity_others/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_otherModel)
});

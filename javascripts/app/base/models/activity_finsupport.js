/*! app/models/activity_finsupport 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finsupport
*/
define("app/models/activity_finsupport",["require","app"],function(require,app) {
	var Activity_finsupportModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finsupports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finsupportModel)
});

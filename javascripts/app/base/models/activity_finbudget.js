/*! app/models/activity_finbudget 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finbudget
*/
define("app/models/activity_finbudget",["require","app"],function(require,app) {
	var Activity_finbudgetModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finbudgets/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finbudgetModel)
});

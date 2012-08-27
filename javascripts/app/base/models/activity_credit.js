/*! app/models/activity_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_credit
*/
define("app/models/activity_credit",["require","app"],function(require,app) {
	var Activity_creditModel = app.Model.extend({
		url: function() {
			base = "/api/activity_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_creditModel)
});

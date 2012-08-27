/*! app/models/activity_committee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_committee
*/
define("app/models/activity_committee",["require","app"],function(require,app) {
	var Activity_committeeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_committees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_committeeModel)
});

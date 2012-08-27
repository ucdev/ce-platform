/*! app/models/activity_finfee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finfee
*/
define("app/models/activity_finfee",["require","app"],function(require,app) {
	var Activity_finfeeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finfees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finfeeModel)
});

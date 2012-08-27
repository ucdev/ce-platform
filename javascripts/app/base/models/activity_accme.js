/*! app/models/activity_accme 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_accme
*/
define("app/models/activity_accme",["require","app"],function(require,app) {
	var Activity_accmeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_accmes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_accmeModel)
});

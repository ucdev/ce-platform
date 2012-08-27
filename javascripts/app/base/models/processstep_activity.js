/*! app/models/processstep_activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processstep_activity
*/
define("app/models/processstep_activity",["require","app"],function(require,app) {
	var Processstep_activityModel = app.Model.extend({
		url: function() {
			base = "/api/processstep_activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Processstep_activityModel)
});

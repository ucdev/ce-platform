/*! app/models/processstep_activity 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep_activity
*/
define("app/models/Processstep_activity",function(require,app) {
	app.models.Processstep_activity = app.Model.extend({
			url: function() {
				base = "/api/processstep_activities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

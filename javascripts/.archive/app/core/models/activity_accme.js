/*! app/models/activity_accme 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_accme
*/
define("app/models/Activity_accme",function(require,app) {
	app.models.Activity_accme = app.Model.extend({
			url: function() {
				base = "/api/activity_accmes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

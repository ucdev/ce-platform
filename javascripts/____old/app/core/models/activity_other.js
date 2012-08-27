/*! app/models/activity_other 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_other
*/
define("app/models/Activity_other",function(require,app) {
	app.models.Activity_other = app.Model.extend({
			url: function() {
				base = "/api/activity_others/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

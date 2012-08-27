/*! app/models/activity_finbudget 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finbudget
*/
define("app/models/Activity_finbudget",function(require,app) {
	app.models.Activity_finbudget = app.Model.extend({
			url: function() {
				base = "/api/activity_finbudgets/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

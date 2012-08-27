/*! app/models/activity_credit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_credit
*/
define("app/models/Activity_credit",function(require,app) {
	app.models.Activity_credit = app.Model.extend({
			url: function() {
				base = "/api/activity_credits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

/*! app/models/activity_committee 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_committee
*/
define("app/models/Activity_committee",function(require,app) {
	app.models.Activity_committee = app.Model.extend({
			url: function() {
				base = "/api/activity_committees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

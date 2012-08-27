/*! app/models/activity 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity
*/
define("app/models/Activity",function(require,app) {
	app.models.Activity = app.Model.extend({
			url: function() {
				base = "/api/activities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

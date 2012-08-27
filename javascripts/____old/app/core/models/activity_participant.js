/*! app/models/activity_participant 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_participant
*/
define("app/models/Activity_participant",function(require,app) {
	app.models.Activity_participant = app.Model.extend({
			url: function() {
				base = "/api/activity_participants/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});

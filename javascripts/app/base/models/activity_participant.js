/*! app/models/activity_participant 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_participant
*/
define("app/models/activity_participant",["require","app"],function(require,app) {
	var Activity_participantModel = app.Model.extend({
		url: function() {
			base = "/api/activity_participants/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_participantModel)
});

/*! app/models/activity_participant 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_participant
*/
define("app/models/activity_participant",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_participantModel = AppModel.extend({
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
